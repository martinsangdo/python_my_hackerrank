/* =========== Detect triangle and condition */
select
    CASE
        WHEN A + B <= C OR A + C <= B OR B + C <= A THEN 'Not A Triangle'   /* must be the first condition */
        WHEN A = B AND B = C THEN 'Equilateral'
        WHEN A = B OR B = C OR A = C THEN 'Isosceles'
        ELSE 'Scalene'
    END
from triangles;
/* =========== CONCAT and Sub string */
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
/* =========== partition */
uncompleted
SELECT
        Name,
        Occupation,
        ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) AS rn /* partition is not reducing the rows */
    FROM OCCUPATIONS;
/* =========== lower and upper case */
SELECT * FROM my_table WHERE UPPER(column_name) = UPPER('Search Term');
SELECT * FROM my_table WHERE LOWER(column_name) = LOWER('Search Term');
/* =========== COALESCE */
COALESCE(value1, value2, value3, ...)
SELECT COALESCE(NULL, 'Default Value');
/* =========== avg */
select floor(avg(population))
from city;
/* =========== regexp */
select name
from employees
where name regexp '^[Kr]';
/* =========== remove digit or character */
select ceil(avg(salary) - avg(REGEXP_REPLACE(salary, '0', '')))
from employees;
/* =========== table alias and count (must aggregate with group by) */
SELECT CONCAT(earnings, ' ', earnings_count)
FROM (
    SELECT earnings, COUNT(*) AS earnings_count
    FROM (
        SELECT salary * months AS earnings
        FROM employee
    ) AS tbl_earnings
    GROUP BY earnings
    ORDER BY earnings_count DESC
    LIMIT 1
) AS most_frequent_earnings;