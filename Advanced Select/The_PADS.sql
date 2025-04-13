-- First query: List names with first letter of occupation

SELECT 

    CONCAT(Name, '(', LEFT(Occupation, 1), ')') AS formatted_name

FROM 

    Occupations

ORDER BY 

    Name;

-- Second query: Count of each occupation in specific format

SELECT 

    CONCAT('There are a total of ', COUNT(*), ' ', LOWER(Occupation), 's.') AS occupation_count

FROM 

    Occupations

GROUP BY 

    Occupation

ORDER BY 

    COUNT(*),Occupation;