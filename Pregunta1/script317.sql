-- Creación de las tablas

CREATE TABLE Cliente (
  ID_Cliente INT PRIMARY KEY,
  Nombre VARCHAR(50),
  Apellido VARCHAR(50),
  Edad INT,
  Correo VARCHAR(100)
);

CREATE TABLE Cuenta (
  ID_Cuenta INT PRIMARY KEY,
  ID_Cliente INT,
  Tipo VARCHAR(50),
  Saldo DECIMAL(10, 2),
  FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

CREATE TABLE Transaccion (
  ID_Transaccion INT PRIMARY KEY,
  ID_Cuenta INT,
  Tipo VARCHAR(50),
  Monto DECIMAL(10, 2),
  Fecha DATETIME,
  FOREIGN KEY (ID_Cuenta) REFERENCES Cuenta(ID_Cuenta)
);

CREATE TABLE Prestamo (
  ID_Prestamo INT PRIMARY KEY,
  ID_Cliente INT,
  Monto DECIMAL(10, 2),
  Interes DECIMAL(4, 2),
  Fecha_inicio DATE,
  Fecha_fin DATE,
  FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

CREATE TABLE Ingreso (
  ID_Ingreso INT PRIMARY KEY,
  ID_Cliente INT,
  Tipo VARCHAR(50),
  Monto DECIMAL(10, 2),
  Fecha DATE,
  FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

CREATE TABLE Gasto (
  ID_Gasto INT PRIMARY KEY,
  ID_Cliente INT,
  Categoria VARCHAR(50),
  Monto DECIMAL(10, 2),
  Fecha DATE,
  FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

CREATE TABLE Banco (
  ID_Banco INT PRIMARY KEY,
  Nombre VARCHAR(50),
  Direccion VARCHAR(100),
  Telefono VARCHAR(20)
);

-- Inserción de registros de ejemplo

-- Tabla: Cliente
INSERT INTO Cliente (ID_Cliente, Nombre, Apellido, Edad, Correo)
VALUES
  (1, 'Juan', 'Pérez', 35, 'juanperez@example.com'),
  (2, 'María', 'López', 42, 'marialopez@example.com'),
  (3, 'Pedro', 'Gómez', 28, 'pedrogomez@example.com'),
  (4, 'Ana', 'Torres', 31, 'anatorres@example.com'),
  (5, 'Luis', 'Rodríguez', 39, 'luisrodriguez@example.com'),

   (6, 'Vladimir', 'Pérez', 29, 'vladimirperez@example.com'),
  (7, 'Fernanda', 'López', 42, 'marialopez@example.com'),
  (8, 'Laura', 'Gómez', 28, 'pedrogomez@example.com'),
  (9, 'Lucas', 'Torres', 31, 'anatorres@example.com'),
  (10, 'Marcos', 'Rodríguez', 39, 'luisrodriguez@example.com');

-- Tabla: Cuenta
INSERT INTO Cuenta (ID_Cuenta, ID_Cliente, Tipo, Saldo)
VALUES
  (01, 1, 'Ahorros', 1000.00),
  (02, 2, 'Corriente', 5000.00),
  (03, 3, 'Ahorros', 2500.00),
  (04, 4, 'Corriente', 3000.00),
  (05, 5, 'Ahorros', 2000.00),

    (06, 6, 'Ahorros', 1000.00),
  (07, 7, 'Corriente', 5000.00),
  (09, 8, 'Ahorros', 2500.00),
  (04, 9, 'Corriente', 3000.00),
  (05, 10, 'Ahorros', 2000.00);

-- Tabla: Transacción
INSERT INTO Transaccion (ID_Transaccion, ID_Cuenta, Tipo, Monto, Fecha)
VALUES
  (001, 01, 'Depósito', 500.00, '2023-05-01 09:30:00'),
  (002, 02, 'Retiro', 1000.00, '2023-05-02 14:45:00'),
  (003, 03, 'Depósito', 1000.00, '2023-05-03 11:20:00'),
  (004, 04, 'Retiro', 500.00, '2023-05-04 16:10:00'),
  (005, 05, 'Depósito', 800.00, '2023-05-05 13:55:00'),

  (006, 06, 'Depósito', 500.00, '2023-05-01 09:30:00'),
  (007, 07, 'Retiro', 1000.00, '2023-05-02 14:45:00'),
  (008, 08, 'Depósito', 1000.00, '2023-05-03 11:20:00'),
  (009, 09, 'Retiro', 500.00, '2023-05-04 16:10:00'),
  (0010, 010, 'Depósito', 800.00, '2023-05-05 13:55:00'),
-- Tabla: Préstamo
INSERT INTO Prestamo (ID_Prestamo, ID_Cliente, Monto, Interes, Fecha_inicio, Fecha_fin)
VALUES
  (100, 1, 5000.00, 0.1, '2022-03-15', '2023-03-15'),
  (200, 2, 10000.00, 0.08, '2023-01-10', '2024-01-10'),
  (300, 3, 3000.00, 0.12, '2023-05-01', '2024-05-01'),
  (400, 4, 7000.00, 0.09, '2022-11-20', '2023-11-20'),
  (500, 5, 2000.00, 0.15, '2023-02-05', '2024-02-05'),

   (600, 6, 5000.00, 0.1, '2022-03-15', '2023-03-15'),
  (700, 7, 10000.00, 0.08, '2023-01-10', '2024-01-10'),
  (800, 8, 3000.00, 0.12, '2023-05-01', '2024-05-01'),
  (900, 9, 7000.00, 0.09, '2022-11-20', '2023-11-20'),
  (1000, 10, 2000.00, 0.15, '2023-02-05', '2024-02-05');

-- Tabla: Ingreso
INSERT INTO Ingreso (ID_Ingreso, ID_Cliente, Tipo, Monto, Fecha)
VALUES
  (11, 1, 'Salario', 2500.00, '2023-05-01'),
  (21, 2, 'Negocio', 500.00, '2023-05-02'),
  (31, 3, 'Alquiler', 800.00, '2023-05-03'),
  (41, 4, 'Salario', 3000.00, '2023-05-04'),
  (51, 5, 'Inversiones', 1500.00, '2023-05-05'),

  (61, 6, 'Salario', 2500.00, '2023-05-01'),
  (71, 7, 'Negocio', 500.00, '2023-05-02'),
  (81, 8, 'Alquiler', 800.00, '2023-05-03'),
  (91, 9, 'Salario', 3000.00, '2023-05-04'),
  (101, 10, 'Inversiones', 1500.00, '2023-05-05');

-- Tabla: Gasto
INSERT INTO Gasto (ID_Gasto, ID_Cliente, Categoria, Monto, Fecha)
VALUES
  (12, 1, 'Alimentación', 200.00, '2023-05-01'),
  (22, 2, 'Transporte', 50.00, '2023-05-02'),
  (32, 3, 'Entretenimiento', 150.00, '2023-05-03'),
  (42, 4, 'Servicios', 100.00, '2023-05-04'),
  (52, 5, 'Ropa', 300.00, '2023-05-05'),

   (62, 6, 'Alimentación', 200.00, '2023-05-01'),
  (72, 7, 'Transporte', 50.00, '2023-05-02'),
  (82, 8, 'Entretenimiento', 150.00, '2023-05-03'),
  (92, 9, 'Servicios', 100.00, '2023-05-04'),
  (102, 10, 'Ropa', 300.00, '2023-05-05');

-- Tabla: Banco
INSERT INTO Banco (ID_Banco, Nombre, Direccion, Telefono)
VALUES
  (13, 'Banco Central', 'Calle Principal 123', '+1 123-456-7890'),
  (23, 'Banco Comercial', 'Avenida Central 456', '+1 987-654-3210'),
  (33, 'Banco de Inversión', 'Plaza Mayor 789', '+1 555-123-4567'),

    (43, 'Banco Central', 'Calle Principal 123', '+1 123-456-7890'),
  (53, 'Banco Comercial', 'Avenida Central 456', '+1 987-654-3210'),
  (63, 'Banco de Inversión', 'Plaza Mayor 789', '+1 555-123-4567');
