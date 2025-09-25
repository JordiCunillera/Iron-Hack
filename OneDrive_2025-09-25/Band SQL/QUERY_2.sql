USE bands;

-- GRUPOS CON POR AÑOS
SELECT
    band_id,
    TIMESTAMPDIFF(YEAR, MIN(release_date), MAX(release_date)) AS active_years,
    SUM(sales_amount) AS total_sales_amount,
    ROUND(SUM(run_time)) AS total_album_run_time_in_m
FROM album
GROUP BY band_id;

SELECT COUNT(*) AS bands_higher_than_1M
FROM (
	SELECT band_id
    FROM album
    GROUP BY band_id
    HAVING SUM(sales_amount) > 1000000
) AS sub;

SELECT COUNT(*) AS bands_lower_than_1M
FROM (
    SELECT band_id
    FROM album
    GROUP BY band_id
    HAVING SUM(sales_amount) < 1000000
) AS sub;

SELECT COUNT(*) AS bands_over_2500_mins
FROM (
    SELECT band_id
    FROM album
    GROUP BY band_id
    HAVING SUM(run_time) >= 2500
) AS sub;

SELECT COUNT(*) AS bands_under_2500_mins
FROM (
    SELECT band_id
    FROM album
    GROUP BY band_id
    HAVING SUM(run_time) < 2500
) AS sub;


-- TOP 5 BANDS

SELECT 
	band_name AS top_band_name,
	sales_done
FROM (
	SELECT 
		band_id,
		SUM(sales_amount) AS sales_done
	FROM album
	GROUP BY band_id
	ORDER BY sales_done DESC
	LIMIT 5
) AS sub
JOIN band AS b
ON sub.band_id = b.band_id;


SELECT 
	band_name AS top_band_name,
	sales_done
FROM (
	SELECT 
		band_id,
		SUM(sales_amount) AS sales_done
	FROM album
	GROUP BY band_id
	ORDER BY sales_done DESC
	LIMIT 5
) AS sub
JOIN band AS b
ON sub.band_id = b.band_id;


WITH top_bands AS (
    SELECT 
        band_id
    FROM album
    GROUP BY band_id
    ORDER BY SUM(sales_amount) DESC
    LIMIT 5
)
SELECT 
    b.band_name,
    a.album_id,
    a.release_date,
    a.sales_amount
FROM album AS a
JOIN top_bands AS tb
    ON a.band_id = tb.band_id
JOIN band AS b
    ON a.band_id = b.band_id
ORDER BY b.band_name, a.release_date;


WITH top_bands AS (
    SELECT 
        band_id
    FROM album
    GROUP BY band_id
    ORDER BY SUM(sales_amount) DESC
    LIMIT 5
)
SELECT 
    b.band_name,
    a.album_name,
    a.release_date,
    SUM(a.sales_amount) AS total_sales_for_album
FROM album AS a
JOIN top_bands AS tb
    ON a.band_id = tb.band_id
JOIN band AS b
    ON a.band_id = b.band_id
GROUP BY b.band_name, a.album_name, a.release_date
ORDER BY b.band_name, a.release_date;

-- TOP 5 ARTISTAS HISTORICOS 
WITH top_bands AS (
    -- Seleccionamos los 5 artistas con mayores ventas totales
    SELECT 
        band_id
    FROM album
    GROUP BY band_id
    ORDER BY SUM(sales_amount) DESC
    LIMIT 5
)
SELECT 
    b.band_name,
    YEAR(a.release_date) AS release_year,
    SUM(a.sales_amount) AS total_sales
FROM album AS a
JOIN top_bands AS tb
    ON a.band_id = tb.band_id
JOIN band AS b
    ON a.band_id = b.band_id
GROUP BY b.band_name, YEAR(a.release_date)
ORDER BY b.band_name, release_year;
