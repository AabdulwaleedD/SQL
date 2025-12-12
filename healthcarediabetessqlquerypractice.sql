SELECT *
FROM [Healthcare-Diabetes];

SELECT Pregnancies, DiabetesPedigreeFunction, Age, Outcome
FROM [Healthcare-Diabetes];

SELECT Id, Pregnancies,
DiabetesPedigreeFunction,
Age,
Outcome
FROM [Healthcare-Diabetes]
GROUP BY Id
ORDER BY Id;

SELECT COUNT(Id) AS TOTAL_NUMBER_OF_PATIENTS
FROM [Healthcare-Diabetes];

SELECT COUNT(Id) AS TOTAL_NUMBER_OF_PATIENTS_WITH_HIGH_GLUCOSE_COUNT
FROM [Healthcare-Diabetes]
WHERE  Glucose >=100;

SELECT COUNT(Id) AS TOTAL_NUMBER_OF_PATIENTS_WITH_LOW_GLUCOSE_COUNT
FROM [Healthcare-Diabetes]
WHERE  Glucose <=100;

SELECT COUNT(Id) AS TOTAL_NUMBER_OF_PATIENTS_WITH_NO_INSULIN_COUNT
FROM [Healthcare-Diabetes]
WHERE  Insulin !=0;

SELECT Id AS TOTAL_NUMBER_OF_PATIENTS_WITH_HIGH_GLUCOSE_COUNT,
Pregnancies, DiabetesPedigreeFunction, Age, Insulin, Outcome
FROM [Healthcare-Diabetes]
WHERE  Insulin !=0;

SELECT Age, AVG(Insulin)
FROM [Healthcare-Diabetes]
GROUP BY Age
ORDER BY AVG(Insulin) DESC;

SELECT TOP (20) Age, COUNT(Insulin)
FROM [Healthcare-Diabetes]
GROUP BY Age
ORDER BY COUNT(Insulin) DESC;

SELECT COUNT(Insulin), Age
FROM [Healthcare-Diabetes]
GROUP BY Age
HAVING COUNT(Insulin) >= 100
ORDER BY Age;

SELECT COUNT(BMI)
FROM [Healthcare-Diabetes]

SELECT AVG(BMI), Age
FROM [Healthcare-Diabetes]
GROUP BY Age
HAVING AVG(BMI) >= 30
ORDER BY Age;

SELECT Id, BMI, Age,
    (SELECT COUNT(Insulin)
    FROM [Healthcare-Diabetes]
    GROUP BY Age
    HAVING COUNT(Insulin) = 229)
FROM [Healthcare-Diabetes]
ORDER BY Age DESC;

SELECT Id AS ID_NUMBER_OF_PATIENTS,
Pregnancies, Insulin, DiabetesPedigreeFunction, Age, Outcome
FROM [Healthcare-Diabetes]
WHERE  Insulin = 0 AND Pregnancies !=0 AND Outcome >= 0
ORDER BY Insulin DESC;

SELECT Id AS ID_NUMBER_OF_PATIENTS,
Pregnancies, Insulin, DiabetesPedigreeFunction, Age, Outcome
FROM [Healthcare-Diabetes]
WHERE  Insulin = 0 OR Pregnancies !=0 OR Outcome >= 0
ORDER BY Insulin DESC;

SELECT COUNT(Insulin)
FROM [Healthcare-Diabetes]
WHERE Insulin = 0;

SELECT Age ,
		COUNT(Id) AS NUMBER_OF_IDs,
		SUM(Pregnancies) AS NO_OF_PREGNANCIES_TOTAL,
		AVG(BMI)*100 AS AVERAGE_BMI
FROM [Healthcare-Diabetes]
GROUP BY Age
ORDER BY Age;

SELECT * FROM [Healthcare-Diabetes];

SELECT Outcome ,
		COUNT(Id) AS NUMBER_OF_IDs,
		SUM(Pregnancies) AS NO_OF_PREGNANCIES_TOTAL,
		AVG(BMI)*100 AS AVERAGE_BMI,
		AVG(DiabetesPedigreeFunction)*100 AS AVERAGE_DPF
FROM [Healthcare-Diabetes]
GROUP BY Outcome
ORDER BY Outcome;

SELECT TOP(20) BloodPressure ,
		COUNT(Id) AS NUMBER_OF_IDs,
		SUM(Pregnancies) AS NO_OF_PREGNANCIES_TOTAL,
		AVG(BMI)*100 AS AVERAGE_BMI,
		COUNT(Outcome) AS NO_OF_OUTCOMES,
		AVG(DiabetesPedigreeFunction)*100 AS AVERAGE_DPF
