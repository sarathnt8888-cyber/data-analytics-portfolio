# Online Shopping UX & Conversion Analysis

Analyzed online shopping behaviour using Python, SQL, and Power BI
to identify conversion patterns and propose a UX improvement.

## Dashboard
![Shopping UX dashboard](Shopping%20UX%20dashboard.png)

## Business Questions
- How does purchase conversion differ by visitor type?
- How does conversion vary across major traffic types?
- How does product browsing differ between purchasing and
  non-purchasing sessions?

## Tools
- Python and pandas: data checks, preprocessing, and segmentation
- SQL: aggregation and comparison of conversion and browsing metrics
- Power BI and DAX: interactive dashboard, measures, and filters

## Workflow
1. Loaded 12,330 sessions and checked missing values and identical rows.
2. Removed 125 identical rows, leaving 12,205 sessions.
3. Standardized month labels and converted purchase outcomes to 1/0.
4. Compared conversion by month, visitor type, and engagement segment.
5. Validated session and purchase totals in SQL.
6. Built a one-page Power BI dashboard.

## Key Findings
- 1,908 of 12,205 retained sessions resulted in a purchase:
  a 15.63% conversion rate.
- New visitors converted at approximately 24.9%, compared with
  14.1% for returning visitors.
- Sessions viewing more than 18 product pages converted at
  approximately 21.7%, versus 9.7% for other sessions.
- Purchasing sessions involved more product browsing time.

## Proposed UX Test
Test easier access to recently viewed products for returning
visitors. Measure purchase conversion against a control group.
This is a proposed experiment, not a measured business improvement.

## Limitations
- Identical rows may represent distinct sessions because no unique
  session ID is available. Removing them was a preprocessing choice
  that may affect the results.
- The dataset includes 10 months; no full-year claims are made.
- Engagement is a project-defined segment: more than 18 product
  pages viewed.
- Associations do not establish causation.
- Revenue represents purchase status, not monetary revenue.
- Traffic types are numeric codes without verified channel names.
- Dashboard insight text describes the full dataset and does not
  change with filters.

## Data Source
UCI Machine Learning Repository:
[Online Shoppers Purchasing Intention Dataset](https://archive.ics.uci.edu/dataset/468/online+shoppers+purchasing+intention+dataset)
