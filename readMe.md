# Automated Sales BI Dashboard

An End-to-End Data Analytics and Business Intelligence Project built using Python, MySQL, SQL, and Power BI to analyze retail sales data and generate business insights.

This project simulates a real industry workflow where raw data is cleaned, processed, stored in a database, analyzed with SQL, and visualized using an interactive dashboard.

# Project Objective

The goal of this project is to transform raw sales data into meaningful insights that help answer key business questions such as:

-How sales change over time

-Which regions generate the most revenue

-Which categories produce the highest profit

-Which products perform best

## Technologies Used

-Python

-Pandas

-NumPy

-MySQL

-SQL

-Power BI

-Git & GitHub

# Project Workflow

Raw Sales Data (CSV)
        ↓
Python Data Cleaning
        ↓
Feature Engineering
        ↓
MySQL Database
        ↓
SQL Analysis
        ↓
Power BI Dashboard
        ↓
Business Insights

# Data Processing (Python)

Python was used to clean and transform the dataset.

* Key preprocessing steps:

-Standardizing column names

-Converting data types

-Handling missing values

-Removing duplicate rows

-Creating new analytical features

-New features created:

-order_month

-month_number

-ship_days

-profit_margin

-discount_bucket

These features support deeper business analysis.

# Database Layer (MySQL)

Database created:

automated_sales_bi

Main table:

superstore_clean

The cleaned dataset is stored in MySQL and used for analytical queries.

# SQL Analysis

SQL was used to analyze key business metrics including:

-Total Sales

-Total Profit

-Total Orders

-Average Order Value

-Monthly Sales Trends

-Regional Sales Performance

-Category Profit Analysis

-Product Sales & Profit Analysis

# Analytical views created:

-vw_monthly_sales_trend

-vw_region_performance

-vw_category_performance

# Power BI Dashboard

The dashboard provides interactive visual analysis.

-KPI Metrics

-Total Sales

-Total Profit

-Total Orders

-Average Order Value

* Visualizations

-Monthly Sales Trend

-Sales by Region

-Profit by Category

-Product Sales & Profit Table

* Filters

-Region

-Category

These features allow users to explore sales performance dynamically.

# Automation Pipeline

The project includes a Python automation script:

**scripts/data_pipeline.py**

This script automates the ETL process:

-Reads raw CSV data

-Cleans and preprocesses the dataset

-Creates analytical features

-Saves the cleaned dataset

-Loads the data into MySQL

# Run the pipeline using:

**python scripts/data_pipeline.py**

# Project Structure 
Automated_Sales_BI_Dashboard
│
├── data
│   ├── raw
│   └── cleaned
│
├── scripts
│   └── data_pipeline.py
│
├── sql
├── powerbi
├── docs
│
├── README.md
└── requirements.txt

# Key Business Insights

This project helps analyze:

-Sales performance across regions

-Profitability by product category

-Monthly business trends

-Top performing products

These insights help support data-driven decision making.

# Future Improvements

Possible enhancements:

-Generic automation pipeline for multiple datasets

-Scheduled data pipeline execution

-Automated reporting

-Advanced Power BI analytics



# Author

Abhishek Kumar

MCA Final Year Student
Aspiring Data Analyst / BI Analyst / ML Engineer / Data Scientist

