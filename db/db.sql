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
(5, 'Liverpool'),
(6, 'Paris Saint-Germain'),
(7, 'Juventus'),
(8, 'Chelsea'),
(9, 'Borussia Dortmund'),
(10, 'AC Milan');

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
(3, 'Robert Lewandowski', 4),
(4, 'Thomas Müller', 4),
(5, 'Leo Messi', 2),
(6, 'Wayne Rooney', 3),
(7, 'Mohamed Salah', 5),
(8, 'Zlatan Ibrahimovich', 6),
(9, 'Paul Pogba', 7),
(10, 'Dider Drogba', 8),
(11, 'Marco Reus', 9),
(12, 'Andrea Pirlo', 10);

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
(1, 96),
(2, 93),
(3, 89),
(4, 87),
(5, 94),
(6, 83),
(7, 78),
(8, 81),
(9, 80),
(10, 82),
(11, 87),
(12, 85),
(13, 88),
(14, 85),
(15, 90),
(16, 78),
(17, 92),
(18, 89),
(19, 84),
(20, 87),
(21, 81),
(22, 79),
(23, 93),
(24, 86);
(25, 91),
(26, 88),
(27, 86),
(28, 89),
(29, 94),
(30, 82),
(31, 79),
(32, 80),
(33, 83),
(34, 88),
(35, 87),
(36, 90);

-- Insertar datos en la tabla HistoricoDeRendimiento
INSERT INTO HistoricoDeRendimiento (HistoricoID, FechaRendimiento, JugadorID, RendimientoID) VALUES

-- JugadorID 1
(1, '2024-02-01', 1, 1),
(2, '2024-02-15', 1, 2),
(3, '2024-03-05', 1, 3),

-- JugadorID 2
(4, '2024-02-02', 2, 4),
(5, '2024-02-18', 2, 5),
(6, '2024-03-10', 2, 6),

-- JugadorID 3
(7, '2024-02-03', 3, 7),
(8, '2024-02-20', 3, 8),
(9, '2024-03-15', 3, 9),

-- JugadorID 4
(10, '2024-02-04', 4, 10),
(11, '2024-02-22', 4, 11),
(12, '2024-03-20', 4, 12),

-- JugadorID 5
(13, '2024-02-05', 5, 13),
(14, '2024-02-25', 5, 14),
(15, '2024-03-25', 5, 15),

-- JugadorID 6
(16, '2024-02-06', 6, 16),
(17, '2024-02-28', 6, 17),
(18, '2024-03-30', 6, 18),

-- JugadorID 7
(19, '2024-02-07', 7, 19),
(20, '2024-02-29', 7, 20),
(21, '2024-03-31', 7, 21),

-- JugadorID 8
(22, '2024-02-08', 8, 22),
(23, '2024-03-01', 8, 23),
(24, '2024-04-01', 8, 24),

-- JugadorID 9
(25, '2024-02-09', 9, 25),
(26, '2024-03-05', 9, 26),
(27, '2024-04-05', 9, 27),

-- JugadorID 10
(28, '2024-02-10', 10, 28),
(29, '2024-03-10', 10, 29),
(30, '2024-04-10', 10, 30),

-- JugadorID 11
(31, '2024-02-11', 11, 31),
(32, '2024-03-15', 11, 32),
(33, '2024-04-15', 11, 33),

-- JugadorID 12
(34, '2024-02-12', 12, 34),
(35, '2024-03-20', 12, 35),
(36, '2024-04-20', 12, 36);