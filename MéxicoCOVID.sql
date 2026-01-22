CREATE DATABASE Mexico;


CREATE TABLE estado(
	idEstado       INT NOT NULL,
	nombre         VARCHAR(80) NOT NULL,
	poblacion      INT NOT NULL,
	PRIMARY KEY(idEstado)
	);

CREATE TABLE indicador(
	idIndicador       INT NOT NULL,
	nombre            VARCHAR(80) NOT NULL,
	descripción       VARCHAR(200) NOT NULL,
	PRIMARY KEY(idIndicador)
	);

CREATE TABLE municipio(
	idMunicipio	INT NOT NULL,
	nombre          VARCHAR(80) NOT NULL,
	poblacion       INT NOT NULL,
	idEstado        INT NOT NULL,
	PRIMARY KEY(idMunicipio),
	FOREIGN KEY(idEstado) REFERENCES estado(idEstado)
	);

CREATE TABLE municipioIndicador(
	idMunicipioIndicador	INT NOT NULL,
	fecha		        DATE,
	valor		        INT NOT NULL,
	idMunicipio		INT NOT NULL,
	idIndicador       	INT NOT NULL,
	PRIMARY KEY(idMunicipioIndicador),
	FOREIGN KEY(idMunicipio) REFERENCES municipio(idMunicipio),
	FOREIGN KEY(idIndicador) REFERENCES indicador(idIndicador)
	);
		
INSERT INTO estado (idEstado, nombre, poblacion) VALUES
(1, 'Aguascalientes', 1425607),
(2, 'Baja California', 3769020),
(3, 'Chihuahua', 3741869),
(4, 'Ciudad de México', 9209944),
(5, 'Jalisco', 8348151),
(6, 'Nuevo León', 5784442),
(7, 'Puebla', 6583278),
(8, 'Quintana Roo', 1857985),
(9, 'Sonora', 2944840),
(10, 'Veracruz', 8062579);

INSERT INTO indicador (idIndicador, nombre, descripción) VALUES
(1, 'casos', 'Número total de casos confirmados'),
(2, 'fallecidos', 'Número de personas fallecidas'),
(3, 'letalidad', 'Porcentaje de letalidad del Covid19');

INSERT INTO municipio (idMunicipio, nombre, poblacion, idEstado) VALUES
-- Aguascalientes (idEstado: 1)
(1, 'Aguascalientes', 877190, 1),
(2, 'Jesús María', 120405, 1),
(3, 'Calvillo', 56748, 1),

-- Baja California (idEstado: 2)
(4, 'Tijuana', 1991561, 2),
(5, 'Mexicali', 1104608, 2),
(6, 'Ensenada', 557431, 2),

-- Chihuahua (idEstado: 3)
(7, 'Juárez', 1501558, 3),
(8, 'Chihuahua', 948934, 3),
(9, 'Delicias', 150506, 3),

-- Ciudad de México (idEstado: 4)
(10, 'Iztapalapa', 1862336, 4),
(11, 'Gustavo A. Madero', 1173692, 4),
(12, 'Álvaro Obregón', 759137, 4),

-- Jalisco (idEstado: 5)
(13, 'Guadalajara', 1495182, 5),
(14, 'Zapopan', 1476491, 5),
(15, 'Tlaquepaque', 690123, 5),

-- Nuevo León (idEstado: 6)
(16, 'Monterrey', 1135512, 6),
(17, 'Guadalupe', 643143, 6),
(18, 'San Nicolás de los Garza', 443273, 6),

-- Puebla (idEstado: 7)
(19, 'Puebla', 1692724, 7),
(20, 'Tehuacán', 327312, 7),
(21, 'San Martín Texmelucan', 157096, 7),

-- Quintana Roo (idEstado: 8)
(22, 'Benito Juárez', 911503, 8),
(23, 'Solidaridad', 333800, 8),
(24, 'Othón P. Blanco', 233648, 8),

-- Sonora (idEstado: 9)
(25, 'Hermosillo', 936263, 9),
(26, 'Cajeme', 436484, 9),
(27, 'Nogales', 264782, 9),

-- Veracruz (idEstado: 10)
(28, 'Veracruz', 607209, 10),
(29, 'Xalapa', 488531, 10),
(30, 'Coatzacoalcos', 319187, 10);

INSERT INTO municipioindicador(idMunicipioindicador, fecha, valor, idMunicipio, idIndicador) VALUES
-- Ciudad de México
(1, '2020-12-04', 10, 10, 1),
(2, '2020-05-12', 12, 10, 2),
(3, '2020-03-12', 09, 10, 3),

(4, '2020-09-09', 40, 11, 1),
(5, '2020-09-09', 80, 11, 2),
(6, '2020-10-10', 60, 11, 3),

(7, '2020-01-11', 11, 12, 1),
(8, '2020-12-06', 100, 12, 2),
(9, '2020-11-05', 92, 12, 3),

-- Jalisco
(10, '2021-03-01', 201, 13, 1),
(11, '2021-01-01', 180, 13, 2),
(12, '2021-10-01', 902, 13, 3),

(13, '2021-12-03', 1040, 14, 1),
(14, '2021-12-04', 8000, 14, 2),
(15, '2021-11-02', 630, 14, 3),

(16, '2021-01-11', 1020, 15, 1),
(17, '2021-01-07', 723, 15, 2),
(18, '2021-01-08', 920, 15, 3),

-- Nuevo León
(19, '2022-12-02', 300, 13, 1),
(20, '2022-10-02', 280, 13, 2),
(21, '2022-10-02', 420, 13, 3),

(22, '2022-02-03', 560, 14, 1),
(23, '2022-02-03', 800, 14, 2),
(24, '2022-02-03', 650, 14, 3),

(25, '2022-01-05', 102, 15, 1),
(26, '2022-01-07', 309, 15, 2),
(27, '2022-06-06', 201, 15, 3);
