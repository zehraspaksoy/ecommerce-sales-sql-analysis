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
