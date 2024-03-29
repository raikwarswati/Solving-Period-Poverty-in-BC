# Documentation for ETL Tool and Configuration File

## Overview

This document provides a comprehensive guide on utilizing the ETL (Extract, Transform, Load) tool, designed to process and prepare data for analysis. Specifically tailored for handling period product distribution data, this tool streamlines the extraction of data from various sources, applies necessary transformations to clean and standardize the data, and finally loads it into a structured format ready for analysis or dashboard visualization.

### Python Script: `distribution.py`

The Python script `distribution.py` forms the core of the ETL tool, executing the following key functions:

1. **Extract**: Reads data from specified Excel files.
2. **Transform**: Applies data cleaning, fills missing values, renames columns, and adjusts data to the desired format.
3. **Load**: Exports the processed data into a CSV file.

### Configuration File: `distribution.yaml`

The `distribution.yaml` file allows users to specify parameters for the ETL process without altering the Python code. This YAML file is divided into several sections, each serving a specific purpose in the ETL pipeline.

## How to Use

### Preparing the Configuration File

Before running the ETL tool, ensure the `distribution.yaml` file is correctly set up according to your data and requirements. Here's a breakdown of the sections you need to configure:

- **file_settings**: Defines the path to the source Excel file, the sheet name to extract data from, the header row, and the number of rows to read.
- **column_settings**: Contains settings for handling missing values, renaming columns, and specifying the year and region for the data.
  - `fill_values`: Specifies how to fill in missing data. `default` applies a universal fill value, while `specific` allows column-wise customization.
  - `rename_columns`: Maps original column names to more descriptive or standardized names.
  - `desired_columns`: Lists the columns to be included in the final output, ensuring only relevant data is processed.
- **output_settings**: Determines the path and filename for the output CSV file, where the processed data will be saved.

### Running the ETL Tool

With the configuration file set, run the `distribution.py` script as follows:

```bash
python distribution.py
