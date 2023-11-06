SELECT * FROM evento

ALTER TABLE evento
DROP COLUMN Descripcion

ALTER TABLE evento
DROP COLUMN FechasHorarios

ALTER TABLE evento
ADD fechaInicio DATE

ALTER TABLE evento
ADD fechaFin DATE

CREATE TABLE Enfrentamientos (
  ID INT PRIMARY KEY,
  FechaHora DATETIME,
  EquipoLocalID INT,
  EquipoVisitanteID INT,
  DeporteID INT,
  Ronda INT,
  FOREIGN KEY (EquipoLocalID) REFERENCES equipo(ID),
  FOREIGN KEY (EquipoVisitanteID) REFERENCES equipo(ID),
  FOREIGN KEY (DeporteID) REFERENCES deporte(ID)
);

SELECT * FROM sede

INSERT INTO sede (NombreSede) VALUES
('Lima Centro'),
('Lima Norte'),
('Lima Sur'),
('Lima Este - SJL'),
('Lima Este - Ate'),
('Ciudad Arequipa'),
('Ciudad Chiclayo'),
('Ciudad Chimbote'),
('Ciudad Huancayo'),
('Ciudad Ica'),
('Ciudad Piura'),
('Ciudad Trujillo')


SELECT * FROM deporte

INSERT INTO deporte (NombreDeporte)
VALUES ('Football'),('Volley'),('Basket')

-- Para DeporteID, 1 representa "F�tbol", 2 representa "V�ley", 3 representa "Baloncesto"
-- Para SedeID, sigue el orden de las sedes que proporcionaste

-- Ejemplo de inserciones
INSERT INTO evento (NombreEvento, SedeID, DeporteID, fechaInicio, fechaFin)
VALUES
  ('Evento de F�tbol en Lima Centro', 1, 1, '2023-11-01', '2023-11-10'),
  ('Evento de F�tbol en Lima Norte', 2, 1, '2023-11-05', '2023-11-15'),
  ('Evento de F�tbol en Lima Sur', 3, 1, '2023-11-08', '2023-11-18'),
  ('Evento de F�tbol en Lima Este - SJL', 4, 1, '2023-11-12', '2023-11-22'),
  ('Evento de F�tbol en Lima Este - Ate', 5, 1, '2023-11-15', '2023-11-25'),
  ('Evento de F�tbol en Ciudad Arequipa', 6, 1, '2023-11-19', '2023-11-29'),
  ('Evento de F�tbol en Ciudad Chiclayo', 7, 1, '2023-11-23', '2023-12-03'),
  ('Evento de F�tbol en Ciudad Chimbote', 8, 1, '2023-11-27', '2023-12-07'),
  ('Evento de F�tbol en Ciudad Huancayo', 9, 1, '2023-12-01', '2023-12-11'),
  ('Evento de F�tbol en Ciudad Ica', 10, 1, '2023-12-05', '2023-12-15'),
  ('Evento de F�tbol en Ciudad Piura', 11, 1, '2023-12-09', '2023-12-19'),
  ('Evento de F�tbol en Ciudad Trujillo', 12, 1, '2023-12-13', '2023-12-23'),

  ('Evento de V�ley en Lima Centro', 1, 2, '2023-11-01', '2023-11-10'),
  ('Evento de V�ley en Lima Norte', 2, 2, '2023-11-05', '2023-11-15'),
  ('Evento de V�ley en Lima Sur', 3, 2, '2023-11-08', '2023-11-18'),
  ('Evento de V�ley en Lima Este - SJL', 4, 2, '2023-11-12', '2023-11-22'),
  ('Evento de V�ley en Lima Este - Ate', 5, 2, '2023-11-15', '2023-11-25'),
  ('Evento de V�ley en Ciudad Arequipa', 6, 2, '2023-11-19', '2023-11-29'),
  ('Evento de V�ley en Ciudad Chiclayo', 7, 2, '2023-11-23', '2023-12-03'),
  ('Evento de V�ley en Ciudad Chimbote', 8, 2, '2023-11-27', '2023-12-07'),
  ('Evento de V�ley en Ciudad Huancayo', 9, 2, '2023-12-01', '2023-12-11'),
  ('Evento de V�ley en Ciudad Ica', 10, 2, '2023-12-05', '2023-12-15'),
  ('Evento de V�ley en Ciudad Piura', 11, 2, '2023-12-09', '2023-12-19'),
  ('Evento de V�ley en Ciudad Trujillo', 12, 2, '2023-12-13', '2023-12-23'),

  ('Evento de Baloncesto en Lima Centro', 1, 3, '2023-11-01', '2023-11-10'),
  ('Evento de Baloncesto en Lima Norte', 2, 3, '2023-11-05', '2023-11-15'),
  ('Evento de Baloncesto en Lima Sur', 3, 3, '2023-11-08', '2023-11-18'),
  ('Evento de Baloncesto en Lima Este - SJL', 4, 3, '2023-11-12', '2023-11-22'),
  ('Evento de Baloncesto en Lima Este - Ate', 5, 3, '2023-11-15', '2023-11-25'),
  ('Evento de Baloncesto en Ciudad Arequipa', 6, 3, '2023-11-19', '2023-11-29'),
  ('Evento de Baloncesto en Ciudad Chiclayo', 7, 3, '2023-11-23', '2023-12-03'),
  ('Evento de Baloncesto en Ciudad Chimbote', 8, 3, '2023-11-27', '2023-12-07'),
  ('Evento de Baloncesto en Ciudad Huancayo', 9, 3, '2023-12-01', '2023-12-11'),
  ('Evento de Baloncesto en Ciudad Ica', 10, 3, '2023-12-05', '2023-12-15'),
  ('Evento de Baloncesto en Ciudad Piura', 11, 3, '2023-12-09', '2023-12-19'),
  ('Evento de Baloncesto en Ciudad Trujillo', 12, 3, '2023-12-13', '2023-12-23');


