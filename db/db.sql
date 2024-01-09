-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS mydatabase;
USE mydatabase;

-- Crear la tabla Equipos
CREATE TABLE Equipos (
    EquipoID INT PRIMARY KEY,
    NombreEquipo VARCHAR(50) NOT NULL
);

-- Insertar algunos equipos importantes de Europa
INSERT INTO Equipos (EquipoID, NombreEquipo) VALUES
(1, 'Real Madrid'),
(2, 'FC Barcelona'),
(3, 'Manchester United'),
(4, 'Bayern Munich'),
(5, 'Liverpool');


-- Crear la tabla Jugadores
CREATE TABLE Jugadores (
    JugadorID INT PRIMARY KEY,
    NombreJugador VARCHAR(50) NOT NULL,
    EquipoID INT,
    FOREIGN KEY (EquipoID) REFERENCES Equipos(EquipoID)
);

-- Insertar 11 jugadores por cada equipo
INSERT INTO Jugadores (JugadorID, NombreJugador, EquipoID) VALUES
-- Jugadores del Real Madrid (EquipoID = 1)
(1, 'Cristiano Ronaldo', 1),
(2, 'Sergio Ramos', 1),
(3, 'Thomas Muller', 4),
(4, 'Leo Messi', 2),
(5, 'Wayne Rooney', 3),
(6, 'Mohamed Salah', 5);


-- Crear la tabla Rendimiento
CREATE TABLE Rendimiento (
    RendimientoID INT PRIMARY KEY,
    Puntuacion INT NOT NULL
    -- Agrega otros campos de rendimiento según tus necesidades
);

-- Crear la tabla HistoricoDeRendimiento
CREATE TABLE HistoricoDeRendimiento (
    HistoricoID INT PRIMARY KEY,
    FechaRendimiento DATE NOT NULL,
    JugadorID INT,
    RendimientoID INT,
    FOREIGN KEY (JugadorID) REFERENCES Jugadores(JugadorID),
    FOREIGN KEY (RendimientoID) REFERENCES Rendimiento(RendimientoID)
);

-- Insertar algunos datos en la tabla Rendimiento
INSERT INTO Rendimiento (RendimientoID, Puntuacion) VALUES
(1, 95),
(2, 85),
(3, 88),
(4, 83),
(5, 90),
(6, 87);


-- Insertar datos en la tabla HistoricoDeRendimiento
INSERT INTO HistoricoDeRendimiento (HistoricoID, FechaRendimiento, JugadorID, RendimientoID) VALUES
(1, '2024-01-03', 1, 1),
(2, '2024-02-04', 2, 2),
(3, '2024-03-05', 3, 3),
(4, '2024-04-06', 4, 4),
(5, '2024-05-04', 5, 5),
(6, '2024-06-05', 6, 6);
