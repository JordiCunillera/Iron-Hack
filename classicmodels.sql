USE classicmodels;

-- EJERCICIO 1

-- Contactos de oficina: Tiene una tabla que contiene los códigos de oficina y sus números de teléfono asociados.
SELECT officeCode, phone FROM offices;

-- Detectives de correo electrónico: ¿Puede identificar a los empleados cuyas direcciones de correo electrónico terminan en “.es”?
SELECT firstName, lastName FROM employees WHERE email LIKE "%.es";

-- Estado de confusión: descubra qué clientes carecen de información estatal en sus registros.
SELECT customerName FROM customers WHERE state IS NULL;

-- Grandes gastadores: busquemos pagos que superen los $20.000.
SELECT * FROM payments WHERE amount > 20000;

-- Grandes gastadores de 2005: Ahora, acote la lista aún más y busque los pagos mayores a $20,000 que se realizaron en el año 2005.
SELECT * FROM payments WHERE amount > 20000 AND paymentDate BETWEEN "2005-01-01" AND "2006-01-01";

-- Detalles distintos: busque y muestre solo las filas únicas de la tabla “orderdetails” en función de la columna “productcode”.
SELECT DISTINCT productCode FROM orderdetails;

-- Estadísticas globales de compradores: por último, cree una tabla que muestre el recuento de compras realizadas por país.
SELECT country, COUNT(*) FROM customers
GROUP BY country;


-- EJERCICIO 2

-- Descripción de línea de producto más larga: descubramos qué línea de producto tiene la descripción de texto más larga.
SELECT productline FROM productlines
ORDER BY length(textDescription) ASC
LIMIT 1;

-- Recuento de clientes de oficina: ¿Puede determinar el número de empleados asociados a cada oficina?
SELECT officeCode, COUNT(*) FROM customers
LEFT JOIN employees
ON customers.salesRepEmployeeNumber=employees.employeeNumber
GROUP BY officeCode;

-- Día de mayores ventas de automóviles: descubra qué día de la semana se registra el mayor número de ventas de automóviles.
SELECT DAYOFWEEK(paymentDate) AS day_week, SUM(amount) AS ventas_totales FROM payments
GROUP BY day_week
ORDER BY ventas_totales DESC
LIMIT 1;

-- Corrección de datos territoriales faltantes: Hay algunos valores faltantes (NA) en la variable " territory " de la tabla " offices ". Podemos usar una instrucción "case when" para corregir estos valores y establecerlos en " USA".
SELECT *, 
CASE 
	WHEN territory = "NA" THEN "USA"
    ELSE territory
END AS "New Territory"
FROM offices;

