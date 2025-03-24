/* =========== Detect triangle */
select
    CASE
        WHEN A + B <= C OR A + C <= B OR B + C <= A THEN 'Not A Triangle'   /* must be the first condition */
        WHEN A = B AND B = C THEN 'Equilateral'
        WHEN A = B OR B = C OR A = C THEN 'Isosceles'
        ELSE 'Scalene'
    END
from triangles;
/* =========== CONCAT string */
(select
 concat(name, '(', left(Occupation, 1), ')') as name
from occupations
order by name);
/* do not use UNION beause it will not show correct order */
(select
 concat('There are a total of ', count(Occupation), ' ', lower(Occupation), 's.' ) as sentence
from occupations
group by Occupation
order by count(Occupation) ASC, Occupation ASC
);
/* =========== */
uncompleted
SELECT
        Name,
        Occupation,
        ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) AS rn
    FROM OCCUPATIONS;