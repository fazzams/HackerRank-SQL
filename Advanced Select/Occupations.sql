-- Final SELECT to pivot the data
SELECT
    -- For each RowNum group, return the name if Occupation = 'Doctor'; NULL otherwise.
    -- Since each RowNum+Occupation combo is unique, MAX just gives us that one name.
    MAX(CASE WHEN Occupation = 'Doctor' THEN Name END) AS Doctor,

    -- Same logic applied to Professor column
    MAX(CASE WHEN Occupation = 'Professor' THEN Name END) AS Professor,

    -- Same logic for Singer column
    MAX(CASE WHEN Occupation = 'Singer' THEN Name END) AS Singer,

    -- Same logic for Actor column
    MAX(CASE WHEN Occupation = 'Actor' THEN Name END) AS Actor

-- Source data is a subquery with row numbers
FROM (
    SELECT 
        Name, 
        Occupation,
        -- Assign a row number within each Occupation group,
        -- ordered alphabetically by Name
        ROW_NUMBER() OVER (
            PARTITION BY Occupation 
            ORDER BY Name
        ) AS RowNum
    FROM OCCUPATIONS
) AS sorted

-- Group by the RowNum so that names in the same row index align together across occupations
GROUP BY RowNum

-- Ensure final output is ordered row by row (i.e., row 1, row 2, etc.)
ORDER BY RowNum;
