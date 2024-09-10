-- Selecciona la base de datos correcta
drop schema If exists tienda_prueba;
create schema tienda_prueba;
USE tienda_prueba;

-- Elimina las tablas si existen para evitar conflictos
DROP TABLE IF EXISTS facturas_productos;
DROP TABLE IF EXISTS facturas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;

-- Crea la tabla de Categorías
CREATE TABLE categorias (
  idcategoria INT NOT NULL AUTO_INCREMENT,
  nombre_categoria VARCHAR(50) NOT NULL,
  PRIMARY KEY (idcategoria)
) ENGINE = InnoDB;

-- Crea la tabla de Productos
CREATE TABLE productos (
  idproducto INT NOT NULL AUTO_INCREMENT,
  nombre_producto VARCHAR(50) NOT NULL,
  precio DECIMAL(10, 2) NOT NULL,
  stock INT NOT NULL,
  descripcion TEXT NULL,
  categoriaid INT NULL,
  PRIMARY KEY (idproducto),
  INDEX fk_p_c_idx (categoriaid ASC),
  CONSTRAINT fk_p_c
    FOREIGN KEY (categoriaid)
    REFERENCES categorias (idcategoria)
    ON DELETE NO ACTION
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- Crea la tabla de Clientes
CREATE TABLE clientes (
  idcliente INT NOT NULL AUTO_INCREMENT,
  nombre_cliente VARCHAR(100) NOT NULL,
  email VARCHAR(45) NULL,
  telefono VARCHAR(45) NULL,
  direccion VARCHAR(45) NULL,
  PRIMARY KEY (idcliente)
) ENGINE = InnoDB;

-- Crea la tabla de Facturas
CREATE TABLE facturas (
  idfactura INT NOT NULL AUTO_INCREMENT,
  fecha DATE NOT NULL,
  total DECIMAL(10, 2) NOT NULL,
  clienteid INT NULL,
  PRIMARY KEY (idfactura),
  INDEX fk_f_c_idx (clienteid ASC),
  CONSTRAINT fk_f_c
    FOREIGN KEY (clienteid)
    REFERENCES clientes (idcliente)
    ON DELETE NO ACTION
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- Crea la tabla de Facturas_Productos para la relación de muchos a muchos
CREATE TABLE facturas_productos (
  idfactura_producto INT NOT NULL AUTO_INCREMENT,
  productoid INT NULL,
  facturaid INT NULL,
  cantidad INT NOT NULL,
  PRIMARY KEY (idfactura_producto),
  INDEX fk_fp_f_idx (facturaid ASC),
  INDEX fk_fp_p_idx (productoid ASC),
  CONSTRAINT fk_fp_f
    FOREIGN KEY (facturaid)
    REFERENCES facturas (idfactura)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT fk_fp_p
    FOREIGN KEY (productoid)
    REFERENCES productos (idproducto)
    ON DELETE NO ACTION
    ON UPDATE CASCADE
) ENGINE = InnoDB;
