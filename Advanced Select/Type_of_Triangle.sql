/* 
Classify triangles based on side lengths A, B, and C.
Includes a check to ensure the values form a valid triangle.
*/

SELECT 
    A, 
    B, 
    C, 
    CASE 
        -- First, check if the sides do NOT form a valid triangle.
        -- According to the triangle inequality theorem:
        -- The sum of any two sides must be greater than the third side.
        WHEN A + B <= C OR A + C <= B OR B + C <= A THEN "Not A Triangle"

        -- If all three sides are equal, it's an Equilateral triangle.
        WHEN A = B AND B = C THEN "Equilateral"

        -- If any two sides are equal, it's an Isosceles triangle.
        WHEN A = B OR A = C OR B = C THEN "Isosceles"

        -- If all sides are different, it's a Scalene triangle.
        ELSE "Scalene"
    END AS Type
FROM TRIANGLES;
