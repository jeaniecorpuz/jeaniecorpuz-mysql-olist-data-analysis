# Olist SQL Analysis

## Overview

This project analyzes the **Olist e-commerce dataset** using MySQL to uncover insights into customer spending, revenue performance, product categories, product-level performance, and customer behavior.

The analysis answers a series of business questions using SQL techniques such as multi-table joins, aggregations, Common Table Expressions (CTEs), `CASE` statements, and window functions.

The objective is to demonstrate how SQL can be used to transform transactional e-commerce data into actionable business insights.

---

## Business Questions

### Q1. Who are the top 10 customers by total amount spent?

The analysis identifies the 10 customers with the highest total spending by joining customer, order, and payment data and aggregating payment values by unique customer.

**Top 10 Customers**

| Rank | Customer ID                        | Total Spent |
| ---: | ---------------------------------- | ----------: |
|    1 | `0a0a92112bd4c708ca5fde585afaa872` |   13,664.08 |
|    2 | `46450c74a0d8c5ca9395da1daac6c120` |    9,553.02 |
|    3 | `da122df9eeddfedc1dc1f5349a1a690c` |    7,571.63 |
|    4 | `763c8b1c9c68a0229c42c9fc6f662b93` |    7,274.88 |
|    5 | `dc4802a71eae9be1dd28f5d788ceb526` |    6,929.31 |
|    6 | `459bef486812aa25204be022145caa62` |    6,922.21 |
|    7 | `ff4159b92c40ebe40454e3e6a7c35ed6` |    6,726.66 |
|    8 | `4007669dec559734d6f53e029e360987` |    6,081.54 |
|    9 | `5d0a2980b292d049061542014e8960bf` |    4,809.44 |
|   10 | `eebb5dda148d3893cdaf5b5ca3040ccb` |    4,764.34 |

The highest-spending customer spent **R$13,664.08**, substantially more than the remaining customers in the top 10.

---

### Q2. What is the monthly revenue trend across the dataset?

Monthly revenue is calculated using order purchase dates and payment values. The analysis also counts the number of orders per month.

The results show a strong upward revenue trend throughout 2017 and into 2018.

Key observations include:

* Revenue increased from **R$138,488.04 in January 2017** to **R$779,677.88 in October 2017**.
* November 2017 recorded a major increase to **R$1,194,882.80**.
* Revenue remained above **R$1 million per month** for several months in early and mid-2018.
* The highest monthly revenue in the results was **R$1,160,785.48 in April 2018**.
* Revenue drops sharply in September and October 2018, with only **R$4,439.54** and **R$589.67**, respectively.

The unusually low revenue in the final months should be interpreted carefully because the dataset appears to contain only partial-month activity for those periods.

---

### Q3. What is the month-over-month change in revenue?

The analysis uses a CTE to calculate monthly revenue and the `LAG()` window function to compare each month against the previous month.

The largest positive month-over-month revenue change was:

**November 2017: +R$415,204.92**

The largest negative change was:

**September 2018: -R$1,017,985.78**

Other notable changes include:

* March 2017: **+R$157,955.59**
* May 2017: **+R$175,130.79**
* December 2017: **-R$316,481.32**
* January 2018: **+R$236,602.70**
* March 2018: **+R$167,188.78**

Overall, the results show periods of substantial revenue growth alongside significant month-to-month fluctuations.

---

### Q4. Which product categories generate the most revenue?

The analysis aggregates product prices by product category and ranks categories according to total revenue.

The highest-revenue category identified was:

**Health & Beauty — R$1,258,681.34**

This category generated approximately **9.39% of total category revenue** according to the top-category analysis.

---

### Q5. What are the top 3 products within each category by revenue?

The analysis calculates product-level revenue and uses `ROW_NUMBER()` with `PARTITION BY` to rank products independently within each product category.

This allows the business to identify the strongest revenue-generating products within each category rather than simply looking at overall product rankings.

**SQL approach:**

