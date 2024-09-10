-- _______________________________________________________________________________________
-- Muestra Stock de un producto antes y despues de una venta
START TRANSACTION;
SET @stock_actual = (
	SELECT stock 
	FROM productos WHERE idproducto = 1);
UPDATE productos 
SET stock = stock - (SELECT cantidad 
					FROM facturas_productos 
                    WHERE productoid = 1 AND facturaid = 1)
WHERE idproducto = 1;
SELECT 
	nombre_producto as producto,
    @stock_actual AS stock_actual, 
    stock AS stock_actualizado
FROM productos
WHERE idproducto = 1;
COMMIT;
-- _______________________________________________________________________________________
-- filtro sobre productos con bajo stock
use tienda_prueba;
SELECT nombre_producto, stock
FROM productos
WHERE stock < 10;
-- _______________________________________________________________________________________
-- 3 productos mas vendidos
SELECT 
	p.nombre_producto, 
    SUM(fp.cantidad) AS total_vendido
FROM facturas_productos fp
JOIN productos p ON fp.productoid = p.idproducto
GROUP BY p.idproducto
HAVING total_vendido >= 10
ORDER BY total_vendido DESC
Limit 3;

-- _______________________________________________________________________________________
-- total de ventas por categoria
SELECT 
	c.nombre_categoria, 
    SUM(fp.cantidad * p.precio) AS total_ventas
FROM facturas_productos fp
JOIN productos p ON fp.productoid = p.idproducto
JOIN categorias c ON p.categoriaid = c.idcategoria
GROUP BY c.idcategoria
ORDER BY total_ventas DESC;
