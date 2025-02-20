CREATE TABLE Alumno(
    Carnet char(8) NOT NULL,
    NombreCompleto varchar(50),
    --creando la llave primaria de la tabla
    CONSTRAINT pk_alumno PRIMARY KEY(Carnet)
);

CREATE TABLE Materia(
    Codigo char(5) NOT NULL,
    Nombre varchar(30),
    UV int,
    --Creando la llave primaria de la tabla
    CONSTRAINT pk_materia PRIMARY KEY(Codigo),
    --Creando una restriccion UNIQUE en el campo Nombre de la materia
    CONSTRAINT u_nombre UNIQUE(Nombre),
    --Creando una restriccion Check en donde las unidades valorativas
    --se encuentren entre 2 y 5 unidades
    CONSTRAINT ck_uv CHECK (UV>=2 AND UV<=5)
);

CREATE TABLE Inscripcion(
    Carnet char(8),
    CodigoMateria char(5),
    Ciclo char(5),
    --se esta creando una clave primaria compuesta
    --en donde la union de los tres datos es un valor unico
    CONSTRAINT pk_inscripcion PRIMARY KEY(Carnet, CodigoMateria, Ciclo)
);

ALTER TABLE Inscripcion
ADD
--Creando la relación entre la tabla inscripción y la tabla alumno
CONSTRAINT fk_alumno_ins FOREIGN KEY (Carnet) REFERENCES Alumno(Carnet)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE Inscripcion
ADD
--Creando la relación entre la tabla inscripción y la tabla materia
CONSTRAINT fk_materia_ins FOREIGN KEY (CodigoMateria) REFERENCES Materia(Codigo)
ON UPDATE CASCADE
ON DELETE CASCADE;

INSERT INTO Alumno VALUES
('GH121214', 'Gerardo Hierro'),
('VN121415', 'Veronica Nuñez'),
('CD121515', 'Cesar Deras'),
('HL130334', 'Helen Lara'),
('GM119056', 'Gricelda Martinez');

Materia, registro por registro
INSERT INTO Materia VALUES ('BD01', 'Base de datos I', 4);
INSERT INTO Materia VALUES ('IP01', 'Introduccion a la programacion', 4);
INSERT INTO Materia VALUES ('AL01', 'Algebra Lineal', 3);
INSERT INTO Materia VALUES ('RD02', 'Redes de area amplia', 5);
INSERT INTO Materia VALUES('GE01', 'Gestion Empresarial',2);
INSERT INTO Materia VALUES ('HM02', 'Humanistica II', 3);

SELECT * FROM Materia;


INSERT INTO Inscripcion (Carnet, Codigomateria, Ciclo)
VALUES ('GH121214', 'BD01', 'C1-15');
INSERT INTO Inscripcion (Codigomateria, Carnet, Ciclo)
VALUES('GE01', 'GH121214', 'C1-15');
INSERT INTO Inscripcion (Ciclo, Carnet, Codigomateria)
VALUES('C1-15', 'GH121214', 'HM02');

SELECT * FROM Inscripcion;

UPDATE Alumno SET NombreCompleto= 'Gerardo Hernández'
WHERE Carnet='GH121214';

SELECT * FROM Alumno;

UPDATE Alumno SET Carnet='GH111214'
WHERE NombreCompleto='Gerardo Hernández'

DELETE FROM Alumno WHERE Carnet='GH111214'

SELECT * FROM Alumno
SELECT * FROM Inscripcion

INSERT INTO Alumno (Carnet, NombreCompleto) VALUES ('MC129854', 'Mauricio Campos');
INSERT INTO Alumno (Carnet, NombreCompleto) VALUES ('IP110943', 'Ignacio Pérez');
INSERT INTO Alumno (Carnet, NombreCompleto) VALUES ('MU127895', 'Mikel Urrutia');
INSERT INTO Alumno (Carnet, NombreCompleto) VALUES ('CH132390', 'Carlos Hernández');
INSERT INTO Alumno (Carnet, NombreCompleto) VALUES ('HL139032', 'Herson López');

UPDATE Alumno SET Carnet='GH111214'
WHERE NombreCompleto='Gerardo Hernández'


DELETE FROM Alumno WHERE Carnet='GH111214'

SELECT * FROM Alumno
SELECT * FROM Inscripcion

INSERT INTO Alumno (Carnet, NombreCompleto) VALUES ('MC129854', 'Mauricio Campos');
INSERT INTO Alumno (Carnet, NombreCompleto) VALUES ('IP110943', 'Ignacio Pérez');
INSERT INTO Alumno (Carnet, NombreCompleto) VALUES ('MU127895', 'Mikel Urrutia');
INSERT INTO Alumno (Carnet, NombreCompleto) VALUES ('CH132390', 'Carlos Hernández');
INSERT INTO Alumno (Carnet, NombreCompleto) VALUES ('HL139032', 'Herson López');