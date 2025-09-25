CREATE TEMPORARY TABLE number_of_band_members
SELECT band_id, count(musician_id) AS number_members FROM band_musician GROUP BY band_id;

CREATE TEMPORARY TABLE number_band_members
SELECT number_members, COUNT(number_members) AS number_of_groups FROM number_of_band_members
GROUP BY number_members;

SELECT * FROM number_band_members;

CREATE TEMPORARY TABLE number_band_members_category_2
SELECT number_members, number_of_groups,
CASE
WHEN number_members = 1 THEN 1
WHEN number_members = 2 THEN 2
WHEN number_members = 3 THEN 3
WHEN number_members = 4 THEN 4
WHEN number_members = 5 THEN 5
WHEN number_members BETWEEN 6 AND 10 THEN "6-10"
WHEN number_members >10 THEN "10+"
END AS category
FROM number_band_members; 

SELECT * FROM number_band_members_category;

SELECT category ,SUM(number_of_groups) FROM number_band_members_category_2  
GROUP BY category;