
# Project Documentation: Loading ETL Outputs to SQL Database Schema

This documentation provides a comprehensive guide on how to utilize the ETL (Extract, Transform, Load) tool's output files to populate a structured SQL database schema designed to organize data related to period product distribution, needs assessment, and organizational support for specific communities and groups.

## Overview

Following the development of an ETL tool and the creation of a relational database schema, this guide outlines the process for transferring the ETL output files into the SQL database. Notably, our AWS SQL database service has exceeded the free tier's monthly allowance. Consequently, this documentation also offers guidance on setting up and using a local or alternative SQL database environment to continue without incurring additional costs.

## Database Schema Setup

1. **SQL Script Execution**: Begin by executing the provided SQL script to create the database schema. This script establishes tables for organizations, regions, products, distributions, needs assessments, support groups, and communities.
2. **Local or Alternative SQL Database**: Due to limitations with the AWS SQL database's free tier, consider setting up a local SQL server or using another cloud provider within their free tier. Tools such as MySQL, PostgreSQL, or SQLite are suitable for local setups.

## Loading Data into the Database

With the database schema in place, follow these steps to import the ETL output files into your SQL database:

1. **Preparation**:
    - Ensure all ETL output CSV files are readily accessible.
    - Verify that the data matches the database schema requirements, especially the table columns.

2. **Data Import**:
    - Utilize your SQL database management system's import functionality to load data from the CSV files into the respective tables. 
    - For example, in MySQL, you can use the `LOAD DATA INFILE` command. PostgreSQL users might utilize the `COPY` command, while SQL Server offers the Bulk Insert feature.

3. **Considerations for Import**:
    - **Organizations**: Load data into the Organizations table, ensuring relationships with the Regions table are correctly established.
    - **Products**: Populate the Products table with the different types of menstrual products.
    - **Distributions & Needs Assessment**: Import data ensuring foreign keys link back to the Organizations and Products tables appropriately.
    - **Support Groups and Communities**: These new tables require populating with relevant data either extracted from existing sources or provided by stakeholders. Make sure to establish many-to-many relationships via the intermediary tables.

## Post-Import Checks

After importing the data:
- Verify the integrity of the data by running sample queries to check relationships and data accuracy.
- Ensure there are no orphaned records and that all foreign key relationships are correctly established.

## Alternatives to AWS SQL Database

Given the constraints with the AWS SQL database service, alternatives include:
- **Local SQL Servers**: MySQL, PostgreSQL, and SQLite offer robust solutions for local development and testing. They provide comprehensive documentation for setting up and importing data.
- **Other Cloud Providers**: Explore free tiers offered by Google Cloud SQL, Azure SQL Database, or other cloud providers, which may offer more lenient usage limits.

## Conclusion

This guide ensures that even with the limitations encountered with the AWS SQL database, the project can proceed efficiently. By setting up a local or alternative cloud SQL database, and following the structured approach to importing ETL tool output files, the project's data management goals remain achievable.

Remember, while this guide focuses on overcoming a specific limitation, the outlined approach offers a flexible foundation for data management practices applicable to various environments and constraints.
