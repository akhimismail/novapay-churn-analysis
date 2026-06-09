-- ================================================
-- NovaPay Customer Churn & Revenue Intelligence
-- SQL Analysis | PostgreSQL
-- ================================================


-- Q1: Overall Churn Rate
SELECT 
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2
    ) AS churn_rate_pct
FROM novapay_customers;


-- Q2: MRR at Risk
SELECT 
    churn,
    COUNT(*) AS customer_count,
    ROUND(SUM(monthlycharges), 2) AS total_monthly_revenue,
    ROUND(AVG(monthlycharges), 2) AS avg_monthly_revenue
FROM novapay_customers
GROUP BY churn
ORDER BY churn;


-- Q3: Churn by Contract Type
SELECT 
    contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(
        SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2
    ) AS churn_rate_pct
FROM novapay_customers
GROUP BY contract
ORDER BY churn_rate_pct DESC;


-- Q4: Churn by Revenue Segment
SELECT 
    CASE 
        WHEN monthlycharges < 35 THEN 'Low Value (<$35)'
        WHEN monthlycharges BETWEEN 35 AND 65 THEN 'Mid Value ($35-65)'
        ELSE 'High Value (>$65)'
    END AS revenue_segment,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(
        SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2
    ) AS churn_rate_pct
FROM novapay_customers
GROUP BY revenue_segment
ORDER BY churn_rate_pct DESC;


-- Q5: Churn by Tenure Band
WITH tenure_bands AS (
    SELECT *,
        CASE 
            WHEN tenure <= 12 THEN '0-12 months'
            WHEN tenure BETWEEN 13 AND 24 THEN '13-24 months'
            WHEN tenure BETWEEN 25 AND 48 THEN '25-48 months'
            ELSE '49+ months'
        END AS tenure_band
    FROM novapay_customers
)
SELECT 
    tenure_band,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(
        SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2
    ) AS churn_rate_pct
FROM tenure_bands
GROUP BY tenure_band
ORDER BY churn_rate_pct DESC;


-- Q6: Churn by Payment Method
SELECT 
    paymentmethod,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(
        SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2
    ) AS churn_rate_pct
FROM novapay_customers
GROUP BY paymentmethod
ORDER BY churn_rate_pct DESC;


-- Q7: Customer Lifetime Value by Contract Type
WITH clv_calc AS (
    SELECT 
        contract,
        customerid,
        monthlycharges,
        tenure,
        ROUND(monthlycharges * tenure, 2) AS estimated_clv
    FROM novapay_customers
    WHERE churn = 'No'
)
SELECT 
    contract,
    COUNT(*) AS active_customers,
    ROUND(AVG(estimated_clv), 2) AS avg_clv,
    ROUND(SUM(estimated_clv), 2) AS total_clv
FROM clv_calc
GROUP BY contract
ORDER BY avg_clv DESC;


-- Q8: Top 10 High-Value Churned Customers
SELECT 
    customerid,
    monthlycharges,
    tenure,
    contract,
    paymentmethod,
    ROUND(monthlycharges * tenure, 2) AS estimated_clv
FROM novapay_customers
WHERE churn = 'Yes'
ORDER BY monthlycharges DESC
LIMIT 10;