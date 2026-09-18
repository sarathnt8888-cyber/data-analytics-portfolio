# Swiggy vs Zomato Platform Performance Analysis

Tools: Python (Pandas), SQL (MySQL), Power BI, Excel | Personal Project | 2026

## Overview
An end-to-end analysis comparing Swiggy and Zomato platform performance across Indian cities — from raw data cleaning through SQL analysis to an interactive Power BI dashboard.

## What Was Done
- Analyzed 8,000 restaurant-platform records across 10 Indian cities using Python (Pandas) and SQL to compare Swiggy and Zomato on revenue, order volume, ratings, and delivery performance
- Cleaned and transformed raw data in Python, including unpivoting 12 platform-specific columns into a normalized structure for relational analysis
- Wrote MySQL queries using window functions (RANK, AVG() OVER PARTITION BY city) and CASE statements to segment restaurants into 4 price tiers
- Built an interactive Power BI dashboard with 6+ visuals — city-level revenue comparisons, KPI cards, platform/city slicers, scatter plots, and price-tier breakdowns
- Applied statistical comparison across cities and platforms to surface performance patterns
- Delivered a full pipeline from raw CSV → SQL database → interactive dashboard (ETL, querying, visualization)

## Dashboard



![Swiggy vs Zomato Dashboard](dashboard-overview.png)



## Key Findings
- Platform performance is nearly balanced overall: Zomato better in 46.8% of cases vs. Swiggy in 46.4%
- Revenue leadership is evenly split — 5 cities favoring each platform
- Price-tier segmentation (4 tiers) reveals distinct performance patterns by restaurant pricing category

## Files
- Cleaned Excel dataset
- SQL queries (window functions, price-tier segmentation)
- Python notebook (data cleaning & transformation)
- Power BI dashboard (.pbix)
