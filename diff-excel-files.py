## Title:       Comparing between two excel files and display the unique values from the first one. 
## Author:      The Wolf of Sparta (@wolfofsparta)
## Version:     1.3
## Date:        2024-02-27


import pandas as pd
import os
import numpy as np

def compare_excel_files(file1, file2):
    if not os.path.exists(file1) or not os.path.exists(file2):
        return "One or both files do not exist."

    # Load the excel files into pandas dataframes
    df1 = pd.read_excel(file1)
    df2 = pd.read_excel(file2)

    # Flatten the dataframes to 1D arrays
    values1 = df1.values.flatten()
    values2 = df2.values.flatten()

    # Convert arrays to string type for case insensitive comparison
    values1_str = np.array([str(val).lower() for val in values1])
    values2_str = np.array([str(val).lower() for val in values2])

    # Find the unique values in file1 that are not in file2
    unique_values = list(set(values1_str) - set(values2_str))

    # Convert the list to a DataFrame
    unique_df = pd.DataFrame(unique_values, columns=['Unique Values'])

    # Write the DataFrame to a CSV file
    unique_df.to_csv('C:\\temp\\unique_values.csv', index=False)
    

    return "Unique values have been written to 'unique_values.csv'."

# Example usage:
file1 = "C:\\temp\file1.xlsx"
file2 = "C:\\temp\\file2.xlsx"
print(compare_excel_files(file1, file2))
