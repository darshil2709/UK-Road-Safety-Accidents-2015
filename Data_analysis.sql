/* Get Accident Severity and Total Accidents per Vehicle Type /
SELECT
vehicle_type AS 'Vehicle Type',
accident_severity AS 'Severity',
COUNT() AS 'Number of Accidents'
FROM
accident
JOIN vehicles ON accident.accident_index = vehicles.accident_index
JOIN vehicle_types ON vehicles.vehicle_type = vehicle_types.vehicle_code
GROUP BY
vehicle_type,
accident_severity
ORDER BY
accident_severity,
COUNT(*) DESC;

/* Average Severity by Vehicle Type /
SELECT
vehicle_type AS 'Vehicle Type',
AVG(accident_severity) AS 'Average Severity',
COUNT() AS 'Number of Accidents'
FROM
accident
JOIN vehicles ON accident.accident_index = vehicles.accident_index
JOIN vehicle_types ON vehicles.vehicle_type = vehicle_types.vehicle_code
GROUP BY
vehicle_type
ORDER BY
AVG(accident_severity),
COUNT(*) DESC;

/* Average Severity and Total Accidents by Motorcycle /
SELECT
vehicle_type AS 'Vehicle Type',
AVG(accident_severity) AS 'Average Severity',
COUNT() AS 'Number of Accidents'
FROM
accident
JOIN vehicles ON accident.accident_index = vehicles.accident_index
JOIN vehicle_types ON vehicles.vehicle_type = vehicle_types.vehicle_code
WHERE
vehicle_type LIKE '%otorcycle%'
GROUP BY
vehicle_type
ORDER BY
AVG(accident_severity),
COUNT(*) DESC;

In this approach we group by the vehicle type and accident severity separately in the first query,and only by vehicle type in the second and third queries. We also order by the accident severity and average 
severity in ascending order and the number of accidents in descending order.This can help us identify which vehicle types have the most severe accidents and which ones have the highest number of accidents.
