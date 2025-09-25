USE bands;

SELECT band_id, COUNT(album_id) AS number_of_albums, SUM(sales_amount) AS total_sales FROM album
GROUP BY band_id;

SELECT album.band_id, COUNT(DISTINCT album.album_id) AS number_of_albums, SUM(DISTINCT(sales_amount)) AS total_sales, COUNT(DISTINCT(band_genre.genre_name)) AS number_of_genres FROM album
JOIN band_genre
ON album.band_id = band_genre.band_id
GROUP BY album.band_id;

SELECT album.band_id, band.band_name, COUNT(DISTINCT(genre_name)) AS number_of_genres, SUM(DISTINCT(sales_amount)) AS total_sales FROM album
JOIN band_genre
ON album.band_id = band_genre.band_id
JOIN band
ON album.band_id=band.band_id
GROUP BY album.band_id
ORDER BY band_id;

SELECT band_name, SUM(sales_amount) AS total_sales FROM album
JOIN band
ON album.band_id=band.band_id
GROUP BY album.band_id
ORDER BY total_sales DESC
LIMIT 5;

SELECT band_id, SUM(sales_amount) FROM album
GROUP BY band_id;

CREATE TEMPORARY TABLE temp AS
SELECT album.band_id, COUNT(DISTINCT album.album_id) AS number_of_albums, 
COUNT(DISTINCT(band_genre.genre_name)) AS number_of_genres FROM album
JOIN band_genre
ON album.band_id = band_genre.band_id
GROUP BY album.band_id;

SELECT * FROM temp;

SELECT temp.band_id, band.band_name, SUM(album.sales_amount) AS total_sales FROM temp
JOIN album
ON album.band_id = temp.band_id
JOIN band
ON album.band_id=band.band_id
GROUP BY album.band_id;

SELECT temp.band_id, temp.number_of_albums, temp.number_of_genres, SUM(album.sales_amount) FROM temp
JOIN album
ON album.band_id = temp.band_id
GROUP BY temp.band_id;

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
    year(a.release_date) AS year,
    SUM(a.sales_amount) AS total_sales
FROM album AS a
JOIN top_bands AS tb
    ON a.band_id = tb.band_id
JOIN band AS b
    ON a.band_id = b.band_id
GROUP BY year
ORDER BY b.band_name, year;