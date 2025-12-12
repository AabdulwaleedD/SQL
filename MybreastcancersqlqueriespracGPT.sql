SELECT *
FROM mydatabase.`breast-cancer`;

SELECT COUNT(*) AS TOTAL_NO_OF_ENTRY
FROM mydatabase.`breast-cancer`;

SELECT 
    SUM(CASE WHEN radius_mean IS NULL THEN 1 END) AS radius_missing,
    SUM(CASE WHEN perimeter_mean IS NULL THEN 1 END) AS perimeter_missing
FROM mydatabase.`breast-cancer`;


SELECT diagnosis, COUNT(*) 
FROM mydatabase.`breast-cancer`
GROUP BY diagnosis;

-- Counts of malignant vs. benign
SELECT diagnosis, COUNT(*) AS total
FROM mydatabase.`breast-cancer`
GROUP BY diagnosis;

-- Average tumor size by diagnosis
SELECT 
    diagnosis,
    AVG(radius_mean) AS avg_radius,
    AVG(area_mean) AS avg_area,
    AVG(concavity_mean) AS avg_concavity
FROM mydatabase.`breast-cancer`
GROUP BY diagnosis;

SELECT 
    diagnosis,
    MAX(radius_mean) AS max_radius,
    MAX(area_mean) AS max_area,
    MAX(concavity_mean) AS max_concavity
FROM mydatabase.`breast-cancer`
GROUP BY diagnosis;

SELECT 
    diagnosis,
    MIN(radius_mean) AS min_radius,
    MIN(area_mean) AS min_area,
    MIN(concavity_mean) AS min_concavity
FROM mydatabase.`breast-cancer`
GROUP BY diagnosis;


-- Which features differ the most?
SELECT 
    AVG(CASE WHEN diagnosis = 'M' THEN radius_mean END) -
    AVG(CASE WHEN diagnosis = 'B' THEN radius_mean END) AS diff_radius,
    
    AVG(CASE WHEN diagnosis = 'M' THEN area_mean END) -
    AVG(CASE WHEN diagnosis = 'B' THEN area_mean END) AS diff_area
    
FROM mydatabase.`breast-cancer`;

-- Highest-risk features (based on malignant & benign averages)
SELECT 
    'radius_mean' AS feature,
    AVG(radius_mean) AS malignant_avg
FROM mydatabase.`breast-cancer`
WHERE diagnosis = 'M'
ORDER BY malignant_avg DESC;

SELECT 
    'radius_mean' AS feature,
    AVG(radius_mean) AS benign_avg
FROM mydatabase.`breast-cancer`
WHERE diagnosis = 'B'
ORDER BY benign_avg DESC;

SELECT 
    id,
    diagnosis,
    radius_mean,
    CASE 
        WHEN radius_mean > 15 THEN 'High Risk'
        WHEN radius_mean BETWEEN 12 AND 15 THEN 'Moderate Risk'
        ELSE 'Low Risk'
    END AS radius_risk
FROM mydatabase.`breast-cancer`;

SELECT 
    id,
    diagnosis,
    radius_mean,
    area_worst
    concave_points_mean,
    CASE 
        WHEN area_worst > 500 THEN 'High Risk'
        WHEN area_worst BETWEEN 200 AND 500 THEN 'Moderate Risk'
        ELSE 'Low Risk'
    END AS area_worst
FROM mydatabase.`breast-cancer`;

SELECT 
    id,
    diagnosis,
    radius_mean,
    area_worst
    concave_points_mean,
    CASE 
        WHEN area_worst > 500 THEN 'High Risk'
        WHEN area_worst BETWEEN 200 AND 500 THEN 'Moderate Risk'
        ELSE 'Low Risk'
    END AS area_worst
FROM mydatabase.`breast-cancer`;

SELECT 
    id,
    diagnosis,
    radius_mean,
    area_worst
    concavity_mean,
    CASE 
        WHEN concavity_mean > 0.05 THEN 'High Risk'
        WHEN concavity_mean BETWEEN 0.02 AND 0.05 THEN 'Moderate Risk'
        ELSE 'Low Risk'
    END AS concavity_mean
FROM mydatabase.`breast-cancer`;

SELECT 
    id,
    diagnosis,
    radius_mean,
    area_worst
    radius_worst,
    CASE 
        WHEN radius_worst > 12 THEN 'High Risk'
        WHEN radius_worst BETWEEN 8 AND 12 THEN 'Moderate Risk'
        ELSE 'Low Risk'
    END AS radius_worst
FROM mydatabase.`breast-cancer`;


SELECT 
    id,
    diagnosis,
    radius_mean,
    concavity_mean,
    area_worst,

    -- Simple risk scoring
    (CASE WHEN radius_mean > 15 THEN 2 ELSE 0 END) +
    (CASE WHEN concavity_mean > 0.2 THEN 2 ELSE 0 END) +
    (CASE WHEN area_worst > 1000 THEN 1 ELSE 0 END) AS risk_score,

    CASE
        WHEN (CASE WHEN radius_mean > 15 THEN 2 ELSE 0 END) +
             (CASE WHEN concavity_mean > 0.2 THEN 2 ELSE 0 END) +
             (CASE WHEN area_worst > 1000 THEN 1 ELSE 0 END) >= 4
            THEN 'High Risk'
        WHEN (CASE WHEN radius_mean > 15 THEN 2 ELSE 0 END) +
             (CASE WHEN concavity_mean > 0.2 THEN 2 ELSE 0 END) >= 2
            THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS risk_category
FROM breast_cancer
ORDER BY id;




