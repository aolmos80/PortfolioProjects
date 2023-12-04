SELECT *
FROM HealthcareDataset

--Count the occurrences of each medical condition--

SELECT MedicalCondition, COUNT(*) AS NumberOfPatients
FROM HealthcareDataset
Group by MedicalCondition
ORDER BY NumberOfPatients DESC

--Find the average and total billing amount for each medical condition--

SELECT MedicalCondition, COUNT(*) AS NumberOfPatients, 
	ROUND(AVG(BillingAmount), 0) AS AverageBillingAmount, 
	ROUND(SUM(BillingAmount), 0) AS TotalBillingAmount
FROM HealthcareDataset
GROUP BY MedicalCondition;

-- Identify the most expensive and least expensive medical conditions --

SELECT MedicalCondition, COUNT(*) AS NumberOfPatients, 
	ROUND(AVG(BillingAmount), 0) AS AverageBillingAmount
FROM HealthcareDataset
GROUP BY MedicalCondition
Order by AverageBillingAmount desc

