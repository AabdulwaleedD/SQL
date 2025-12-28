SELECT * FROM [HEALTHCARE-DIABETES].[dbo].[Healthcare-Diabetes];

SELECT COUNT(*) AS total_patients
FROM [Healthcare-Diabetes];

SELECT Outcome,
       COUNT(*) AS patient_count
FROM [Healthcare-Diabetes]
GROUP BY Outcome;

SELECT 
    CAST(SUM(CASE WHEN Outcome = 1 THEN 1 ELSE 0 END) AS decimal(10,2)) * 100.0 /
    COUNT(*) AS diabetes_rate
FROM [Healthcare-Diabetes];

SELECT 
    AVG(Glucose) AS avg_glucose,
    AVG(BMI) AS avg_bmi,
    AVG(Age) AS avg_age
FROM [Healthcare-Diabetes];

SELECT Outcome,
       AVG(Glucose) AS avg_glucose
FROM [Healthcare-Diabetes]
GROUP BY Outcome;

SELECT Outcome,
       AVG(BMI) AS avg_bmi
FROM [Healthcare-Diabetes]
GROUP BY Outcome;

SELECT Outcome,
       AVG(Age) AS avg_age
FROM [Healthcare-Diabetes]
GROUP BY Outcome;

SELECT 
    CASE
        WHEN BMI < 18.5 THEN 'Underweight'
        WHEN BMI BETWEEN 18.5 AND 24.9 THEN 'Normal'
        WHEN BMI BETWEEN 25 AND 29.9 THEN 'Overweight'
        ELSE 'Obese'
    END AS bmi_category,
    COUNT(*) AS total_patients,
    SUM(CASE WHEN Outcome = 1 THEN 1 ELSE 0 END) AS diabetic_patients
FROM [Healthcare-Diabetes]
GROUP BY CASE
        WHEN BMI < 18.5 THEN 'Underweight'
        WHEN BMI BETWEEN 18.5 AND 24.9 THEN 'Normal'
        WHEN BMI BETWEEN 25 AND 29.9 THEN 'Overweight'
        ELSE 'Obese'
    END;


SELECT 
    CASE
        WHEN Age < 30 THEN 'Young'
        WHEN Age BETWEEN 30 AND 50 THEN 'Middle Age'
        ELSE 'Senior'
    END AS age_group,
    COUNT(*) AS total_patients,
    SUM(CASE WHEN Outcome = 1 THEN 1 ELSE 0 END) AS diabetic_cases
FROM [Healthcare-Diabetes]
GROUP BY 
    CASE
        WHEN Age < 30 THEN 'Young'
        WHEN Age BETWEEN 30 AND 50 THEN 'Middle Age'
        ELSE 'Senior'
    END;


SELECT Outcome,
       AVG(Pregnancies) AS avg_pregnancies
FROM [Healthcare-Diabetes]
GROUP BY Outcome;

SELECT Outcome,
       CAST(AVG(DiabetesPedigreeFunction) AS decimal(10,2)) AS avg_genetic_risk
FROM [Healthcare-Diabetes]
GROUP BY Outcome;

SELECT *
FROM [Healthcare-Diabetes]
WHERE Glucose > 140
  AND BMI > 30
  AND Age > 40;
