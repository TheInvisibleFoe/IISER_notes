# /// script
# requires-python = ">=3.13"
# dependencies = [
#     "marimo",
#     "pyzmq",
# ]
# ///

import marimo

__generated_with = "0.18.0"
app = marimo.App()


@app.cell
def _():
    import marimo
    marimo.md(r"""
    # Data Analysis for PH4103 Term Project - Lock-in Amplifier
    The experiments carried out were:

    + Measurement of the sub-milliohm resistance of copper wire.
    + Measurement of $\frac{1}{f}$ noise in a copper wire acting as a resistor.

    Data is stored in the root directory of the repository.
    """)
    return





@app.cell
def _():
    import glob
    import numpy as np
    import os
    import matplotlib.pyplot as plt
    # Define the path to the data files (parent directory)
    data_path_pattern = "../data_*.npz"
    
    # Find all files matching the pattern
    data_files = glob.glob(data_path_pattern)
    
    # Dictionary to store loaded data
    loaded_data = {}
    
    print(f"Found {len(data_files)} data files.")
    
    for file_path in data_files:
        try:
            # Load the .npz file
            data = np.load(file_path)
            # Use the filename as the key
            filename = os.path.basename(file_path)
            loaded_data[filename] = data
            print(f"Loaded {filename}")
        except Exception as e:
            print(f"Error loading {file_path}: {e}")
            
    # Plotting
    if loaded_data:
        fig, axes = plt.subplots(1, 1, dpi=300, figsize=(20,10))
        ax = axes
        ax.set_xlabel("Frequency [Hz]")
        ax.set_ylabel("Volts [V]") # Keeping the label from Data.ipynb, though index 3 is likely Phase
        ax.set_xscale("log")
        
        for filename, data in loaded_data.items():
            try:
                # Extract Frequency and Data (Index 3, likely Phase/Theta)
                freqRange = data["freqRange"][:]
                # Check if "data" key exists and has correct shape
                if "data" in data and data["data"].ndim == 3 and data["data"].shape[2] > 3:
                     X = data["data"][:, :, 3]
                     # Plotting. Note: X might be 2D (freq x something). Data.ipynb plots X1 which is data[:, :, 3].
                     # If X is 2D, we might need to flatten or select a column. 
                     # In Data.ipynb: X1 = loaded_data["data"][:, :, 3].
                     # Let's assume it's 1D or compatible with freqRange.
                     # Actually, if freqRange is 1D and X is 2D, matplotlib might handle it or error.
                     # Let's check Data.ipynb again. freqRange_coll is 1D. X1 is 2D?
                     # In Cell 2: X1 = loaded_data["data"][:, :, 3].
                     # In Cell 4: ax.plot(freqRange_coll, X1, ...)
                     # If X1 is 2D, it plots multiple lines.
                     ax.plot(freqRange, X, marker = "s", label=filename)
                else:
                    print(f"Skipping plot for {filename}: 'data' key missing or shape mismatch.")

            except Exception as e:
                print(f"Error plotting {filename}: {e}")

        fig.suptitle("Data Analysis Plot")
        ax.legend()
        # plt.show() # In marimo, plt.show() or just returning the figure works.
        fig.savefig("Phase_vs_freq.png", dpi=300) # Optional: save figure
    else:
        print("No data loaded to plot.")
    return


if __name__ == "__main__":
    app.run()
