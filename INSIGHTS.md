# Olist SQL Analysis — 1-Page Insights Summary

## Data Overview

The Olist dataset is an e-commerce transactional dataset analyzed across 6 tables: `customers`, `orders`, `order_payments`, `order_items`, `products`, and `product_category`. The monthly revenue analysis covers **September 2016 to October 2018**, with 25 month-level records returned. Data activity is uneven at the edges of the period, including only 3 orders in September 2016, 1 order in December 2016, and very low revenue in September–October 2018; November 2016 is also absent from the monthly results. These coverage patterns should be considered when interpreting revenue trends and large month-over-month changes.

## Business Insights

### 1. Revenue Grew Strongly, but Performance Was Volatile

Revenue increased substantially during the core period of the dataset. Monthly revenue rose from **R$138,488.04 in January 2017** to **R$1,194,882.80 in November 2017**, while the month-over-month analysis shows the largest positive change in November 2017 at **+R$415,204.92**. However, revenue was also volatile, with the largest negative change occurring in September 2018 at **−R$1,017,985.78**. This indicates strong growth potential but also highlights the need to understand the drivers behind major revenue fluctuations before using the trend for forecasting.

### 2. Customer Retention Represents a Major Opportunity

The customer analysis shows a strong concentration of one-time buyers: **93,099 customers were classified as one-time customers compared with only 2,997 repeat customers**, meaning approximately **96.9% of customers made only one purchase**. At the same time, the top customer by total spending generated **R$13,664.08**, demonstrating that individual customers can contribute significant revenue. Increasing the number of customers who return for additional purchases could therefore represent a meaningful opportunity for revenue growth.

### 3. Health & Beauty Leads, While Revenue Remains Diversified

**Health & Beauty** was the highest-revenue product category, generating **R$1,258,681.34**, equivalent to **9.39% of total category revenue**. Because the leading category accounts for less than 10% of category revenue, the results suggest that revenue is distributed across multiple product categories rather than being dominated by a single category. Health & Beauty can therefore serve as a benchmark for identifying successful category-level revenue drivers, while other categories may provide additional growth opportunities.

## Recommendations

### 1. Build a Customer Retention Program

Develop post-purchase campaigns, personalized product recommendations, and targeted incentives designed to encourage first-time customers to make a second purchase. This recommendation is supported by the **96.9% one-time customer rate**, while the high spending observed among top customers suggests that retaining valuable customers could have a meaningful revenue impact.

### 2. Investigate and Replicate Revenue Drivers

Investigate the factors behind the **November 2017 revenue increase** and the strong performance of the **Health & Beauty** category, then identify which successful practices can be applied to other categories or future campaigns. The **September 2018 revenue decline** should also be validated before being used for forecasting because the final months show unusually low activity.

---

*Source: Olist SQL queries and provided query-result CSVs (Q1, Q2, Q3, Q6, Q7, Q8). Q5 result values were not included in the supplied outputs.*
