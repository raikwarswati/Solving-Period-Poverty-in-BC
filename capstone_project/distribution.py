import pandas as pd
import yaml

# Extract Function
def extract_data(config):
    file_path = config['file_settings']['file_path']
    sheet_name = config['file_settings']['sheet_name']
    header_row = config['file_settings']['header_row'] - 1
    nrows = None if config['file_settings']['nrows'] == 'all' else int(config['file_settings']['nrows'])
    return pd.read_excel(file_path, sheet_name=sheet_name, header=header_row, nrows=nrows)

# Transform Functions
def fill_missing_values(df, fill_values):
    if 'specific' in fill_values:
        for col, value in fill_values['specific'].items():
            if col in df.columns:
                df[col].fillna(value, inplace=True)
    else:
        df.fillna(fill_values['default'], inplace=True)
    return df

def adjust_columns(df, config):
    desired_columns = config['column_settings']['desired_columns']
    rename_columns = config['column_settings']['rename_columns']
    df = df.rename(columns=rename_columns)
    missing_columns = set(desired_columns) - set(df.columns)
    for col in missing_columns:
        df[col] = 0
    return df[desired_columns]

# Load Function (Can be customized based on the requirement)
def load_data(df, output_path):
    df.to_csv(output_path, index=False)


# Main ETL Function
def run_etl(config_path):
    with open(config_path, 'r') as file:
        config = yaml.safe_load(file)

    df = extract_data(config)
    df = fill_missing_values(df, config['column_settings']['fill_values'])
    df = adjust_columns(df, config)
    df['Year'] = config['column_settings']['year']
    df['Region'] = config['column_settings']['region']

    output_path = config['output_settings']['output_path'] + config['output_settings']['file_name']
    load_data(df, output_path)


# Example Usage
if __name__ == "__main__":
    run_etl('distribution_2021.yaml')
