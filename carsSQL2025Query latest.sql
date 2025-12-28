SELECT COUNT(*) AS total_cars
FROM CarsDatasets2025;

SELECT Company_Names,
       COUNT(*) AS car_count
FROM CarsDatasets2025
GROUP BY Company_Names
ORDER BY car_count DESC;

SELECT AVG(Cars_Prices) AS avg_car_price
FROM CarsDatasets2025;


SELECT Company_Names,
       AVG(Cars_Prices) AS avg_price
FROM CarsDatasets2025
GROUP BY Company_Names
ORDER BY avg_price DESC;

SELECT Company_Names,
       Cars_Names,
       Cars_Prices
FROM CarsDatasets2025
ORDER BY Cars_Prices DESC;

SELECT Company_Names,
       AVG(HorsePower) AS avg_hp
FROM CarsDatasets2025
GROUP BY Company_Names
ORDER BY avg_hp DESC;

SELECT Company_Names,
       Cars_Names,
       Total_Speed
FROM CarsDatasets2025
ORDER BY Total_Speed DESC;

SELECT Company_Names,
       Cars_Names,
       Performance_0_100_KM_H
FROM CarsDatasets2025
ORDER BY Performance_0_100_KM_H ASC;

SELECT Fuel_Types,
       COUNT(*) AS car_count
FROM CarsDatasets2025
GROUP BY Fuel_Types
ORDER BY car_count DESC;

SELECT Fuel_Types,
       AVG(HorsePower) AS avg_hp
FROM CarsDatasets2025
GROUP BY Fuel_Types;


SELECT CC_Battery_Capacity,
       AVG(HorsePower) AS avg_hp
FROM CarsDatasets2025
GROUP BY CC_Battery_Capacity
ORDER BY CC_Battery_Capacity;

SELECT Company_Names,
       Cars_Names,
       Cars_Prices / HorsePower AS price_per_hp
FROM CarsDatasets2025
WHERE HorsePower > 0
ORDER BY price_per_hp ASC;

SELECT Company_Names,
       Cars_Names,
       Seats,
       Cars_Prices
FROM CarsDatasets2025
WHERE Seats >= 5
ORDER BY Cars_Prices;
