CREATE DATABASE LOAN;
USE LOAN;

CREATE TABLE customer_data (
    Id INT PRIMARY KEY,
    Income DECIMAL(15,2),
    Age INT,
    Experience INT,
    Married_Single ENUM('Married', 'Single'),
    House_Ownership ENUM('Owned', 'Rented', 'Neither'),
    Car_Ownership ENUM('Yes', 'No'),
    Profession VARCHAR(100),
    CITY VARCHAR(100),
    STATE VARCHAR(100),
    CURRENT_JOB_YRS INT,
    CURRENT_HOUSE_YRS INT,
    Risk_Flag INT
);

LOAD DATA INFILE 'E:/Project/Loan/Customer Data.csv'
INTO TABLE customer_data
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- Identify High-Risk Applicant Profiles
SELECT Age, Income, Experience, House_Ownership, Car_Ownership, Profession, 
       COUNT(*) AS Total_Applicants, 
       SUM(Risk_Flag) AS High_Risk_Applicants, 
       ROUND((SUM(Risk_Flag) * 100.0 / COUNT(*)), 2) AS High_Risk_Percentage
FROM customer_data
WHERE Risk_Flag = 1
GROUP BY Age, Income, Experience, House_Ownership, Car_Ownership, Profession
ORDER BY High_Risk_Percentage DESC
LIMIT 10;

-- Income vs. Loan Default Risk
SELECT 
    CASE 
        WHEN Income < 2000000 THEN 'Low Income'
        WHEN Income BETWEEN 2000000 AND 5000000 THEN 'Middle Income'
        ELSE 'High Income'
    END AS Income_Category,
    COUNT(*) AS Total_Applicants, 
    SUM(Risk_Flag) AS High_Risk_Applicants, 
    ROUND((SUM(Risk_Flag) * 100.0 / COUNT(*)), 2) AS Default_Rate
FROM customer_data
GROUP BY 
    CASE 
        WHEN Income < 2000000 THEN 'Low Income'
        WHEN Income BETWEEN 2000000 AND 5000000 THEN 'Middle Income'
        ELSE 'High Income'
    END
ORDER BY Default_Rate DESC;

-- Loan Risk by Profession
SELECT Profession, 
       COUNT(*) AS Total_Applicants, 
       SUM(Risk_Flag) AS High_Risk_Applicants, 
       ROUND((SUM(Risk_Flag) * 100.0 / COUNT(*)), 2) AS Default_Rate
FROM customer_data
GROUP BY Profession
ORDER BY Default_Rate DESC
LIMIT 10;

-- House Ownership vs. Risk Flag
SELECT House_Ownership, 
       COUNT(*) AS Total_Applicants, 
       SUM(Risk_Flag) AS High_Risk_Applicants, 
       ROUND((SUM(Risk_Flag) * 100.0 / COUNT(*)), 2) AS Default_Rate
FROM customer_data
GROUP BY House_Ownership
ORDER BY Default_Rate DESC;

-- Car Ownership & Loan Default Risk
SELECT Car_Ownership, 
       COUNT(*) AS Total_Applicants, 
       SUM(Risk_Flag) AS High_Risk_Applicants, 
       ROUND((SUM(Risk_Flag) * 100.0 / COUNT(*)), 2) AS Default_Rate
FROM customer_data
GROUP BY Car_Ownership
ORDER BY Default_Rate DESC;


-- Job Tenure vs. Loan Default Risk
SELECT CURRENT_JOB_YRS, 
       COUNT(*) AS Total_Applicants, 
       SUM(Risk_Flag) AS High_Risk_Applicants, 
       ROUND((SUM(Risk_Flag) * 100.0 / COUNT(*)), 2) AS Default_Rate
FROM customer_data
GROUP BY CURRENT_JOB_YRS
ORDER BY Default_Rate DESC;

-- State-Wise Loan Default Analysis
SELECT STATE, 
       COUNT(*) AS Total_Applicants, 
       SUM(Risk_Flag) AS High_Risk_Applicants, 
       ROUND((SUM(Risk_Flag) * 100.0 / COUNT(*)), 2) AS Default_Rate
FROM customer_data
GROUP BY STATE
ORDER BY Default_Rate DESC
LIMIT 10;

