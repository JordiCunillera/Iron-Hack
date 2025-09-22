USE zarabusiness;
SELECT * FROM tiendas;

-- Pregunta 1
SELECT * FROM clientes;

-- Pregunta 2
SELECT * FROM empleados;

-- Pregunta 3
SELECT * FROM tiendas;

-- Pregunta 4
SELECT * FROM prendas;

-- Pregunta 5
SELECT * FROM clientes WHERE LEFT(nombre_cliente, 1)="L";

-- Pregunta 6
SELECT COUNT(id_cliente) FROM clientes;

-- Pregunta 7
SELECT * FROM compras WHERE fecha_compra > '2023-05-01';

-- Pregunta 8
UPDATE clientes
SET email_cliente="carlos.ramirez.1@gmail.com"
WHERE id_cliente=1;

-- Pregunta 9
DELETE FROM clientes
WHERE id_cliente=5;

-- Pregunta 10
SELECT * FROM prendas WHERE color = "Negro";

-- Pregunta 11
SELECT * FROM tiendas WHERE ciudad = "Madrid";

-- Pregunta 12
SELECT COUNT(id_prenda) FROM prendas WHERE precio > 50;

-- Pregunta 13
SELECT COUNT(id_empleado) FROM empleados WHERE tienda_id = 1;

-- Pregunta 14
SELECT * FROM clientes WHERE nombre_cliente = "Andrés";

-- Pregunta 15
SELECT * FROM compras WHERE id_cliente = 2;

-- Pregunta 16
DELETE FROM compras
WHERE monto_total<30;

-- Pregunta 17
SELECT * FROM prendas WHERE precio BETWEEN 20 AND 40;

-- Pregunta 18
SELECT * FROM empleados WHERE nombre_empleado LIKE "%a%";

-- Pregunta 19
SELECT * FROM prendas
ORDER BY precio DESC
LIMIT 5;

-- Pregunta 20
SELECT * FROM compras WHERE monto_total>75 AND id_cliente = 1;

-- Pregunta 21
SELECT * FROM prendas WHERE talla="M";

-- Pregunta 22
UPDATE prendas
SET talla="XS"
WHERE id_prenda=1;

-- Pregunta 23
SELECT * FROM empleados WHERE fecha_contratacion > '2022-01-01';

-- Pregunta 24
SELECT * FROM tiendas WHERE ciudad="Barcelona";

-- Pregunta 25
DELETE FROM empleados
WHERE id_empleado=5;

-- Pregunta 26
SELECT * FROM compras WHERE fecha_compra < '2023-07-01';

-- Pregunta 27
SELECT * FROM prendas WHERE tipo_prenda LIKE "%eta";

-- Pregunta 28
SELECT * FROM clientes WHERE email_cliente NOT LIKE "hotmail";

-- Pregunta 29
SELECT * FROM compras WHERE fecha_compra BETWEEN '2023-09-01' AND '2023-09-30';

-- Pregunta 30
UPDATE tiendas
SET direccion="Calle Gran Vía"
WHERE id_tienda=1;

-- Pregunta 31
SELECT * FROM prendas
WHERE tipo_prenda = "Camiseta";
 
-- Pregunta 32
SELECT * FROM prendas
WHERE precio > 20;
 
-- Pregunta 33
SELECT * FROM tiendas
ORDER BY ciudad;
 
-- Pregunta 34
SELECT nombre_empleado FROM empleados
WHERE puesto = "Vendedor";
 
-- Pregunta 35
SELECT COUNT(DISTINCT(id_prenda)) FROM prendas
WHERE color = "Blanco";
 
-- Pregunta 36
SELECT * FROM clientes
WHERE LENGTH(nombre_cliente) > 10;

-- Pregunta 37
SELECT * FROM compras WHERE monto_total between 50 and 100;
 
-- Pregunta 38
SELECT * FROM compras
ORDER BY fecha_compra desc LIMIT 3;
 
-- Pregunta 39 (no existe ninguna tabla donde aparezcan cursos)
 
-- Pregunta 40
SELECT color, COUNT(id_prenda) FROM prendas
GROUP BY color;

-- Pregunta 41
Insert into tiendas (id_tienda, nombre_tienda, direccion, ciudad, pais) Values (6, "Zara lavapies","Calle lavapies, 13", "Madrid", "España");
Insert into tiendas (id_tienda, nombre_tienda, direccion, ciudad, pais) Values (7, "Zara Tonsi","Calle herakdo, 15", "Madrid", "España");

-- Pregunta 42
UPDATE clientes
SET nombre_cliente="Micaela", email_cliente="micaela@gmail.com"
WHERE nombre_cliente="Andrés García";
