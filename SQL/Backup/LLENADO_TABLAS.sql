-- Selecciona la base de datos correcta
USE tienda_prueba;

-- Inserta datos en la tabla Categorías
INSERT INTO categorias (nombre_categoria) VALUES
    ('Higiene'),
    ('Alimentos'),
    ('Electrónica'),
    ('Ropa'),
    ('Limpieza');

-- Inserta datos en la tabla Productos
INSERT INTO productos (nombre_producto, precio, stock, descripcion, categoriaid) VALUES
    ('Jabón', 2.50, 30, 'Jabón para manos', 1),
    ('Papel Higiénico', 1.00, 50, 'Paquete de 4 rollos', 1),
    ('Arroz', 0.80, 100, 'Arroz de grano largo', 2),
    ('Cereal', 3.50, 4, 'Caja de cereal de maíz', 2),
    ('Televisor', 300.00, 9, 'Smart TV 42 pulgadas', 3),
    ('Camiseta', 15.00, 40, 'Camiseta de algodón', 4);

-- Inserta datos en la tabla Clientes
INSERT INTO clientes (nombre_cliente, email, telefono, direccion) VALUES
    ('Juan Pérez', 'juan.perez@example.com', '555-1234', 'Calle Falsa 123'),
    ('María López', 'maria.lopez@example.com', '555-5678', 'Avenida Siempreviva 742'),
    ('Carlos Ruiz', 'carlos.ruiz@example.com', '555-8765', 'Calle 8 #45-67'),
    ('Ana Gómez', 'ana.gomez@example.com', '555-2345', 'Carrera 10 #20-30'),
    ('Pedro Díaz', 'pedro.diaz@example.com', '555-3456', 'Calle 50 #30-40');

-- Inserta datos en la tabla Facturas
INSERT INTO facturas (fecha, total, clienteid) VALUES
    ('2024-09-01', 50.00, 1),
    ('2024-09-02', 30.00, 2),
    ('2024-09-03', 100.00, 3),
    ('2024-09-04', 75.00, 4),
    ('2024-09-05', 45.00, 5);

-- Inserta datos en la tabla Facturas_Productos (relación muchos a muchos)
INSERT INTO facturas_productos (productoid, facturaid, cantidad) VALUES
    (1, 1, 2),  -- Jabón en la factura de Juan Pérez
    (2, 1, 9),  -- Papel Higiénico en la factura de Juan Pérez
    (3, 2, 10),  -- Arroz en la factura de María López
    (4, 3, 11),  -- Cereal en la factura de Carlos Ruiz
    (5, 4, 12),  -- Televisor en la factura de Ana Gómez
    (6, 5, 13);  -- Camiseta en la factura de Pedro Díaz
