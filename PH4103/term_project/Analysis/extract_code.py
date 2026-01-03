import json

def extract_code(notebook_path):
    with open(notebook_path, 'r') as f:
        nb = json.load(f)
    
    for i, cell in enumerate(nb['cells']):
        if cell['cell_type'] == 'code':
            print(f"--- Cell {i} ---")
            print(''.join(cell['source']))
            print("\n")

if __name__ == "__main__":
    extract_code('/home/sdiptanuj/Tech/lockin/PH4103-term-project/Data.ipynb')
