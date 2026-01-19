# Step-by-step plan (do NOT skip)
🔹 Step 1: Profile the raw data (no cleaning yet)

Your only job here is to understand how dirty it is.

Run queries like:
- Row counts
- Null counts per column
- Distinct values for categories
- Min / max for numeric fields
- Date validity checks

👉 Output goes in your README under “Data Profiling”.

This is where analysts prove they didn’t guess.


## Step 2: Define cleaning rules (before writing SQL)

This is where most people mess up by “cleaning on vibes.”

Create a cleaning rules section (literally write it down):

Examples:

Empty strings → NULL

Negative quantities → invalid → remove

Prices ≤ 0 → invalid

Dates that don’t parse → NULL

Category casing standardized (e.g. coffee, Coffee, COFFEE → Coffee)

📌 This becomes documentation, not just code.


## Step 3: Build the stg layer (this is the core)

Key rules:
- No aggregates
- One row in, one row out
- Only cleaning + standardization


🔹 Step 4: Validate the staging layer

You now prove the cleaning worked.

Checks like:
- Any remaining NULLs where there shouldn’t be?
- Any negative values left?
- Row counts match expectations?

🔹 Step 5: Build the dw layer (analytics-ready)

Now you answer business questions.

Common DW tables:
Fact table
fact_sales
Dimensions
dim_products
dim_dates
dim_categories

Business questions you MUST answer (use these)

Pick 5–7 and go deep:
- What are the top-selling products by revenue?
- Which categories drive the most daily sales?
- What’s the average order value?
- Are there seasonal patterns?
- Which products have high volume but low revenue?
- How much data was lost due to invalid records?

Folders:
/sql
  ├── raw_checks.sql
  ├── staging_cleaning.sql
  ├── dw_models.sql
/docs
  ├── data_quality_report.md
  ├── assumptions.md


README sections recruiters love:
- Dataset overview
- Data quality issues found
- Cleaning rules
- Schema design
- Key insights
- Next improvements