1. Calculate revenue for each product.
2. Group products by category.
3. Rank products within each category.
4. Return products with a ranking of 1–3.

This provides a more granular view of product performance and can support category-specific merchandising and promotional decisions.

---

### Q6. How can customers be segmented into Low, Medium, and High spend tiers?

Customers were segmented according to their total spending using the following thresholds:

|  Total Spending | Customer Tier |
| --------------: | ------------- |
|       < R$5,000 | Low           |
| R$5,000–R$8,000 | Medium        |
|       > R$8,000 | High          |

The results show that the highest-spending customer belongs to the **High** tier with total spending of **R$13,664.08**.

The next five customers fall within the **Medium** tier, while the remaining customers shown in the result fall within the **Low** tier.

This segmentation provides a simple framework for distinguishing customers based on their monetary value.

---

### Q7. How many customers are one-time versus repeat customers?

The customer analysis distinguishes customers who made a single purchase from those who made multiple purchases.

| Customer Type     | Number of Customers |
| ----------------- | ------------------: |
| One-time customer |              93,099 |
| Repeat customer   |               2,997 |

The dataset contains substantially more one-time customers than repeat customers.

Approximately **96.9%** of customers are one-time customers, while approximately **3.1%** are repeat customers.

This indicates a significant opportunity to investigate customer retention and repeat-purchase behavior.

> **Note:** The result for Q7 was provided, but the corresponding SQL query was not included in the uploaded query files.

---

### Q8. What percentage of total revenue comes from the top category?

The analysis calculates revenue for each category and divides the revenue of the highest-performing category by total category revenue.

The results show:

| Top Category    |        Revenue | % of Total Revenue |
| --------------- | -------------: | -----------------: |
| Health & Beauty | R$1,258,681.34 |              9.39% |

**Health & Beauty accounts for 9.39% of total category revenue.**

This indicates that although Health & Beauty is the highest-performing category, the majority of revenue comes from other categories combined.

---

## Key Findings

### 1. Revenue demonstrated strong growth over the core period

Monthly revenue increased substantially throughout 2017 and reached more than **R$1 million per month** during several periods in 2018.

The highest recorded monthly revenue was **R$1.16 million in April 2018**.

### 2. November 2017 experienced the largest positive monthly revenue increase

Revenue increased by approximately **R$415K** from October to November 2017.

This represents the largest positive month-over-month revenue change in the provided results.

### 3. Health & Beauty was the highest-revenue category

Health & Beauty generated **R$1.26 million**, representing **9.39% of total category revenue**.

However, because its share is below 10%, revenue is not overwhelmingly concentrated in a single category.

### 4. Customer retention is a major opportunity

The customer results show:

* **93,099 one-time customers**
* **2,997 repeat customers**

With approximately **96.9%** of customers classified as one-time customers, repeat purchasing represents a relatively small portion of the customer base.

### 5. A small group of customers generates substantial individual spending

The highest-spending customer generated **R$13,664.08**, while the second-highest generated **R$9,553.02**.

The customer-spending analysis can therefore help identify high-value customers for retention and targeted marketing strategies.

### 6. Revenue experienced substantial fluctuations

Although the overall trend during the core period was upward, several months experienced meaningful declines.

The most significant decline occurred in September 2018, when revenue fell by approximately **R$1.02 million** compared with August.

Because September and October 2018 contain very few orders relative to preceding months, these final-month declines should be treated cautiously and may reflect incomplete data coverage rather than an actual collapse in business performance.

---

## Recommendations

### 1. Focus on customer retention

The large proportion of one-time customers suggests an opportunity to increase repeat purchases.

Potential initiatives include:

* Post-purchase engagement campaigns
* Personalized product recommendations
* Follow-up promotions
* Loyalty or rewards programs
* Targeted offers based on previous purchases

The goal should be to convert a portion of one-time customers into repeat customers.

### 2. Develop strategies for high-value customers

The High-spend segment can be used to identify customers with greater monetary value.

Businesses could consider:

* Personalized promotions
* Exclusive offers
* Early access to products
* Loyalty incentives
* Targeted cross-selling