SELECT * FROM evento

SELECT * FROM entrenador

-- Ejemplo de inserci�n de 12 entrenadores con direcciones de correo electr�nico ficticias de Gmail
INSERT INTO entrenador (Nombre, CorreoElectronico, Telefono, Direccion)
VALUES
  ('John Smith', 'john.smith@gmail.com', '123456789', '123 Main Street'),
  ('Maria Rodriguez', 'maria.rodriguez@gmail.com', '987654321', '456 Elm Avenue'),
  ('Robert Johnson', 'robert.johnson@gmail.com', '111222333', '789 Oak Drive'),
  ('Emily Davis', 'emily.davis@gmail.com', '444555666', '234 Birch Lane'),
  ('William Brown', 'william.brown@gmail.com', '777888999', '567 Maple Road'),
  ('Linda Martinez', 'linda.martinez@gmail.com', '222333444', '890 Pine Street'),
  ('Michael Wilson', 'michael.wilson@gmail.com', '555666777', '345 Cedar Avenue'),
  ('Jennifer Lee', 'jennifer.lee@gmail.com', '888999000', '678 Redwood Lane'),
  ('David Thomas', 'david.thomas@gmail.com', '333444555', '123 Spruce Road'),
  ('Susan Taylor', 'susan.taylor@gmail.com', '999000111', '456 Sequoia Drive'),
  ('Richard Anderson', 'richard.anderson@gmail.com', '666777888', '789 Willow Street'),
  ('Karen Hall', 'karen.hall@gmail.com', '111222333', '234 Palm Avenue');

SELECT * FROM equipo

-- Inserta los datos que te pido el logo es el nombre_del_equipo.png, el nombre del equipo inventate nombres, el entrenador pon valores del 1 al 12 y los eventos es del 1 al 36

INSERT INTO equipo (logoEquipo, NombreEquipo, EntrenadorID, EventoID)
VALUES 
('los_tigres.png', 'Los Tigres', 1, 1),
('los_leones.png', 'Los Leones', 2, 2),
('las_aguilas.png', 'Las �guilas', 3, 3),
('los_halcones.png', 'Los Halcones', 4, 4),
('los_lobos.png', 'Los Lobos', 5, 5),
('las_serpientes.png', 'Las Serpientes', 6, 6),
('los_osos.png', 'Los Osos', 7, 7),
('los_tiburones.png', 'Los Tiburones', 8, 8),
('los_canguros.png', 'Los Canguros', 9, 9),
('los_dragones.png', 'Los Dragones', 10, 10);

SELECT * FROM equipo
SELECT * FROM Enfrentamientos
SELECT * FROM deporte

ALTER TABLE Enfrentamientos
DROP COLUMN Ronda

ALTER TABLE Enfrentamientos
ADD Estado CHAR(1);
GO
ALTER TABLE Enfrentamientos
ADD CONSTRAINT CheckEstado CHECK (Estado IN ('C', 'E', 'P'))

-- En el valor de fehcaHora ponle cualquier, equipoLocal y el vistante solo se ponen del (1 al 10) pero no puedes repetir ningun numero en ambas columnas por ejempo 1 y 1 esto no se puede podria ser 1 y 2 o 1 y 3 pero no 1 y 1, en deporte solo pon del 1 al 3 y en ronda pon C o E o P

-- Modifica la tabla para hacer que el campo ID sea autoincremental


-- Ejemplo de inserci�n de enfrentamientos con valores espec�ficos
INSERT INTO Enfrentamientos (FechaHora, EquipoLocalID, EquipoVisitanteID, DeporteID, Estado)
VALUES
    ('2023-11-03 12:00:00', 1, 2, 1, 'C'),
    ('2023-11-04 14:30:00', 1, 3, 2, 'E'),
    ('2023-11-05 16:45:00', 2, 4, 3, 'P'),
    -- Agrega m�s combinaciones aqu� siguiendo el mismo formato
    ('2023-11-06 11:15:00', 3, 5, 1, 'C'),
    ('2023-11-07 13:20:00', 2, 6, 2, 'E'),
    ('2023-11-08 15:00:00', 4, 7, 3, 'P'),
    -- Agrega m�s combinaciones seg�n tus necesidades
    ('2023-11-09 14:00:00', 6, 8, 1, 'C'),
    ('2023-11-10 16:30:00', 5, 9, 2, 'E'),
    ('2023-11-11 18:15:00', 7, 10, 3, 'P');
    -- Puedes seguir agregando combinaciones con diferentes valores


-- consulta para poder traer los datos

SELECT * FROM Enfrentamientos

SELECT
  EQLocal.NombreEquipo AS EquipoLocal,
  EQVisitante.NombreEquipo AS EquipoVisitante,
  E.FechaHora,
  D.NombreDeporte AS Deporte,
  CASE
	WHEN E.Estado = 'C' THEN 'Completo'
	WHEN E.Estado = 'E' THEN 'Proceso'
	WHEN E.Estado = 'P' THEN 'Pendiente'
  END AS [Estado]
FROM Enfrentamientos E
INNER JOIN Equipo EQLocal ON E.EquipoLocalID = EQLocal.ID
INNER JOIN Equipo EQVisitante ON E.EquipoVisitanteID = EQVisitante.ID
INNER JOIN Deporte D ON E.DeporteID = D.ID
