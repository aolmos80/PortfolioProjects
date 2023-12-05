SELECT *
FROM HealthcareDataset

---Medical Condition Analysis---
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



---Admission Analysis---
--Analyze the distribution of admission types (e.g., emergency, elective, urgent).--

SELECT AdmissionType, 
	COUNT(*) AS AdmissionCount
FROM HealthcareDataset
GROUP BY AdmissionType

--Percentage of each admisison type--

SELECT AdmissionType, 
	COUNT(*) AS AdmissionCount, 
	ROUND(COUNT(*) * 100 / SUM(COUNT(*)) OVER (), 2) AS Percentage
FROM HealthcareDataset
GROUP BY AdmissionType

--Calculate the average billing amount for each admission type--

SELECT AdmissionType, 
	ROUND(AVG(BillingAmount), 2) AS AverageBillingAmount
FROM HealthcareDataset
GROUP BY AdmissionType


--Determine the most common admission type--

SELECT AdmissionType, 
	COUNT(AdmissionType) AS TotalAdmissionByType
FROM HealthcareDataset
GROUP BY AdmissionType
ORDER BY TotalAdmissionByType DESC


---Medication Analysis---
--Identify the most prescribed medication--

SELECT Medication, 
	COUNT(*) AS PrescriptionCount
FROM HealthcareDataset
GROUP BY  Medication
ORDER BY PrescriptionCount DESC


--Calculate the total billing amount for patients prescribed a specific mediciton--

SELECT Medication, 
	COUNT(*) AS PrescriptionCount, 
	ROUND(SUM(BillingAmount), 2) AS TotalBillingAmount
FROM HealthcareDataset
GROUP BY Medication


--Analyze the relationship between medication and medical condition--

SELECT Medication, MedicalCondition, 
	COUNT(*) AS PrescriptionCount
FROM HealthcareDataset
GROUP BY Medication, MedicalCondition
ORDER BY Medication DESC, PrescriptionCount DESC


--Average length of stay based on medical condition--

SELECT MedicalCondition, 
	AVG(DATEDIFF(day, DateOfAdmission, DischargeDate)) AS AverageLengthOfStay
FROM HealthcareDataset
GROUP BY MedicalCondition
