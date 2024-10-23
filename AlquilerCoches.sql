-- Christian Avero Pérez 

-- Eliminamos la base de datos alquilerCoches si exsitiera
DROP DATABASE IF EXISTS alquilerCoches;
-- Creamos la base de datos alquilerCoches
CREATE DATABASE IF NOT EXISTS alquilerCoches;
-- Seleccionamos la base de datos alquilerCoches
USE alquilerCoches;

SELECT 'CREATING DATABASE STRUCTURE' as 'INFO';

-- Eliminamos las tablas si existieran
DROP TABLE IF EXISTS Cliente,
                     Coche,
                     Avalado,
                     Coche_Preparado, 
                     Resera;

-- Creamos las tablas 
CREATE TABLE Cliente
(
  Id_C CHAR(5) NOT NULL,
  DNI CHAR(9),
  Nombre VARCHAR(20) NOT NULL,
  Dirección VARCHAR(50) NOT NULL,
  Teléfono NUMERIC(12),
  PRIMARY KEY (Id_C),
  UNIQUE (DNI)
);

CREATE TABLE Coche
(
  Matrícula VARCHAR(7) NOT NULL,
  Modelo VARCHAR(15) NOT NULL,
  Color VARCHAR(10) NOT NULL,
  Marca VARCHAR(10) NOT NULL,
  PHora INT NOT NULL,
  PRIMARY KEY (Matrícula)
);

CREATE TABLE Avalado
(
  Id_C1 CHAR(5) NOT NULL,
  Id_C2 CHAR(5) NOT NULL,
  PRIMARY KEY (Id_C, Id_C),
  FOREIGN KEY (Id_C1) REFERENCES Cliente(Id_C),
  FOREIGN KEY (Id_C2) REFERENCES Cliente(Id_C)
);

CREATE TABLE Coche_Preparado
(
  LitrosGasolina CHAR(3) NOT NULL,
  Matrícula VARCHAR(7) NOT NULL,
  PRIMARY KEY (Matrícula),
  FOREIGN KEY (Matrícula) REFERENCES Coche(Matrícula)
);

CREATE TABLE Reserva
(
  NIdentificación CHAR(5) NOT NULL,
  PrecioTotal NUMERIC(4) NOT NULL,
  FInicio DATE NOT NULL,
  FReserva INT NOT NULL,
  Id_C CHAR(5) NOT NULL,
  Matrícula VARCHAR(7) NOT NULL,
  PRIMARY KEY (NIdentificación),
  FOREIGN KEY (Id_C) REFERENCES Cliente(Id_C),
  FOREIGN KEY (Matrícula) REFERENCES Coche_Preparado(Matrícula)
);

