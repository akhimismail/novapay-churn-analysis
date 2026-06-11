# NovaPay Customer Churn & Revenue Intelligence

**Role:** Data Analyst | **Tools:** PostgreSQL · Excel · Power BI  
**Domain:** FinTech · Customer Analytics · Revenue Intelligence

---
## Executive Summary

NovaPay lacked visibility into the financial impact of customer churn and the customer segments driving revenue loss.

Using PostgreSQL, Excel, and Power BI, I analyzed 7,043 customer records to quantify revenue exposure, identify high-risk customer segments, and develop data-driven retention strategies.

### Key Results

- Identified a 26.5% customer churn rate
- Quantified $139K monthly recurring revenue at risk
- Found month-to-month customers churn at nearly 14x the rate of two-year contract customers
- Identified a potential $28K monthly revenue recovery opportunity through targeted retention initiatives

---

## Business Problem

NovaPay Financial Technologies is a digital payments startup serving 7,000+ customers across subscription-based financial products. The business had no clear picture of who was leaving, why they were leaving, or what it was costing them.

**I focused on three business-critical questions:**

1. What level of revenue exposure is customer churn creating?
2. Which customer segments contribute most to revenue loss?
3. Which retention initiatives offer the greatest business impact?

---

## Dataset

- **Source:** IBM Telco Customer Churn Dataset (Kaggle)
- **Note:** The dataset was rebranded as NovaPay Financial Technologies to simulate a realistic FinTech customer retention engagement.
- **Size:** 7,043 customers · 21 features
- **Key fields:** Tenure, contract type, monthly charges, payment method, churn label
- **Rebranded as:** NovaPay Financial Technologies for portfolio context

---

## Methodology

```
Business Problem
→ Data Preparation
→ Customer Segmentation Analysis
→ Revenue Risk Assessment
→ CLV Analysis
→ Executive Dashboard Development
→ Strategic Recommendations
```

---

## SQL Analysis

Eight business questions answered in PostgreSQL. Full queries in `/sql/churn_analysis.sql`.

### Key Findings

| # | Business Question | Finding |
|---|---|---|
| 1 | Overall churn rate | **26.5%** — well above the 5–7% healthy benchmark |
| 2 | MRR at risk | **$139K+/month** lost to churned customers |
| 3 | Worst contract type | Month-to-month customers churn at **~42%** vs 3% for 2-year contracts |
| 4 | Revenue segment risk | High-value customers (>$65/mo) churn at nearly the same rate as low-value ones |
| 5 | Tenure risk window | **47%** of churned customers left within their first 12 months |
| 6 | Payment method risk | Electronic check users churn at **~45%** — 2x the rate of auto-pay customers |
| 7 | Lifetime value gap | Two-year contract customers deliver **8x CLV** vs month-to-month customers |
| 8 | High-value losses | Top 10 churned customers identified for immediate CS outreach |

---

## Dashboard

> Power BI dashboard covering executive KPIs, churn segmentation, CLV analysis, and retention recommendations.

![Dashboard](dashboard/dashboard_screenshot.png)

---

## Key Recommendations

**Quick Wins (0–30 days)**
- Launch targeted retention campaign for month-to-month customers at 12-month tenure mark
- Migrate electronic check users to auto-pay via incentive offer

**Medium Term (30–90 days)**
- Build early warning system flagging customers in first 12 months with high churn-risk profile
- Create upgrade path incentives for month-to-month → annual contract conversion

**Long Term (90+ days)**
- Implement CLV-based customer segmentation across all marketing and CS touchpoints
- Develop onboarding programme specifically designed to get customers past the 12-month retention threshold

---

## Business Impact Estimate

| Action | Estimated Impact |
|---|---|
| Recover 20% of churned MRR | +$28K/month recurring revenue |
| Migrate 30% of e-check users to auto-pay | ~15% churn reduction in that segment |
| Improve 0–12 month retention by 10% | Significant CLV uplift across entire customer base |

## Financial Impact Analysis

### Revenue Exposure

- Monthly Revenue at Risk: $139K
- Annual Revenue at Risk: $1.67M

### Revenue Recovery Opportunity

If NovaPay recovers 20% of churned revenue:

- Monthly Revenue Recovery: $28K
- Annual Revenue Recovery: $336K

---

## Repository Structure

```
novapay-churn-analysis/
├── data/
│   └── novapay_customers.csv
├── sql/
│   └── churn_analysis.sql
├── dashboard/
│   ├── dashboard_screenshot.png
│   ├── excel_chart.png
│   ├── novapay_powerbi.pbix
│   ├── q1_churn_rate.PNG
│   ├── q2_mmr_at_risk.PNG
│   ├── q3_churn_by_contract.PNG
│   ├── q4_churn_by_revenue.PNG
│   ├── q5_churn_by_tenure.PNG
│   ├── q6_churn_by_payment.PNG
│   ├── q7_clv_by_contract.PNG
│   └── q8_top_churned_customer.PNG
└── README.md
```

---

## Tools Used

| Tool | Purpose |
|---|---|
| PostgreSQL + pgAdmin | SQL analysis — churn rate, segmentation, CLV, cohort analysis |
| Excel | EDA, pivot tables, trend analysis |
| Power BI | Executive dashboard, KPI reporting |

---


## Skills Demonstrated

- SQL Analytics
- Customer Segmentation
- Revenue Analytics
- Churn Analysis
- Customer Lifetime Value (CLV)
- Revenue Risk Assessment
- Executive Dashboard Reporting
- Business Intelligence
- Data-Driven Decision Making

---


## About This Project

This project simulates a real-world FinTech customer retention engagement focused on quantifying revenue risk, identifying high-value churn drivers, and supporting executive decision-making through data-driven recommendations. The dataset is sourced from Kaggle's IBM Telco Churn dataset, rebranded as NovaPay for realistic business context.

**Connect:** [LinkedIn](https://www.linkedin.com/in/akhimismail) · [GitHub](https://github.com/akhimismail)
