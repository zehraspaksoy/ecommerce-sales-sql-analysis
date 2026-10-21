# Brazilian E-Commerce Sales Analysis | SQL

## Project Overview

This project analyzes Brazilian e-commerce transactions from the Olist dataset using SQLite.

The goal is to explore order trends, sales performance, product categories, and seasonal purchasing patterns to generate actionable business insights.

## Dataset

- Source: Brazilian E-Commerce Public Dataset by Olist
- Platform: Kaggle
- Database: SQLite
- Tools: DB Browser for SQLite, SQL, GitHub

## Analysis Performed

1. Order status distribution and cancellation rates
2. Monthly order volume and growth analysis
3. Revenue and Average Order Value (AOV)
4. Top-selling products and categories
5. Category revenue contribution
6. Monthly revenue trends
7. Black Friday sales performance

## Key Findings

- **Delivered Orders:** 96,478
- **Delivered Product Sales:** BRL 13,221,498.11
- **Average Order Value:** BRL 137.04
- **Top Revenue Category:** Health & Beauty (9.33%)
- **November 2017 Revenue Growth:** 52.37%
- **November 2017 Order Growth:** Approximately 62.8%
- **Black Friday 2017:** BRL 149,916.58 in product sales, approximately 5.19 times the average of other November days.

Revenue figures represent product sales values excluding shipping costs. The analysis does not measure net profit.

## SQL Skills Demonstrated

- JOIN and LEFT JOIN
- GROUP BY and ORDER BY
- Aggregate Functions
- Common Table Expressions (CTEs)
- Window Functions (LAG)
- Date Functions
- Conditional Filtering
- Revenue and Growth Calculations

## Project Files

- `01_orders_analysis.sql` — Order trends, order status, and category analysis
- `02_sales_analysis.sql` — Revenue, AOV, and Black Friday analysis

## Future Improvements

- Customer segmentation analysis
- Data visualization and dashboard creation
- Further investigation of seasonal trends
- ## How to Run This Project

### 1. Download the Dataset

Download the Brazilian E-Commerce Public Dataset by Olist from Kaggle:

https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

### 2. Install SQLite

Install DB Browser for SQLite:

https://sqlitebrowser.org/

### 3. Create the Database

1. Open DB Browser for SQLite.
2. Create a new database named `ecommerce_analysis.db`.
3. Go to File > Import > Table from CSV file.
4. Import the following CSV files:

| CSV File | SQLite Table Name |
|---|---|
| olist_orders_dataset.csv | orders |
| olist_order_items_dataset.csv | order_items |
| olist_products_dataset.csv | products |
| product_category_name_translation.csv | category_translation |

Make sure "Column names in first line" is enabled and the field separator is a comma.

### 4. Run the SQL Queries

1. Open `ecommerce_analysis.db` in DB Browser for SQLite.
2. Navigate to the Execute SQL tab.
3. Open `01_orders_analysis.sql` or `02_sales_analysis.sql`.
4. Execute the queries individually to explore the results.

### 5. Explore the Findings

The analyses cover order trends, product sales, category performance, revenue growth, and Black Friday sales patterns.

All monetary figures are reported in Brazilian Real (BRL). Product sales values exclude shipping costs.
