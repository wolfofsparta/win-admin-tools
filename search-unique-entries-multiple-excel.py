## Title:       Unique entries from multiple files
## Description: Analyze .xlsx files from a directory and returns a list of unique entries and their count
## Author:      The Wolf of Sparta (@wolfofsparta)
## Version:     1.3
## Date:        2024-02-27

## prereq's:
## pip install pandas
## pip install openpyxl

import os
import pandas as pd

def get_unique_servers(file_path):
    try:
        # Parsing the .xlsx file:
        df = pd.read_excel(file_path)

        ## Leaving a piece of code here to help get the index name of the Excel columns and insert the correct one below
        ## Uncomment if necessary for debugging
        # print("Column names:")
        # print(df.columns)

        # Here I had to hardcode the row number from where we need to analyze. The list of entries starts at A15, in case that changes, please change 15 with the new number of the row and "Unnamed: 0" with the new column name.
        servers_subset = df.loc[15:, 'Unnamed: 0']
        
        return servers_subset

    except Exception as e:
        print(f"Help me Obi Wan Kenobi, you're my only help?: {e}")
        return set() 

if __name__ == "__main__":
    # Input: Path to the directory that contains the files
    xlsx_dir= input("Enter the path to the directory containing the reports: ")

    # Initialize a set to store all unique entries 
    all_unique_servers = set()

    # Iterate over files inside the directory
    for filename in os.listdir(xlsx_dir):
        if filename.endswith(".xlsx"):
            file_path = os.path.join(xlsx_dir, filename)

            # Calling the function for each report:
            unique_servers = get_unique_servers(file_path)

            # Update the set of unique servers
            all_unique_servers.update(unique_servers)
        
    # Display the total number of unique entries:
    print(f"Unique servers: {all_unique_servers}")
    total_unique_servers = len(all_unique_servers)
    print(f"\nTotal number of unique entries is: {total_unique_servers}")
