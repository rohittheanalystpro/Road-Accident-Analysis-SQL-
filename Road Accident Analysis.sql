create database road_accident_database;
use road_accident_database;
select * from road_accident;

select count(*) as accident_count from road_accident;

-- Top Causes of Accidents
SELECT cause_of_accident, COUNT(*) AS accident_count
FROM road_accident
GROUP BY cause_of_accident
ORDER BY accident_count DESC;

-- Accidents by Day of the Week
SELECT day_of_week, COUNT(*) AS accident_count
FROM road_accident
GROUP BY day_of_week
ORDER BY accident_count DESC;

-- Accident Severity Distribution
SELECT 
    accident_severity, 
    COUNT(*) AS count_of_injuries,
    (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM road_accident)) AS percentage_of_injuries
FROM road_accident
GROUP BY accident_severity
ORDER BY percentage_of_injuries DESC;

-- Accidents by Age Band of Driver
SELECT age_band_of_driver, COUNT(*) AS accident_count
FROM road_accident
GROUP BY age_band_of_driver
ORDER BY accident_count DESC;

-- Accidents by Type of Vehicle: Identify which types of vehicles are involved in the most accidents
SELECT type_of_vehicle, COUNT(*) AS accident_count
FROM road_accident
GROUP BY type_of_vehicle
ORDER BY accident_count DESC;

-- Accidents by Driver's Driving Experience: Check how driving experience affects the number of accidents
SELECT driving_experience, COUNT(*) AS accident_count
FROM road_accident
GROUP BY driving_experience
ORDER BY accident_count DESC;

-- Accident by type of vehicle involved
SELECT type_of_vehicle, COUNT(*) AS total_accidents
FROM road_accident
GROUP BY type_of_vehicle
ORDER BY total_accidents DESC;

-- Total no. of accidents by type of collision
SELECT type_of_collision, COUNT(*) AS total_accidents
FROM road_accident
GROUP BY type_of_collision
ORDER BY total_accidents DESC;

-- Total no. of accidents by lightning conditions 
SELECT light_conditions, COUNT(*) AS total_accidents
FROM road_accident
GROUP BY light_conditions
ORDER BY total_accidents DESC;

-- Total no. of accidents by weather conditions
SELECT weather_conditions, COUNT(*) AS total_accidents
FROM road_accident
GROUP BY weather_conditions
ORDER BY total_accidents DESC;

-- Accidents by vehicle movement at the time of the accident
SELECT vehicle_movement, COUNT(*) AS total_accidents
FROM road_accident
GROUP BY vehicle_movement
ORDER BY total_accidents DESC;

-- Accidents by service year of vehicle:
SELECT service_year_of_vehicle, COUNT(*) AS total_accidents
FROM road_accident
GROUP BY service_year_of_vehicle
ORDER BY total_accidents DESC;

-- Accident involvement of male and female
SELECT sex_of_driver, COUNT(*) AS total_accidents
FROM road_accident
GROUP BY sex_of_driver
ORDER BY total_accidents DESC;

-- Acccident by educational level of driver
SELECT educational_level, COUNT(*) AS total_accidents
FROM road_accident
GROUP BY educational_level
ORDER BY total_accidents DESC;

-- Avgerage driver experience of total acciedent involvement 
SELECT AVG(CASE 
           WHEN driving_experience = 'Below 1yr' THEN 0.5
           WHEN driving_experience = '1-2yr' THEN 1.5
           WHEN driving_experience = '2-5yr' THEN 3.5
           WHEN driving_experience = 'Above 10yr' THEN 12
           ELSE 0
         END) AS avg_driving_experience
FROM road_accident;

-- Percentage of accidents caused by male and female
SELECT sex_of_driver, 
       COUNT(*) * 100.0 / (SELECT COUNT(*) FROM road_accident) AS percentage_of_accidents
FROM road_accident
GROUP BY sex_of_driver;

-- No. of accidents happened by overtaking  
SELECT cause_of_accident, COUNT(*) AS accidents_count
FROM road_accident
WHERE cause_of_accident = 'Overtaking';

-- Weighted_severity by days
SELECT day_of_week, 
       avg(CASE 
           WHEN accident_severity = 'Slight Injury' THEN 1
           WHEN accident_severity = 'Serious Injury' THEN 2
           WHEN accident_severity = 'fatal injury' THEN 3
           ELSE 0
         END) AS Average_severity_day_of_week
FROM road_accident
GROUP BY day_of_week
ORDER BY Average_severity_day_of_week  DESC;

-- Avg service year of vehicle in total accidents involvement
SELECT work_of_casuality, AVG(CASE 
           WHEN service_year_of_vehicle = 'Below 1yr' THEN 0.5
           WHEN service_year_of_vehicle = '1-2yr' THEN 1.5
           WHEN service_year_of_vehicle = '2-5yr' THEN 3.5
           WHEN service_year_of_vehicle = '5-10yrs' THEN 7.5
           WHEN service_year_of_vehicle = 'Above 10yr' THEN 12
           ELSE 0
         END) AS avg_service_year_of_vehicle_by_work_of_casuality
FROM road_accident
group by work_of_casuality
order by avg_service_year_of_vehicle_by_work_of_casuality desc;

-- Average no. of vehichles involved by road surface conditions
select road_surface_conditions, avg(number_of_vehicles_involved) as average_no_of_vehicles_involved
from road_accident
group by  road_surface_conditions
order by average_no_of_vehicles_involved desc;

-- Average number of people involved by type of vehicles
select type_of_collision, avg(number_of_casualties) as average_no_of_people_involved
from road_accident
group by type_of_collision
order by average_no_of_people_involved desc;
