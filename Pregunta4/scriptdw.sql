-- Tabla de hechos
CREATE TABLE Transaccion_Fact (
  ID_Transaccion INT PRIMARY KEY,
  ID_Cliente INT,
  ID_Cuenta INT,
  Monto DECIMAL(10, 2),
  Fecha DATETIME,
  CONSTRAINT FK_Transaccion_Cliente FOREIGN KEY (ID_Cliente) REFERENCES Cliente_Dim(ID_Cliente),
  CONSTRAINT FK_Transaccion_Cuenta FOREIGN KEY (ID_Cuenta) REFERENCES Cuenta_Dim(ID_Cuenta)
);

-- Tabla de dimensiones
CREATE TABLE Cliente_Dim (
  ID_Cliente INT PRIMARY KEY,
  Nombre VARCHAR(50),
  Apellido VARCHAR(50),
  Edad INT,
  Correo VARCHAR(100)
);

CREATE TABLE Cuenta_Dim (
  ID_Cuenta INT PRIMARY KEY,
  Tipo VARCHAR(50),
  Saldo DECIMAL(10, 2)
);

CREATE TABLE Fecha_Dim (
  Fecha DATETIME PRIMARY KEY,
  DiaSemana VARCHAR(20),
  Mes VARCHAR(20),
  Anio INT
);

-- Tabla de agregación
CREATE TABLE SaldoPromedio_Agregacion (
  ID_Cliente INT,
  Fecha DATETIME,
  SaldoPromedio DECIMAL(10, 2),
  CONSTRAINT FK_SaldoPromedio_Cliente FOREIGN KEY (ID_Cliente) REFERENCES Cliente_Dim(ID_Cliente),
  CONSTRAINT FK_SaldoPromedio_Fecha FOREIGN KEY (Fecha) REFERENCES Fecha_Dim(Fecha)
);