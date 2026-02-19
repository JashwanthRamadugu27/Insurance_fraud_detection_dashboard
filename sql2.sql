USE claimwatchAI;
SELECT COUNT(*) AS Total_Claims FROM claims;
SELECT Risk_level, COUNT(*) AS Total
FROM claims
GROUP BY Risk_level;
SELECT Accident_Area, COUNT(*) AS Fraud_Cases
FROM claims
WHERE Risk_level = 'High Risk'
GROUP BY Accident_Area
ORDER BY Fraud_Cases DESC;
SELECT Claim_Time, COUNT(*) AS Fraud_Cases
FROM claims
WHERE Risk_level = 'High Risk'
GROUP BY Claim_Time;
SELECT Police_Report, COUNT(*) AS Fraud_Cases
FROM claims
WHERE Risk_level = 'High Risk'
GROUP BY Police_Report;
SELECT 
CASE
    WHEN Claim_Amount < 50000 THEN 'Low Amount'
    WHEN Claim_Amount BETWEEN 50000 AND 150000 THEN 'Medium Amount'
    ELSE 'High Amount'
END AS Amount_Category,
COUNT(*) AS Fraud_Count
FROM claims
WHERE Risk_level = 'High Risk'
GROUP BY Amount_Category;
SELECT Previous_Claims, COUNT(*) AS Fraud_Count
FROM claims
WHERE Risk_level = 'High Risk'
GROUP BY Previous_Claims
ORDER BY Previous_Claims DESC;
SELECT Claim_ID,
(
Late_night_flag +
High_amount_flag +
No_police_flag +
past_fraud_flag +
Suspicious_location_flag
) AS Calculated_Risk_Score
FROM claims
ORDER BY Calculated_Risk_Score DESC;
SELECT Claim_ID, Fraud_score, Risk_level
FROM claims
ORDER BY Fraud_score DESC
LIMIT 10;
