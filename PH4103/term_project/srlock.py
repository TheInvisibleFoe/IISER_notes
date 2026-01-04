"""
srlock.py - A Python wrapper for the Stanford Research SR830 lock-in

Requires: pyvisa
Notes:
 - This implements a high-coverage set of commands described in the SR830
   manual. It also exposes a low-level send/query API so you can call any
   SR830 command not covered explicitly by a convenience method.
 - The SR830's Interface Ready bit (Serial Poll status byte bit 1, value=2)
   is polled after commands when requested to ensure the instrument has
   finished executing the command before continuing. This follows the
   manual's recommendation for GPIB usage.
 - Binary transfer helpers for TRCB? (IEEE float) and TRCL? (LIA non-normalized)
   are implemented. For TRCB? the code reads raw IEEE floats; for TRCL? the LIA
   format is decoded as: mantissa (signed 16-bit) and exponent (signed 16-bit)
   and value = mantissa * 2**(exp - 124).
"""

import time
import struct
from typing import Optional, Sequence, Tuple, List, Union

import pyvisa as visa  # pip install pyvisa

# If using the NI backend, environment must be set up (NI-VISA).


class SR830Error(Exception):
    pass


class SR830:
    """
    High-level driver for SR830 via GPIB (pyvisa).
    Provide resource_name like 'GPIB0::8::INSTR' or pass address and bus.
    """

    # Serial Poll Interface Ready bit (bit 1 -> value 2)
    _IFC_READY_MASK = 0x02

    def __init__(
        self,
        resource: Optional[str] = None,
        gpib_bus: int = 0,
        address: Optional[int] = None,
        timeout: int = 5000,
    ):
        """
        Create an SR830 object.
        - resource: full VISA resource string, e.g. 'GPIB0::8::INSTR'. If provided, address/gpib_bus are ignored.
        - gpib_bus: GPIB adapter number (default 0)
        - address: numeric GPIB address of the SR830 (1-30)
        - timeout: communication timeout in milliseconds
        """
        self.rm = visa.ResourceManager()
        self._resource_string = resource
        if resource is None:
            if address is None:
                raise ValueError(
                    "Either resource (VISA string) or address must be provided."
                )
            # construct a common VISA resource string
            self._resource_string = f"GPIB{gpib_bus}::{address}::INSTR"

        # open the instrument
        self.inst = self.rm.open_resource(self._resource_string)
        self.inst.timeout = timeout  # ms
        # Configure read termination (GPIB uses '\n' / EOI by default with VISA)
        # set termination for reads/writes; pyvisa adds it if the device returns it.
        # The SR830 uses LF termination on GPIB for queries.
        self.inst.read_termination = "\n"
        self.inst.write_termination = "\n"

    # Low-level helpers
    def _serial_poll_status(self) -> int:
        """
        Read the Serial Poll Status Byte (STB). This uses VISA's read_stb() which
        performs the serial poll and returns the byte value (0..255).
        """
        try:
            stb = self.inst.read_stb()
            return int(stb)
        except Exception as e:
            raise SR830Error(f"Serial poll failed: {e}")

    def _wait_for_ifc_ready(self, timeout_s: float = 5.0, poll_interval: float = 0.01):
        """
        Poll the Serial Poll Status Byte until the Interface Ready bit (bit 1, value 2)
        is set or until timeout_s expires. Raises SR830Error on timeout.
        This follows the manual suggestion to poll the interface ready (IFC RDY) bit.
        """
        deadline = time.time() + timeout_s
        while time.time() < deadline:
            stb = self._serial_poll_status()
            if (stb & self._IFC_READY_MASK) != 0:
                return
            time.sleep(poll_interval)
        raise SR830Error(
            "Timeout waiting for instrument to become ready (IFC RDY bit)."
        )

    def send(self, cmd: str, wait_for_completion: bool = True, timeout_s: float = 5.0):
        """
        Send a command (no returned value). If wait_for_completion is True,
        poll the Interface Ready bit until the SR830 finishes executing the command.
        cmd should NOT include trailing LF/CR; pyvisa will append the write_termination.
        """
        # allow passing many commands separated by semicolons as manual says
        self.inst.write(cmd)
        if wait_for_completion:
            self._wait_for_ifc_ready(timeout_s=timeout_s)

    def query(self, cmd: str, timeout_s: float = 5.0) -> str:
        """
        Send a query (command ending with '?') and return the ASCII response string.
        The manual: responses on GPIB are terminated by LF.
        After writing, wait for the instrument to be ready then read.
        """
        # Write and block until instrument accepts command
        self.inst.write(cmd)
        # Wait for command execution to finish (IFC RDY)
        self._wait_for_ifc_ready(timeout_s=timeout_s)
        # Now read the response (should be newline-terminated)
        resp = self.inst.read()
        return resp.strip()

    def read_raw(
        self, num_bytes: Optional[int] = None, timeout_s: float = 5.0
    ) -> bytes:
        """
        Read raw bytes from instrument. If num_bytes is None, read until termination/EOI.
        Use caution for binary transfers: instrument may send bytes with no terminator.
        """
        if num_bytes is None:
            return self.inst.read_raw()
        # When reading a fixed number of bytes, use read_bytes
        return self.inst.read_bytes(num_bytes)

    # Generic convenience
    def idn(self) -> str:
        "Return the ❊IDN? string (device identification)."
        return self.query("*IDN?")

    def reset(self):
        "Reset the instrument (❊RST) - note this may take time and will clear scans."
        self.send("*RST", wait_for_completion=True, timeout_s=10.0)

    def outx(self, mode: int):
        "Select output interface: 0=RS232, 1=GPIB"
        self.send(f"OUTX {int(mode)}")

    def trig(self):
        "Software trigger (TRIG)"
        self.send("TRIG")

    # If you need any command not explicitly implemented below, use this:
    def raw_command(self, cmd: str, expect_reply: bool = False) -> Optional[str]:
        """
        Send an arbitrary SR830 command. If expect_reply=True, runs query() and returns string.
        This provides access to any command from the manual not covered by a helper.
        """
        if expect_reply:
            return self.query(cmd)
        else:
            self.send(cmd)
            return None

    # Reference & phase commands
    def phas(self, x: Optional[float] = None) -> Optional[float]:
        "PHAS {x} set phase shift; PHAS? query. Returns new phase on query."
        if x is None:
            resp = self.query("PHAS?")
            return float(resp)
        else:
            self.send(f"PHAS {float(x):.2f}")
            return None

    def fmod(self, i: Optional[int] = None) -> Optional[int]:
        "FMOD {i} set/query reference source (1 internal, 0 external)."
        if i is None:
            return int(self.query("FMOD?"))
        else:
            self.send(f"FMOD {int(i)}")
            return None

    def freq(self, f: Optional[float] = None) -> Optional[float]:
        "FREQ {f} set internal reference frequency (when internal). Query with FREQ?."
        if f is None:
            return float(self.query("FREQ?"))
        else:
            self.send(f"FREQ {float(f)}")
            return None

    def rslp(self, i: Optional[int] = None) -> Optional[int]:
        "RSLP {i} reference trigger selection when external reference (0 sine zero crossing, 1 TTL rising, 2 TTL falling)."
        if i is None:
            return int(self.query("RSLP?"))
        else:
            self.send(f"RSLP {int(i)}")
            return None

    def harm(self, i: Optional[int] = None) -> Optional[int]:
        "HARM {i} set/query detection harmonic (1..19999)."
        if i is None:
            return int(self.query("HARM?"))
        else:
            self.send(f"HARM {int(i)}")
            return None

    def slvl(self, x: Optional[float] = None) -> Optional[float]:
        "SLVL {x} set/query sine output amplitude in V (0.004 .. 5.0)."
        if x is None:
            return float(self.query("SLVL?"))
        else:
            self.send(f"SLVL {float(x)}")
            return None

    # Input and filter commands
    def isrc(self, i: Optional[int] = None) -> Optional[int]:
        "ISRC {i} input configuration: A=0, A-B=1, I(1M)=2, I(100M)=3"
        if i is None:
            return int(self.query("ISRC?"))
        else:
            self.send(f"ISRC {int(i)}")
            return None

    def ignd(self, i: Optional[int] = None) -> Optional[int]:
        "IGND {i} input shield grounding: Float=0, Ground=1"
        if i is None:
            return int(self.query("IGND?"))
        else:
            self.send(f"IGND {int(i)}")
            return None

    def icpl(self, i: Optional[int] = None) -> Optional[int]:
        "ICPL {i} input coupling: AC=0, DC=1"
        if i is None:
            return int(self.query("ICPL?"))
        else:
            self.send(f"ICPL {int(i)}")
            return None

    def ilin(self, i: Optional[int] = None) -> Optional[int]:
        "ILIN {i} input line notch filter status. i=0..3"
        if i is None:
            return int(self.query("ILIN?"))
        else:
            self.send(f"ILIN {int(i)}")
            return None

    # Gain & time constant commands
    def sens(self, i: Optional[int] = None) -> Optional[int]:
        "SENS {i} set/query sensitivity index (see manual table)."
        if i is None:
            return int(self.query("SENS?"))
        else:
            self.send(f"SENS {int(i)}")
            return None

    def rmod(self, i: Optional[int] = None) -> Optional[int]:
        "RMOD {i} reserve mode: 0 High Reserve, 1 Normal, 2 Low Noise"
        if i is None:
            return int(self.query("RMOD?"))
        else:
            self.send(f"RMOD {int(i)}")
            return None

    def oflt(self, i: Optional[int] = None) -> Optional[int]:
        "OFLT {i} time constant selection (index 0..19 mapping in manual)."
        if i is None:
            return int(self.query("OFLT?"))
        else:
            self.send(f"OFLT {int(i)}")
            return None

    def ofsl(self, i: Optional[int] = None) -> Optional[int]:
        "OFSL {i} filter slope: 0..3 (6,12,18,24 dB/oct)"
        if i is None:
            return int(self.query("OFSL?"))
        else:
            self.send(f"OFSL {int(i)}")
            return None

    def sync(self, i: Optional[int] = None) -> Optional[int]:
        "SYNC {i} synchronous filter: 0 off, 1 on (<200Hz detection frequency)."
        if i is None:
            return int(self.query("SYNC?"))
        else:
            self.send(f"SYNC {int(i)}")
            return None

    # Display & output commands
    def ddef(self, i: int, j: int = 0, k: int = 0) -> Optional[Tuple[int, int]]:
        """
        DDEF i, j, k - set display i (1=CH1,2=CH2) to quantity j and ratio k.
        Query: DDEF? i returns "j,k" string.
        """
        if j is None:
            # query mode: not sensible here, keep signature consistent
            raise ValueError("To query, call ddef_query(i)")
        self.send(f"DDEF {int(i)},{int(j)},{int(k)}")

    def ddef_query(self, i: int) -> Tuple[int, int]:
        resp = self.query(f"DDEF? {int(i)}")
        parts = resp.split(",")
        return (int(parts[0]), int(parts[1]) if len(parts) > 1 else 0)

    def fpop(self, i: int, j: Optional[int] = None) -> Optional[int]:
        "FPOP i, j sets front panel output source; FPOP? i queries j."
        if j is None:
            return int(self.query(f"FPOP? {int(i)}"))
        else:
            self.send(f"FPOP {int(i)},{int(j)}")
            return None

    def oexp(self, i: int, x: Optional[float] = None, j: Optional[int] = None):
        """
        OEXP i,x,j sets offset percent and expand. Query OEXP? i returns "x,j".
        i: 1=X,2=Y,3=R
        """
        if x is None and j is None:
            resp = self.query(f"OEXP? {int(i)}")
            off, ex = resp.split(",")
            return float(off), int(ex)
        if x is None or j is None:
            raise ValueError("Both x and j are required to set OEXP")
        self.send(f"OEXP {int(i)},{float(x):.2f},{int(j)}")

    def aoff(self, i: int):
        "AOFF i - auto offset X(1), Y(2) or R(3)."
        self.send(f"AOFF {int(i)}")

    # Aux input/output
    def oaux(self, i: int) -> float:
        "OAUX? i query Aux Input i (1..4) - returns volts as float."
        resp = self.query(f"OAUX? {int(i)}")
        return float(resp)

    def auxv(self, i: int, x: Optional[float] = None) -> Optional[float]:
        "AUXV i,x set/query Aux Output i (1..4) to x volts (-10.5..10.5)."
        if x is None:
            return float(self.query(f"AUXV? {int(i)}"))
        else:
            self.send(f"AUXV {int(i)},{float(x)}")
            return None

    # Setup commands
    def ovrm(self, i: Optional[int] = None) -> Optional[int]:
        "OVRM {i} set/query override remote (0 no, 1 yes)"
        if i is None:
            return int(self.query("OVRM?"))
        else:
            self.send(f"OVRM {int(i)}")
            return None

    def kclk(self, i: Optional[int] = None) -> Optional[int]:
        "KCLK {i} key click On(1)/Off(0)"
        if i is None:
            return int(self.query("KCLK?"))
        else:
            self.send(f"KCLK {int(i)}")
            return None

    def alrm(self, i: Optional[int] = None) -> Optional[int]:
        "ALRM {i} alarm On(1)/Off(0)"
        if i is None:
            return int(self.query("ALRM?"))
        else:
            self.send(f"ALRM {int(i)}")
            return None

    def sset(self, i: int):
        "SSET i - save setup into buffer i (1..9)"
        self.send(f"SSET {int(i)}")

    def rset(self, i: int):
        "RSET i - recall setup buffer i (1..9)"
        self.send(f"RSET {int(i)}")

    # Auto functions
    def agan(self):
        "AGAN - Auto Gain"
        self.send("AGAN")

    def arsv(self):
        "ARSV - Auto Reserve"
        self.send("ARSV")

    def aphs(self):
        "APHS - Auto Phase"
        self.send("APHS")

    # Data storage & acquisition
    def srat(self, i: Optional[int] = None) -> Optional[int]:
        "SRAT {i} set/query sample rate (0..13 or 14=Trigger)"
        if i is None:
            return int(self.query("SRAT?"))
        else:
            self.send(f"SRAT {int(i)}")
            return None

    def send_mode(self, i: Optional[int] = None) -> Optional[int]:
        "SEND {i} set/query end-of-buffer mode: 0=1Shot,1=Loop"
        if i is None:
            return int(self.query("SEND?"))
        else:
            self.send(f"SEND {int(i)}")
            return None

    def tstr(self, i: Optional[int] = None) -> Optional[int]:
        "TSTR {i} set/query trigger start mode (1 trigger starts scan)"
        if i is None:
            return int(self.query("TSTR?"))
        else:
            self.send(f"TSTR {int(i)}")
            return None

    def strt(self):
        "STRT - start/resume data storage"
        self.send("STRT")

    def paus(self):
        "PAUS - pause data storage"
        self.send("PAUS")

    def rest(self):
        "REST - reset data buffers (erase)"
        self.send("REST")

    # Data transfer commands
    def outp(self, i: int) -> float:
        """
        OUTP? i - read value of X(1), Y(2), R(3), theta(4)
        Returns float (volts or degrees)
        """
        return float(self.query(f"OUTP? {int(i)}"))

    def outr(self, i: int) -> float:
        """
        OUTR? i - read value of CH1 or CH2 display (i=1 or 2)
        """
        return float(self.query(f"OUTR? {int(i)}"))

    def snap(self, params: Sequence[int]) -> List[float]:
        """
        SNAP? i,j,{k...} - collect 2..6 parameters at same instant.
        Parameter mapping is described in the manual.
        Returns list of floats in same order requested.
        """
        if not (2 <= len(params) <= 6):
            raise ValueError("SNAP? requires between 2 and 6 parameters.")
        param_str = ",".join(str(int(p)) for p in params)
        resp = self.query(f"SNAP? {param_str}")
        parts = resp.split(",")
        return [float(p) for p in parts if p != ""]

    def spts(self) -> int:
        "SPTS? - return number of points stored in data buffer."
        return int(self.query("SPTS?"))

    def trca(self, channel: int, start_bin: int, count: int) -> List[float]:
        """
        TRCA? i, j, k - returns ASCII floating point values separated by commas.
        channel: 1 or 2
        start_bin: j (>=0)
        count: k (>=1)
        """
        cmd = f"TRCA? {int(channel)},{int(start_bin)},{int(count)}"
        resp = self.query(cmd)
        # response is comma separated, trailing comma may be present per manual
        parts = [p for p in resp.split(",") if p.strip() != ""]
        return [float(p) for p in parts]

    def trcb(self, channel: int, start_bin: int, count: int) -> List[float]:
        """
        TRCB? i,j,k - binary IEEE floating point (4 bytes per point).
        Returns list of floats.
        WARNING: According to the manual, do NOT check IFC RDY before reading the binary block.
        Implementation: write command WITHOUT waiting, then read count*4 bytes raw.
        """
        cmd = f"TRCB? {int(channel)},{int(start_bin)},{int(count)}"
        # Write command but do NOT wait for IFC RDY per manual note; the operation itself will send data
        # Some VISA backends require a delay; instead we directly use read_bytes after write.
        self.inst.write(cmd)
        # Now read 4*count bytes (each IEEE float is 4 bytes)
        nbytes = 4 * int(count)
        raw = self.inst.read_bytes(nbytes)
        # Interpret as little-endian floats (IEEE 754)
        vals = list(struct.unpack("<" + "f" * int(count), raw))
        return vals

    def trcl(self, channel: int, start_bin: int, count: int) -> List[float]:
        """
        TRCL? i,j,k - LIA non-normalized floating format: 4 bytes per point.
        Each point stored as two 16-bit words:
            - first word: mantissa (signed 16-bit)
            - second word: exponent (signed 16-bit)
        The value = mantissa * 2**(exponent - 124)
        Returns list of floats.
        """
        cmd = f"TRCL? {int(channel)},{int(start_bin)},{int(count)}"
        self.inst.write(cmd)
        nbytes = 4 * int(count)
        raw = self.inst.read_bytes(nbytes)
        vals = []
        # parse little-endian pairs of signed shorts
        for i in range(int(count)):
            offset = i * 4
            mantissa, exponent = struct.unpack("<hh", raw[offset : offset + 4])
            val = float(mantissa) * (2.0 ** (float(exponent) - 124.0))
            vals.append(val)
        return vals

    def fast(self, i: Optional[int] = None):
        "FAST {i} set/query fast data transfer. i=0 off,1 fast1,2 fast2"
        if i is None:
            return int(self.query("FAST?"))
        else:
            self.send(f"FAST {int(i)}")

    def strd(self):
        "STRD - start scan after 0.5s delay for FAST mode transfers"
        self.send("STRD")

    # Interface & status commands
    def cls(self):
        "CLS - clear all status registers (enable registers unaffected)."
        self.send("*CLS")

    def ese(self, i: Optional[int] = None):
        "ESE {i} set/query standard event enable register (0..255)"
        if i is None:
            return int(self.query("*ESE?"))
        else:
            self.send(f"*ESE {int(i)}")

    def esr(self, i: Optional[int] = None) -> Optional[int]:
        "ESR? query standard event status byte (read clears it)."
        if i is None:
            return int(self.query("*ESR?"))
        else:
            return int(self.query(f"*ESR? {int(i)}"))

    def sre(self, i: Optional[int] = None):
        "SRE {i} set/query serial poll enable register"
        if i is None:
            return int(self.query("*SRE?"))
        else:
            self.send(f"*SRE {int(i)}")

    def stb(self, i: Optional[int] = None):
        "STB? query serial poll status byte (read-only, doesn't clear bits)."
        if i is None:
            return int(self.query("*STB?"))
        else:
            return int(self.query(f"*STB? {int(i)}"))

    def psc(self, i: Optional[int] = None):
        "PSC {i} set value of power-on status clear bit"
        if i is None:
            return int(self.query("*PSC?"))
        else:
            self.send(f"*PSC {int(i)}")

    def erre(self, i: Optional[int] = None):
        "ERRE {i} set/query error status enable register"
        if i is None:
            return int(self.query("ERRE?"))
        else:
            self.send(f"ERRE {int(i)}")

    def errs(self, i: Optional[int] = None):
        "ERRS? query error status byte"
        if i is None:
            return int(self.query("ERRS?"))
        else:
            return int(self.query(f"ERRS? {int(i)}"))

    def liae(self, i: Optional[int] = None):
        "LIAE {i} set/query LIA (lock-in) status enable register"
        if i is None:
            return int(self.query("LIAE?"))
        else:
            self.send(f"LIAE {int(i)}")

    def lias(self, i: Optional[int] = None):
        "LIAS? query LIA status byte (read clears it)"
        if i is None:
            return int(self.query("LIAS?"))
        else:
            return int(self.query(f"LIAS? {int(i)}"))

    def close(self):
        "Close the VISA session."
        try:
            self.inst.close()
        except Exception:
            pass
        try:
            self.rm.close()
        except Exception:
            pass

    # context manager support
    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        self.close()


# Example usage
if __name__ == "__main__":
    # Example: open GPIB0 address 8 (adjust to your system)
    # NOTE: change the resource string to match your configuration.
    res = "GPIB0::8::INSTR"
    with SR830(resource=res, timeout=10000) as lia:
        print("IDN:", lia.idn())  # IDN?
        lia.outx(1)  # ensure responses to GPIB
        print("Current phase (deg):", lia.phas())  # PHAS?
        lia.fmod(1)  # internal reference
        lia.freq(1000.0)  # set internal freq to 1 kHz
        print("Freq set, read back:", lia.freq())  # FREQ?
        # Example snapshot of X and Y and frequency:
        snap_vals = lia.snap([1, 2, 9])  # X, Y, RefFreq
        print("SNAP X,Y,f:", snap_vals)
        # Example: read CH1 ASCII buffer points
        n = lia.spts()
        print("Points stored:", n)
        # To read binary IEEE trace (TRCB?) you'd use trcb:
        # ieee_vals = lia.trcb(1, 0, 10)
        # print(ieee_vals)
        # To read LIA format:
        # lia_vals = lia.trcl(1, 0, 10)
        # print(lia_vals)
