import numpy as np
import srlock
import time

res = "GPIB0::8::INSTR"

with srlock.SR830(resource=res, timeout=10000) as lia:
    print("IDN:", lia.idn())  # IDN?
    lia.outx(1)  # ensure responses to GPIB
    print("Current phase (deg):", lia.phas())  # PHAS?
    lia.fmod(1)  # internal reference
    print("Freq set, read back:", lia.freq())

    # Starting data collection
    freqRange = [i for i in range(5, 100000, 50)]
    voltRange = [i / 10 for i in range(0, 100)]

    # Data collection
    data = np.zeros((len(freqRange), len(voltRange), 4))
    noise = np.zeros((len(freqRange), len(voltRange), 2))

    # Config
    run = 15
    timeConst = 3  # in seconds

    lia.oflt(timeConst)

    for i in range(len(freqRange)):
        for j in range(len(voltRange)):
            lia.slvl(voltRange[j])
            lia.freq(freqRange[i])
            lia.aphs()
            time.sleep(timeConst)
            lia.agan()
            time.sleep(timeConst)
            print("Frequency:", freqRange[i], "Voltage:", voltRange[j])
            time.sleep(0.1)
            # Poll for values
            runData = np.zeros((run, 4))
            for o in range(run):
                snap_vals = lia.snap([1, 2, 3, 4])
                runData[o, 0] = snap_vals[0]
                runData[o, 1] = snap_vals[1]
                runData[o, 2] = snap_vals[2]
                runData[o, 3] = snap_vals[3]
                time.sleep(3)
            m = np.mean(runData, axis=0)
            n = np.std(runData, axis=0)
            data[i, j] = m
            noise[i, j] = n

# Save data
np.savez("data.npz", freqRange=freqRange, voltRange=voltRange, data=data, noise=noise)
