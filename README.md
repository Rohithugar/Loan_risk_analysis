# Loan Risk Analysis

## 1. Project Overview

### 1.1 Business Problem
The bank aims to improve its loan approval process while minimizing default risks. The challenge is to identify high-risk applicants and refine lending policies accordingly.

### 1.2 Project Objectives
1. Analyze key risk factors affecting loan defaults  
2. Identify trends in income, job tenure, and geography that increase default risk  
3. Provide data-driven recommendations to improve loan approvals while reducing risk  

---

## 2. Dataset & Methodology

### 2.1 Data Sources
- Historical loan applicant data (`Training Data.csv`)  
- Includes Income, Age, Job Experience, Credit History, House Ownership, Car Ownership, and Risk Flags  

### 2.2 Data Processing Steps
1. Cleaned data in Excel (Handled missing values, removed duplicates, renamed columns)  
2. Created "Income Category" column in Power Query to segment applicants based on income  

### 2.3 Compliance Considerations
The bank must ensure compliance with financial regulations such as Basel III and fair lending laws while optimizing loan approvals. This analysis helps balance profitability with risk governance, ensuring sustainable growth and regulatory compliance.

---

## 3. Key Insights & Findings

### 3.1 High-Risk Applicant Analysis
1. Renters Have a Higher Default Rate – All high-risk applicants live in rented homes.  
   - Business Impact: The bank should prioritize homeowners or require higher collateral from renters.  
2. High Income Doesn’t Guarantee Low Risk – Applicants earning $5M+ are still defaulting at 100 percent rates.  
   - Business Impact: The bank should assess spending behavior and credit history, not just salary.  

### 3.2 Income vs. Loan Default Risk
1. Low-income applicants have the highest default rate (13.17 percent), but high-income applicants (12.26 percent) also default frequently.  
   - Business Impact: The bank should assess credit history and financial habits instead of relying solely on income.  
2. Middle-income borrowers have the lowest default rate (11.79 percent).  
   - Business Impact: The bank should target middle-income earners for safer lending opportunities.  

### 3.3 Job Tenure vs. Loan Default Risk
1. Applicants with 2 years or less job experience have the highest default rate (17.05 percent - 15.57 percent).  
   - Business Impact: The bank should set a minimum job tenure requirement (3+ years) or require additional documentation for short-tenure applicants.  

---

## 4. Power BI Dashboard Overview

### 4.1 Key Visuals
1. Loan Default Rate by Income Category (Bar Chart)  
2. High-Risk Professions (Column Chart)  
3. Loan Risk by State (Map Visualization)  
4. Loan Approval Rate by Job Tenure (Stacked Chart)  

### 4.2 Business Impact
The Power BI dashboard provides an interactive way to analyze loan risk by different factors, allowing decision-makers to adjust lending policies based on data-driven insights.

---

## 5. Conclusion and Recommendations

### 5.1 Key Takeaways
1. The bank should not rely solely on income for loan approvals. Other risk factors like job tenure and home ownership play a crucial role.  
2. Middle-income applicants are the safest lending group and should be targeted for business growth.  
3. A minimum job tenure of 3+ years should be set to reduce default risks.  

### 5.2 Next Steps
1. Deploy Power BI dashboard to monitor risk trends.  
2. Automate risk scoring using SQL for faster decision-making.  
3. Integrate credit score data to enhance applicant evaluation.  
