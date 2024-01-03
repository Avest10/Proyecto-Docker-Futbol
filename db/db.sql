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
-- Agrega los equipos restantes...

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
-- Agrega los jugadores restantes...

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
(1, 90),
(2, 85),
-- Agrega más datos de rendimiento...

-- Insertar datos en la tabla HistoricoDeRendimiento
INSERT INTO HistoricoDeRendimiento (HistoricoID, FechaRendimiento, JugadorID, RendimientoID) VALUES
(1, '2024-01-03', 1, 1),
(2, '2024-01-03', 2, 2),
-- Agrega más datos de historial de rendimiento...