FROM [Healthcare-Diabetes]
GROUP BY BloodPressure
ORDER BY BloodPressure;

SELECT TOP(20) BloodPressure,
		COUNT(Id) AS NUMBER_OF_IDs,
		SUM(Outcome) AS NO_OF_Outcome_TOTAL,
		AVG(BMI)*100 AS AVERAGE_BMI,
		COUNT(Outcome) AS NO_OF_OUTCOMES,
		AVG(DiabetesPedigreeFunction)*100 AS AVERAGE_DPF
FROM [Healthcare-Diabetes]
GROUP BY BloodPressure
ORDER BY BloodPressure;


SELECT COUNT(Outcome) AS TOTAL_NUMBER_OF_OUTCOME
FROM [Healthcare-Diabetes];


SELECT TOP(20)
       BloodPressure,
       COUNT(Id) AS NUMBER_OF_IDs,
       SUM(Pregnancies) AS NO_OF_PREGNANCIES_TOTAL,
       AVG(BMI) * 100 AS AVERAGE_BMI,
       COUNT(Outcome) AS NO_OF_OUTCOMES,
       AVG(DiabetesPedigreeFunction) * 100 AS AVERAGE_DPF
FROM (
        SELECT ID,
               BloodPressure,
               Pregnancies,
               BMI,
               Outcome,
               DiabetesPedigreeFunction
        FROM [Healthcare-Diabetes]
        WHERE Insulin >= 150
          AND BMI <= 20
     ) AS filtered_data
GROUP BY BloodPressure
ORDER BY BloodPressure;

SELECT COUNT(*) AS Matching_Rows
FROM [Healthcare-Diabetes]
WHERE Insulin >= 150
  AND BMI = 20;

  SELECT TOP(20) ID, BMI, Insulin
FROM [Healthcare-Diabetes]
WHERE Insulin >= 150
ORDER BY BMI;

SELECT BloodPressure AS BP,
       COUNT(Id) AS NUMBER_OF_IDs,
       SUM(Pregnancies) AS NO_OF_PREGNANCIES_TOTAL,
       AVG(BMI) * 100 AS AVERAGE_BMI,
       COUNT(Outcome) AS NO_OF_OUTCOMES,
       AVG(DiabetesPedigreeFunction) * 100 AS AVERAGE_DPF
FROM (
        SELECT ID,
               BloodPressure,
               Pregnancies,
               BMI,
               Outcome,
               DiabetesPedigreeFunction
        FROM [Healthcare-Diabetes]
        WHERE Insulin >= 150
          AND BMI BETWEEN 29 AND 31
     ) AS filtered_data
GROUP BY BloodPressure
ORDER BY BloodPressure DESC;


SELECT
  COUNT(*) AS total_outcome,
  SUM(CASE WHEN Outcome = 1 THEN 1 END) AS positives,
  ROUND(100.0 * SUM(CASE WHEN Outcome = 1 THEN 1 END) / COUNT(*), 2) AS positive_pct
FROM [Healthcare-Diabetes];

SELECT Outcome AS OUTCOME, AVG(Glucose) AS AVERAGE_GLUCOSE,
AVG(BMI) AS AVERAGE_BMI,
AVG(Age) AS AVERAGE_AGE
FROM [Healthcare-Diabetes]
GROUP BY Outcome;

SELECT TOP(20)       
Id AS [IDENTITY],
Glucose,
BloodPressure,
BMI
FROM [Healthcare-Diabetes]
WHERE BMI BETWEEN 30 AND 41
ORDER BY Glucose DESC;

SELECT TOP(20)      
Id AS [IDENTITY],
Glucose,
BloodPressure,
BMI
FROM [Healthcare-Diabetes]
WHERE BloodPressure BETWEEN 70 AND 80 AND BMI >=25
AND Glucose <100
ORDER BY Glucose DESC;

SELECT     
Id AS [IDENTITY],
Glucose,
BloodPressure,
BMI
FROM [Healthcare-Diabetes]
WHERE BloodPressure BETWEEN 70 AND 80
AND BMI BETWEEN 30 AND 40
AND Glucose BETWEEN 100 AND 120
ORDER BY Glucose DESC;

SELECT     
Id AS [IDENTITY],
Glucose,
BloodPressure,
BMI
FROM [Healthcare-Diabetes]
WHERE BloodPressure BETWEEN 70 AND 80
AND BMI BETWEEN 30 AND 40
AND Glucose BETWEEN 100 AND 120
ORDER BY Glucose;