These customers should be monitored separately from the broader customer population.

### 3. Investigate the November 2017 revenue spike

The **R$415K increase in November 2017** represents a significant change in revenue.

The business could investigate whether this increase was associated with:

* Seasonal demand
* Promotional campaigns
* Product launches
* Increased order volume
* Changes in customer purchasing behavior

Understanding the drivers of this increase could help replicate successful strategies in future periods.

### 4. Prioritize high-performing product categories

Health & Beauty was the highest-revenue category.

The business could evaluate its successful products, pricing, promotions, and customer demand to determine whether similar strategies could be applied to other categories.

### 5. Monitor top products within each category

The top-three product analysis can support category-specific decisions around:

* Product promotion
* Inventory planning
* Merchandising
* Cross-selling
* Product assortment

Rather than evaluating products only at an overall level, businesses can use within-category rankings to identify category leaders.

### 6. Investigate major revenue fluctuations

Large month-over-month increases and decreases should be investigated to distinguish normal seasonality from unusual business events.

In particular, the dramatic decline in September 2018 should be validated against dataset coverage before drawing business conclusions.

---

## Tools & Skills

### Tools

* **MySQL**
* **GitHub**
* **SQL**

### SQL Skills Demonstrated

* Database creation and selection
* Table exploration
* Multi-table `JOIN`
* `SUM()`
* `COUNT()`
* `COUNT(DISTINCT)`
* `GROUP BY`
* `ORDER BY`
* `LIMIT`
* `CASE` statements
* `DATE_FORMAT()`
* Common Table Expressions (CTEs)
* Window functions
* `LAG()`
* `ROW_NUMBER()`
* `PARTITION BY`
* Percentage-of-total calculations
* Customer segmentation
* Revenue trend analysis
* Month-over-month analysis
* Product ranking
* Category-level analysis

---

## Files

| File           | Description                                    |
| -------------- | ---------------------------------------------- |
| `SQL1.txt`     | Q1 – Top 10 customers by total spending        |
| `SQL2.txt`     | Q2 – Monthly revenue trend                     |
| `SQL3.txt`     | Q3 – Month-over-month revenue change           |
| `SQL4.txt`     | Q4 – Top revenue-generating product categories |
| `SQL5.txt`     | Q5 – Top 3 products within each category       |
| `SQL6.txt`     | Q6 – Customer spending segmentation            |
| `SQL8.txt`     | Q8 – Revenue contribution of the top category  |
| `Result_1.csv` | Q1 query results                               |
| `Result_2.csv` | Q2 query results                               |
| `Result3.csv`  | Q3 query results                               |
| `Result4.csv`  | Q4 query results                               |
| `Result5.csv`  | Q5 query results                               |
| `Result6.csv`  | Q6 query results                               |
| `Result7.csv`  | Q7 customer type results                       |
| `Result8.csv`  | Q8 top-category revenue contribution           |
| `README.md`    | Project documentation                          |

---

## Project Structure

```text
Olist-SQL-Analysis/
│
├── SQL1.txt
├── SQL2.txt
├── SQL3.txt
├── SQL4.txt
├── SQL5.txt
├── SQL6.txt
├── SQL8.txt
│
├── Result1.csv
├── Result2.csv
├── Result3.csv
├── Result4.csv
├── Result5.csv
├── Result6.csv
├── Result7.csv
├── Result8.csv
│
└── README.md
```

## Conclusion

The analysis demonstrates how SQL can be used to answer practical e-commerce business questions across **customers, revenue, products, and categories**.

The results highlight several important areas:

* Strong revenue growth during the core period
* Significant month-over-month revenue fluctuations
* Health & Beauty as the leading revenue category
* A small repeat-customer base compared with one-time customers
* The presence of high-value customers
* Opportunities to improve customer retention and leverage high-performing products and categories

Overall, the analysis provides a data-driven foundation for understanding Olist's customer behavior and revenue performance while demonstrating practical SQL analysis skills.
