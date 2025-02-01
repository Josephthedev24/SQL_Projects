--Count of the records
SELECT COUNT(*) AS AccidentCount
FROM dbo.traffic_accidents

--Getting all the data from table
SELECT * 
FROM dbo.traffic_accidents

--Count of accident by Traffic Control Device
SELECT 
	traffic_control_device,
	COUNT(traffic_control_device) AS AccidentCount,
	ROUND(CAST(COUNT(traffic_control_device)*100 AS float)/(SELECT CAST(COUNT(*) AS float) AS AccidentCount FROM dbo.traffic_accidents),2) AS AccidentPercentage
FROM dbo.traffic_accidents
GROUP BY traffic_control_device
ORDER BY COUNT(traffic_control_device) DESC

--Count of accident by weather condition
SELECT 
	weather_condition,
	COUNT(weather_condition) AS AccidentCount,
	ROUND(CAST(COUNT(weather_condition)*100 AS float)/(SELECT CAST(COUNT(*) AS float) AS AccidentCount FROM dbo.traffic_accidents),2) AS AccidentPercentage
FROM dbo.traffic_accidents
GROUP BY weather_condition
ORDER BY COUNT(weather_condition) DESC

--Count of accident by lightning condition
SELECT 
	lighting_condition,
	COUNT(lighting_condition) AS AccidentCount,
	ROUND(CAST(COUNT(lighting_condition)*100 AS float)/(SELECT CAST(COUNT(*) AS float) AS AccidentCount FROM dbo.traffic_accidents),2) AS AccidentPercentage
FROM dbo.traffic_accidents
GROUP BY lighting_condition
ORDER BY COUNT(lighting_condition) DESC

--Count of accident by first crash type
SELECT 
	first_crash_type,
	COUNT(first_crash_type) AS AccidentCount,
	ROUND(CAST(COUNT(first_crash_type)*100 AS float)/(SELECT CAST(COUNT(*) AS float) AS AccidentCount FROM dbo.traffic_accidents),2) AS AccidentPercentage
FROM dbo.traffic_accidents
GROUP BY first_crash_type
ORDER BY COUNT(first_crash_type) DESC
