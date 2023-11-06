CREATE TABLE recordatorio (
    id INT PRIMARY KEY,
    usuario_id INT,
    titulo VARCHAR(255),
    descripcion TEXT,
    fecha_hora DATETIME,
    -- Otras columnas de recordatorio
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

SELECT * FROM deportista

ALTER TABLE deportista
ADD usuario_id INT;
GO
ALTER TABLE deportista
ADD CONSTRAINT FK_deportista_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id);


-- Crear la tabla "estudiante" con una referencia a la tabla "usuario"
CREATE TABLE estudiante (
    id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(255),
    apellido_pat VARCHAR(255),
    apellido_mat VARCHAR(255),
    genero TINYINT DEFAULT 1,
    usuario_id INT,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

-- Crear la tabla "administrativo" con una referencia a la tabla "usuario"
CREATE TABLE administrativo (
    id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(255),
    apellido_pat VARCHAR(255),
    apellido_mat VARCHAR(255),
    genero TINYINT DEFAULT 1,
    usuario_id INT,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

-- Agregar las columnas "apellido_pat" y "apellido_mat" a la tabla "deportista" como NOT NULL
ALTER TABLE deportista
ADD apellido_mat VARCHAR(255) NOT NULL

SELECT * FROM usuario

-- Elimina la restricción de verificación que depende de la columna 'cargo'

ALTER TABLE usuario
DROP CONSTRAINT CK__usuario__cargo__5AEE82B9;


ALTER TABLE usuario
DROP COLUMN cargo

ALTER TABLE deportista
DROP COLUMN apellido_pat


SELECT * FROM deportista
-- Agregar columna "estudiante_id" en la tabla "deportista"
ALTER TABLE deportista
ADD estudiante_id INT NOT NULL
GO
ALTER TABLE deportista
ADD CONSTRAINT FK_deportista_estudiante FOREIGN KEY (estudiante_id) REFERENCES estudiante(id);


SELECT * FROM recordatorio

ALTER TABLE recordatorio
DROP COLUMN id

ALTER TABLE recordatorio
DROP CONSTRAINT PK__recordat__3213E83FDC96780D

ALTER TABLE recordatorio
ADD id INT IDENTITY(1,1);

ALTER TABLE recordatorio
ADD CONSTRAINT PK_recordatorio_id PRIMARY KEY (id)

INSERT INTO recordatorio (usuario_id, titulo, descripcion, fecha_hora)
VALUES (1, 'Dar la bienvenida a los estudiantes', 'Tengo que hacer un discurso', '2023-11-03 10:00:00');

INSERT INTO recordatorio (usuario_id, titulo, descripcion, fecha_hora)
VALUES (1, 'Dar comienzo al torneo', 'Tengo presentar como se desarrollara el evento', '2023-11-03 12:00:00');


SELECT r.titulo, r.fecha_hora FROM usuario AS u INNER JOIN recordatorio AS r ON u.id = r.usuario_id WHERE u.id = 1

SELECT r.titulo, r.fecha_hora FROM usuario AS u INNER JOIN recordatorio AS r ON u.id = r.usuario_id WHERE u.codigo = 'U22219787'

SELECT * FROM recordatorio

ALTER TABLE recordatorio
ADD estado TINYINT

UPDATE recordatorio SET estado = 1 WHERE id = 2

SELECT r.titulo, r.fecha_hora, CASE WHEN r.estado = 0 THEN 'No-completado' WHEN r.estado = 1 THEN 'Completado' END AS [estado] FROM usuario AS u INNER JOIN recordatorio AS r ON u.id = r.usuario_id WHERE u.codigo = 'U22219787'


CREATE TABLE Configuracion (
    id_configuracion INT PRIMARY KEY IDENTITY(1,1),
    modo_oscuro_claro TINYINT DEFAULT 1,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id)
)

SELECT * FROM Configuracion

INSERT INTO Configuracion (modo_oscuro_claro, id_usuario)
VALUES (1, 1)

SELECT
CASE
	WHEN modo_oscuro_claro = 0 THEN ''
	WHEN modo_oscuro_claro = 1 THEN 'dark'
END AS [modo]
FROM Configuracion AS c
INNER JOIN usuario AS u
ON c.id_usuario = u.id
WHERE u.codigo = 'U22219787'


-- DELETE FROM Enfrentamientos WHERE ID = 1

SELECT E.id,
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

SELECT * FROM Enfrentamientos

--INSERT INTO Enfrentamientos (FechaHora, EquipoLocalID, EquipoVisitanteID, DeporteID, Estado) VALUES ()

SELECT * FROM equipo

SELECT ID,logoEquipo,NombreEquipo, EntrenadorID, EventoID FROM equipo


SELECT * FROM deporte

INSERT INTO Enfrentamientos (FechaHora, EquipoLocalID, EquipoVisitanteID, DeporteID, Estado)
VALUES
    ('2023-11-03 12:00:00', 1, 2, 1, 'C'),
    -- Agrega m�s combinaciones aqu� siguiendo el mismo formato
    ('2023-11-06 11:15:00', 3, 5, 1, 'C'),
    ('2023-11-07 13:20:00', 2, 6, 2, 'E'),
    ('2023-11-08 15:00:00', 4, 7, 3, 'P'),
    -- Agrega m�s combinaciones seg�n tus necesidades
    ('2023-11-09 14:00:00', 6, 8, 1, 'C'),
    ('2023-11-10 16:30:00', 5, 9, 2, 'E'),
    ('2023-11-11 18:15:00', 7, 10, 3, 'P');