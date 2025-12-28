SELECT *
FROM financial_loan;

Select CAST(SUM(int_rate) AS decimal(10,2)) AS SUM_OF_INTEREST_RATE
from financial_loan;

SELECT COUNT(*) AS TOTAL_NO_OF_LOAN FROM financial_loan;

SELECT loan_status,
       COUNT(*) AS loan_count
FROM financial_loan
GROUP BY loan_status
ORDER BY loan_count DESC;

SELECT SUM(loan_amount) AS total_loan_amount
FROM financial_loan;

SELECT SUM(total_payment) AS total_payment_received
FROM financial_loan;

SELECT AVG(int_rate) AS avg_interest_rate
FROM financial_loan;

SELECT AVG(loan_amount) AS avg_loan_amount
FROM financial_loan;

SELECT COUNT(*) AS defaulted_loans
FROM financial_loan
WHERE loan_status IN ('Charged Off', 'Default');

SELECT 
    COUNT(CASE WHEN loan_status IN ('Charged Off', 'Default') THEN 1 END) * 100.0
    / COUNT(*) AS default_rate_percentage
FROM financial_loan;

SELECT grade,
       COUNT(*) AS total_loans,
       SUM(CASE WHEN loan_status IN ('Charged Off', 'Default') THEN 1 ELSE 0 END) AS defaulted_loans,
       SUM(CASE WHEN loan_status IN ('Charged Off', 'Default') THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS default_rate
FROM financial_loan
GROUP BY grade
ORDER BY default_rate DESC;

SELECT emp_length,
       COUNT(*) AS loan_count
FROM financial_loan
GROUP BY emp_length
ORDER BY loan_count DESC;

SELECT loan_status,
       AVG(annual_income) AS avg_income
FROM financial_loan
GROUP BY loan_status;

SELECT 
    CASE 
        WHEN dti < 10 THEN 'Low DTI'
        WHEN dti BETWEEN 10 AND 20 THEN 'Medium DTI'
        ELSE 'High DTI'
    END AS dti_category,
    COUNT(*) AS total_loans,
    SUM(CASE WHEN loan_status IN ('Charged Off', 'Default') THEN 1 ELSE 0 END) AS defaults
FROM financial_loan
GROUP BY 
    CASE 
        WHEN dti < 10 THEN 'Low DTI'
        WHEN dti BETWEEN 10 AND 20 THEN 'Medium DTI'
        ELSE 'High DTI'
    END;


SELECT YEAR(issue_date) AS issue_year,
       COUNT(*) AS loan_count,
       SUM(loan_amount) AS total_amount
FROM financial_loan
GROUP BY YEAR(issue_date)
ORDER BY issue_year;