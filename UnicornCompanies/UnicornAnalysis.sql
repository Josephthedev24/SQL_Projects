--Retrieve all data from table
SELECT * 
FROM dbo.funds

--Count of Unicorns
SELECT COUNT(*) AS CountOfUnicorns
FROM dbo.funds

--Count of unicorns by country (Not Null)
SELECT Country , COUNT(Country) AS UnicornCount
FROM dbo.funds 
WHERE Country <> 'n/a'
GROUP BY Country
ORDER BY Unicorn_Count DESC

--Count of unicorns by Fund Structure
SELECT Fund_structure , COUNT(Fund_structure) AS UnicornCount
FROM dbo.funds
WHERE Fund_structure <> 'n/a'
GROUP BY Fund_structure

--Retrieving all industries from Top industries column and load into industries CTE
WITH industries AS (
    SELECT DISTINCT TRIM(value) AS Industry
    FROM dbo.funds
    CROSS APPLY STRING_SPLIT(Some_of_TOP_industries, ',')
)
SELECT * 
FROM industries

--Count of Unicorns by industries
WITH industries AS (
    SELECT DISTINCT TRIM(value) AS Industry
    FROM dbo.funds
    CROSS APPLY STRING_SPLIT(Some_of_TOP_industries, ',')
)
SELECT i.Industry, COUNT(*) AS UnicornCount
FROM dbo.funds f
JOIN industries i 
ON f.Some_of_TOP_industries LIKE '%' + i.Industry + '%'
GROUP BY i.Industry
ORDER BY CompanyCount DESC;




