select * from cat

---------- FORMATO FECHAS------------------

ALTER SESSION  SET NLS_DATE_FORMAT = 'dd/mm/yyyy';

select * from socio;
select * from pais;
select * from director;
select * from categoria;
select * from titulo;
select * from copia;
select * from prestamo;

---------- CREACION DE TABLAS--------------



CREATE TABLE socio(
	rut_socio 	NUMBER(8),
        rut_socio_ppal  NUMBER(8) NULL,   
	nombre 		VARCHAR2(30),
	direccion 	VARCHAR2(30),
	fono 		NUMBER(9),
	valor_max_prest number(8),
	tipo		char(1)
);


CREATE TABLE pais(
	id_pais		NUMBER(8),
	nom_pais	VARCHAR2(30)
);



CREATE TABLE director(
	id_director	NUMBER(8),
	nom_director	varchar2(30)
);


CREATE TABLE categoria(
	id_categoria	NUMBER(8),
	nom_categoria	VARCHAR2(30),
	precio	        number(8),
	dias_prestamo	number(2)
);

CREATE TABLE titulo(
    cod_titulo number(3),
    nom_titulo varchar2(30),
    id_director number(3),
    id_pais number(3),
    id_categoria number(3),
    genero char(1),
    anno number(4),
    descripcion varchar2(50)
);

CREATE TABLE copia(
    cod_copia number(3),
    cod_titulo number(3),
    estado char(1)
);

CREATE TABLE prestamo(
    rut_socio number(8),
    fecha_inicio date,
    cod_copia number(3),
    fecha_termino date,
    fecha_devolucion date,
    estado char(1)
);


----------   Claves Primarias-----------

ALTER TABLE socio 
      ADD CONSTRAINT pk_rut_soc PRIMARY KEY (rut_socio);

ALTER TABLE pais
       ADD CONSTRAINT pk_pais PRIMARY KEY (id_pais);

ALTER TABLE director
      ADD CONSTRAINT pk_director PRIMARY KEY (id_director);

ALTER TABLE categoria
      ADD CONSTRAINT pk_categoria PRIMARY KEY (id_categoria);

ALTER TABLE titulo
    ADD CONSTRAINT pk_titulo PRIMARY KEY (cod_titulo);
    
ALTER TABLE copia
    ADD CONSTRAINT pk_copia PRIMARY KEY (cod_copia);

ALTER TABLE prestamo
    ADD CONSTRAINT pk_prestamo PRIMARY KEY (rut_socio, fecha_inicio, cod_copia);

----------    Claves Foraneas ------------

ALTER TABLE socio
	ADD CONSTRAINT fk_soc_socp FOREIGN KEY (rut_socio_ppal)
	REFERENCES socio(rut_socio);
    
ALTER TABLE titulo
    ADD CONSTRAINT fk_director FOREIGN KEY (id_director)
    REFERENCES director(id_director);

ALTER TABLE titulo
    ADD CONSTRAINT fk_pais FOREIGN KEY (id_pais)
    REFERENCES pais(id_pais);
    
ALTER TABLE titulo
    ADD CONSTRAINT fk_categoria FOREIGN KEY (id_categoria)
    REFERENCES categoria(id_categoria);
    
ALTER TABLE copia
    ADD CONSTRAINT fk_titulo FOREIGN KEY (cod_titulo)
    REFERENCES titulo(cod_titulo);
    
ALTER TABLE prestamo
    ADD CONSTRAINT fk_socio FOREIGN KEY (rut_socio)
    REFERENCES socio(rut_socio);
    
ALTER TABLE prestamo
    ADD CONSTRAINT fk_copia FOREIGN KEY (cod_copia)
    REFERENCES copia(cod_copia);

	
--------     Restricciones ------------

ALTER TABLE prestamo
	ADD  CHECK (estado in ('P','D','A'));

ALTER TABLE copia
	ADD  CHECK (estado in ('P','D'));

ALTER TABLE titulo
	ADD  CHECK (genero BETWEEN 1 AND 5);


ALTER TABLE prestamo
	ADD  CHECK (fecha_termino >= fecha_inicio)
	ADD  CHECK (fecha_devolucion >= fecha_inicio);

ALTER TABLE socio
	ADD CHECK (tipo IN ('P','A'));
    

---------------- INSERTAR TABLA SOCIO ------------------

INSERT INTO socio VALUES(13697369,'', 'JUANA SALINAS', '345 VILLA BELMONT', 2458762, 10000, 'P');
INSERT INTO socio VALUES(13697370,'', 'JOSE DIAZ', '9722 ROGELIO ASTUDILLO', 2785400,7000, 'P');
INSERT INTO socio VALUES(13697371,'', 'LINA DELIZ', '574  AVENIDA RD. CUPERTINO', 2225604,2500, 'P');
INSERT INTO socio VALUES(13697372,'', 'LESLIE BARRERA', '3476 EL PASEO SANTA CLARA', 2225801,15000, 'P');
INSERT INTO socio VALUES(13697373,'', 'SARA DUARTE', '908 CALLE PALO ALTO', 2445870, 9600, 'P');
INSERT INTO socio VALUES(13697374,'', 'RAUL PORTER', '347 IRVING PL.', 2258874, 4500, 'P');
INSERT INTO socio VALUES(13697375,'', 'KENNETH MARTIN', '2345 AVENIDA LEICESTER', 2458762, 4500, 'P');
INSERT INTO socio VALUES(13697376,'', 'SEBASTIAN SEPULVEDA', '2 E. DEPTO 14', 2458762, 10000, 'P');
INSERT INTO socio VALUES(13697377,'', 'CAROL CASTRO', '234 LAS GARDENIAS', 2444257, 5000, 'P');
INSERT INTO socio VALUES(13697378,'', 'DANIEL SOTELO', '547 STA JUANA', 2451000, 7000, 'P');
INSERT INTO socio VALUES(13697379,'', 'FRANCISCO KING', '346 JARDIN DEL MAR', 4458762,5000, 'P');
INSERT INTO socio VALUES(13697380,'', 'JUAN SOTO', '4000 AGUA SANTA', 9478000,10000, 'P');
INSERT INTO socio VALUES(13697381,'', 'JUAN PEREZ', '23 LOS MANZANOS', 441762, 5000, 'P');
INSERT INTO socio VALUES(13697382,'', 'JORGE PEREZ ', '300 ROTONDA VIEJA', 440762,5000, 'P');
INSERT INTO socio VALUES(13697383,'', 'RODRIGO FERNANDEZ', '2500 CALAFQUEN ALTO', 454552, 20000, 'P');
INSERT INTO socio VALUES(14690300,13697369,'JAVIER CONTRERAS', '34 VILLA CAMPARI', 2458899, 5000,'A');
INSERT INTO socio VALUES(14690301,13697369,'SONIA CONTRERAS', '87 ALVAREZ', 2458787, 1000,'A');
INSERT INTO socio VALUES(14690302,13697370, 'JOSEFINA NAVARRO', '97 ROGELIO ASTUDILLO', 2785488,1500,'A');
INSERT INTO socio VALUES(14690303,13697370, 'ERWIN MORALES', '123 JUANA ROSS', 2785498,7000,'A');
INSERT INTO socio VALUES(14690304,13697370, 'CRISTINA BRAVO', '67 CERRO ALEGRE', 2855566,7500,'A');
INSERT INTO socio VALUES(14690305,13697371, 'LORNA MORALES', '897  AVENIDA JACINTO FAUNDEZ', 2223333,5000,'A');
INSERT INTO socio VALUES(14690306,13697371, 'ERNESTO MORAGA', '78  VILLA LONDRES', 2334456,5000,'A');
INSERT INTO socio VALUES(14690307,13697372,'ELIANA ARAYA', '34 PLAYA BAJA', 2225800,15000,'A');
INSERT INTO socio VALUES(14690308,13697373, 'SOFIA VALLADARES', '56 AGUA SANTA', 2447878, 9000,'A');
INSERT INTO socio VALUES(14690309,13697374, 'RICARDO TAPIA', '347 IRVING PL.', 2258888, 45000,'A');
INSERT INTO socio VALUES(14697310,13697376, 'FRANCISCA ALLENDE', '909 CALLE DEL SOL', 2458766, 5000,'A');
INSERT INTO socio VALUES(14690311,13697376, 'BASTIAN SAAVEDRA', '78 VILLA LAS GARDENIAS', 4587622, 3000,'A');
INSERT INTO socio VALUES(14690312,13697376,'DIANA GONZALEZ', '777 LOS MANZANOS', 2444999, 5000,'A');
INSERT INTO socio VALUES(14690313,13697378, 'JAIME SOTELO', '234 STA ROSA', 2458443, 7000,'A');
INSERT INTO socio VALUES(14690314,13697378, 'FRANCISCO ALVAREZ', '1100 BOSQUES DEL MAR', 4456678,5000,'A');
INSERT INTO socio VALUES(14690315,13697380,'PABLO CORTES', '888 MIRAFLORES', 9479999,10000,'A');
INSERT INTO socio VALUES(14690316,13697381, 'JUANA MORA', '78 LOS PERALES', 441667, 5000,'A');
INSERT INTO socio VALUES(14690317,13697382, 'JORGE MORENO', '300 ROTONDA VIEJA', 440345,5000,'A');
INSERT INTO socio VALUES(14690318,13697383,'CARLA JORQUERA', '2300 PUYEHUE ALTO', 454511, 12000,'A');

--------------- INSERTAR TABLA PAIS -----------------

INSERT INTO PAIS VALUES (12,  'CHILE');
INSERT INTO PAIS VALUES (20,  'ARGENTINA');
INSERT INTO PAIS VALUES (22,  'ESTADOS UNIDOS');
INSERT INTO PAIS VALUES (24,  'ITALIA' );
INSERT INTO PAIS VALUES (26,  'FRANCIA' );
INSERT INTO PAIS VALUES (28,  'CANADA' );
INSERT INTO PAIS VALUES (30,  'ESPANA');
INSERT INTO PAIS VALUES (32,  'AUSTRALIA');
INSERT INTO PAIS VALUES (34,  'MEXICO');
INSERT INTO PAIS VALUES (36,  'COLOMBIA');
INSERT INTO PAIS VALUES (38,  'ALEMANIA');
INSERT INTO PAIS VALUES (40,  'INGLATERRA'); 
INSERT INTO PAIS VALUES (42,  'RUSIA');
INSERT INTO PAIS VALUES (46,  'JAPON');
INSERT INTO PAIS VALUES (48,  'CHINA');
INSERT INTO PAIS VALUES (50,  'INDIA');
INSERT INTO PAIS VALUES (52,  'TURQUIA');


---------------- INSERTAR TABLA DIRECTOR--------------------

INSERT INTO DIRECTOR VALUES (1, 'LUCAS' );
INSERT INTO DIRECTOR VALUES (2, 'SPIELBERG' );
INSERT INTO DIRECTOR VALUES (3, 'MANN' );
INSERT INTO DIRECTOR VALUES (4, 'ZUIKER' );
INSERT INTO DIRECTOR VALUES (5, 'YIMOU' );
INSERT INTO DIRECTOR VALUES (6, 'HIRSCHBIEGEL' );
INSERT INTO DIRECTOR VALUES (7, 'ALMODOVAR' );
INSERT INTO DIRECTOR VALUES (8, 'MINGHELLA' );
INSERT INTO DIRECTOR VALUES (9, 'WOOD' );
INSERT INTO DIRECTOR VALUES (10,'HIRABAYASHI' );



-------------------- INSERTAR TABLA CATEGORIA -------------------

INSERT INTO categoria VALUES (10, 'SUPER ESTRENO', 2000, 3);
INSERT INTO categoria VALUES (20, 'ESTRENO', 1500, 5);
INSERT INTO categoria VALUES (30, 'NORMAL', 1000,7);
INSERT INTO categoria VALUES (40, 'CINE ARTE',1000,7);
INSERT INTO categoria VALUES (50, 'SERIES',5000,10);
INSERT INTO categoria VALUES (60, 'CORTOMETRAJES',900,10);

------------------------  INSERTAR TABLA TITULO------------------

INSERT INTO titulo VALUES (1,'RETORNO DEL JEDI',1,22,30,4,1983,'GRANDES AVENTURAS EN ESTRELLA DE LA MUERTE' );
INSERT INTO titulo VALUES (2,'GUERRA DE LAS GALAXIAS',1,22,30,4,1977,'LEIA DE REH?N POR REBELI?N CONTRA IMPERIO');
INSERT INTO titulo VALUES (3,'INDIANA JONES IV',2,22,10,3,2008,'INDIANA Y LA CALAVERA DE CRISTAL');
INSERT INTO titulo VALUES (4,'TIBURON',2,22,30,1,1975,'TERROR EN LAS AGUAS');
INSERT INTO titulo VALUES (5,'HANCOCK',3,22,20,3,2008,'SUPER HEROE CON MALA IMAGEN');
INSERT INTO titulo VALUES (6,'MIAMI VICE',3,22,30,3,2006,'CROCKETT y TUBBS EST?N DE VUELTA');
INSERT INTO titulo VALUES (7,'CSI',4,22,50,5,2000,'INVESTIGACION DE LA ESCENA DEL CRIMEN');
INSERT INTO titulo VALUES (8,'HEROE',5,48,40,3,2002,'SIN NOMBRE Y SU CONVERSACION CON EL REY');
INSERT INTO titulo VALUES (9,'MALDICION DE LA FLOR DORADA',5,48,40,3,2007,'PROFUNDOS SECRETOS SE ESCONDEN');
INSERT INTO titulo VALUES (10,'LA CAIDA',6,38,30,5,2004,'LOS ULTIMOS DIAS DE HITLER');
INSERT INTO titulo VALUES (11,'EL EXPERIMENTO',6,38,30,1,2001,'EL PODER Y EL JUEGO SICOLOGICO');
INSERT INTO titulo VALUES (12,'VOLVER',7,30,30,5,2006,'SOBRE LA CULTURA DE LA MUERTE');
INSERT INTO titulo VALUES (13,'TACONES LEJANOS',7,30,30,5,1991,'DRAMA Y AMOR');
INSERT INTO titulo VALUES (14,'EL PACIENTE INGLES',8,40,30,5,1996,'DOLOR DEL AMOR IMPOSIBLE');
INSERT INTO titulo VALUES (15,'HISTORIAS DE FUTBOL',9,12,30,2,1997,'TRES TEMATICAS EN TORNO AL FUTBOL');
INSERT INTO titulo VALUES (16,'MACHUCA',9,12,30,5,2004,'DENUNCIA SOCIAL DE EPOCA');
INSERT INTO titulo VALUES (17,'DORON',10,46,60,2,2006,'EXTRANO TIPO DE AUDICION');


------------------------ INSERTAR TABLA COPIA-------------------

INSERT INTO COPIA VALUES (1,1,'P');
INSERT INTO COPIA VALUES (2,1,'D');
INSERT INTO COPIA VALUES (3,1,'D');
INSERT INTO COPIA VALUES (4,1,'D');
INSERT INTO COPIA VALUES (5,2,'P');
INSERT INTO COPIA VALUES (6,2,'D');
INSERT INTO COPIA VALUES (7,2,'P');
INSERT INTO COPIA VALUES (8,3,'D');
INSERT INTO COPIA VALUES (9,3,'D');
INSERT INTO COPIA VALUES (10,3,'D');
INSERT INTO COPIA VALUES (11,4,'D');
INSERT INTO COPIA VALUES (12,4,'D');
INSERT INTO COPIA VALUES (13,4,'D');
INSERT INTO COPIA VALUES (14,4,'D');
INSERT INTO COPIA VALUES (15,5,'P');
INSERT INTO COPIA VALUES (16,5,'D');
INSERT INTO COPIA VALUES (17,5,'D');
INSERT INTO COPIA VALUES (18,5,'P');
INSERT INTO COPIA VALUES (19,6,'D');
INSERT INTO COPIA VALUES (20,6,'P');
INSERT INTO COPIA VALUES (21,7,'D');
INSERT INTO COPIA VALUES (22,7,'P');
INSERT INTO COPIA VALUES (23,8,'P');
INSERT INTO COPIA VALUES (24,8,'D');
INSERT INTO COPIA VALUES (25,8,'D');
INSERT INTO COPIA VALUES (26,9,'P');
INSERT INTO COPIA VALUES (27,9,'D');
INSERT INTO COPIA VALUES (28,9,'P');
INSERT INTO COPIA VALUES (29,10,'P');
INSERT INTO COPIA VALUES (30,10,'D');
INSERT INTO COPIA VALUES (31,10,'D');
INSERT INTO COPIA VALUES (32,10,'D');
INSERT INTO COPIA VALUES (33,10,'D');
INSERT INTO COPIA VALUES (34,11,'D');
INSERT INTO COPIA VALUES (35,11,'D');
INSERT INTO COPIA VALUES (36,12,'P');
INSERT INTO COPIA VALUES (37,12,'D');
INSERT INTO COPIA VALUES (38,12,'D');
INSERT INTO COPIA VALUES (39,13,'D');
INSERT INTO COPIA VALUES (40,13,'D');
INSERT INTO COPIA VALUES (41,13,'D');
INSERT INTO COPIA VALUES (42,13,'D');
INSERT INTO COPIA VALUES (43,14,'D');
INSERT INTO COPIA VALUES (44,14,'P');
INSERT INTO COPIA VALUES (45,15,'P');
INSERT INTO COPIA VALUES (46,15,'D');
INSERT INTO COPIA VALUES (47,15,'P');
INSERT INTO COPIA VALUES (48,16,'D');
INSERT INTO COPIA VALUES (49,16,'D');
INSERT INTO COPIA VALUES (50,17,'P');


----------------------- INSERTAR TABLA PRESTAMO -------------------------


INSERT INTO PRESTAMO VALUES (13697369, '12/11/2019',1 ,'18/11/2019','','P' );
INSERT INTO PRESTAMO VALUES (13697370, '02/09/2019' ,1 ,'08/09/2019','07/09/2019','D' );
INSERT INTO PRESTAMO VALUES (13697371, '03/10/2019' ,2 ,'09/10/2019','12/10/2019','A' );
INSERT INTO PRESTAMO VALUES (13697372, '10/10/2019',4 ,'16/10/2019','16/10/2019','D' );
INSERT INTO PRESTAMO VALUES (13697376, '12/11/2019' ,5 ,'18/11/2019','','P' );
INSERT INTO PRESTAMO VALUES (13697381, '12/11/2019',7 ,'18/11/2019','','P' );
INSERT INTO PRESTAMO VALUES (13697383, '20/10/2019',10 ,'22/10/2019','','A' );
INSERT INTO PRESTAMO VALUES (13697370, '02/11/2019',12  ,'08/11/2019','09/11/2019','A' );
INSERT INTO PRESTAMO VALUES (13697371, '03/11/2019',13  ,'09/11/2019','07/11/2019','D' );
INSERT INTO PRESTAMO VALUES (13697371, '12/11/2019',15  ,'16/11/2019','','P' );
INSERT INTO PRESTAMO VALUES (13697372, '10/11/2019',18 ,'14/11/2019','','P' );
INSERT INTO PRESTAMO VALUES (13697383, '20/10/2019',20 ,'26/10/2019','26/10/2019','D' );
INSERT INTO PRESTAMO VALUES (13697383, '12/11/2019',20 ,'18/11/2019','','P');
INSERT INTO PRESTAMO VALUES (13697383, '11/11/2019',22 ,'20/11/2019','','P' );
INSERT INTO PRESTAMO VALUES (14690309, '12/11/2019',23 ,'18/11/2019','','P' );
INSERT INTO PRESTAMO VALUES (14690300, '11/11/2019' ,26 ,'17/11/2019' ,'','P' );
INSERT INTO PRESTAMO VALUES (14690301, '12/11/2019' ,28 ,'18/11/2019','','P' );
INSERT INTO PRESTAMO VALUES (14690302, '12/11/2019',29 ,'18/11/2019','','P' );
INSERT INTO PRESTAMO VALUES (14690306, '05/11/2019' ,33 ,'11/11/2019','','A' );
INSERT INTO PRESTAMO VALUES (14690301, '12/11/2019',36 ,'18/11/2019','','P' );
INSERT INTO PRESTAMO VALUES (14690303, '20/10/2019',38 ,'26/10/2019','30/10/2019','A' );
INSERT INTO PRESTAMO VALUES (13697370, '02/11/2019', 38 ,'08/11/2019','08/11/2019','D' );
INSERT INTO PRESTAMO VALUES (14690301, '03/10/2019', 39 ,'09/10/2019','08/10/2019','D' );
INSERT INTO PRESTAMO VALUES (14690301, '03/11/2019',40  ,'09/11/2019','12/11/2019','A' );
INSERT INTO PRESTAMO VALUES (14690302, '12/11/2019',44 ,'18/11/2019','','P' );
INSERT INTO PRESTAMO VALUES (14690302, '11/11/2019',50 ,'20/11/2019','','P' );
INSERT INTO PRESTAMO VALUES (14690303, '10/11/2019',45 ,'16/11/2019','','P' );
INSERT INTO PRESTAMO VALUES (14690303, '11/11/2019',47 ,'17/11/2019','','P' );
INSERT INTO PRESTAMO VALUES (14690303, '14/10/2019',50,'23/10/2019','22/10/2019','D' );
INSERT INTO PRESTAMO VALUES (14690318, '12/05/2019',49 ,'18/05/2019','18/05/2019','D' ); 
INSERT INTO PRESTAMO VALUES (13697375, '12/04/2019',49 ,'18/04/2019','18/04/2019','D' );
INSERT INTO PRESTAMO VALUES (13697377, '12/03/2019',48 ,'18/03/2019','18/03/2019','D' );

/*---------------------PARTE 1---------------------*/

/*Pregunta 1 LO HICE JUNTO AL SCRIPT ENVIADO ARRIBA EN LAS SECCIONES RESPECTIVAS*/

/*Pregunta 2*/

/*Pregunta 3*/
select soc.rut_socio, soc.nombre , cat.precio*1.4 as multa

    from socio soc

    inner join prestamo pres on soc.rut_socio = pres.rut_socio
    inner join copia cop on pres.cod_copia = cop.cod_copia
    inner join titulo tit on cop.cod_titulo = tit.cod_titulo
    inner join categoria cat on tit.id_categoria = cat.id_categoria

    where (pres.estado = 'A') 
        and (pres.fecha_devolucion is NULL) 
        and (cat.nom_categoria in ('NORMAL', 'SUPER ESTRENO'))

    group by soc.rut_socio, soc.nombre, cat.precio*1.4
    having sum (cat.precio)*1.40 > (select avg(precio) from categoria);

/*4*/
insert into categoria values(
(select max(id_Categoria)+10 from categoria), 
'MUSICAL', 
(select min(precio)*1.20 from categoria), 
(select sum(dias_prestamo) from categoria where nom_categoria in ('CINE ARTE', 'NORMAL'))
);

insert into director values(
(select max(id_director)+1 from director),
'HOOPER'
);

insert into titulo values(
(select max(cod_titulo)+1 from titulo),
'LOS MISERABLES',
(select id_director from director where nom_director = 'HOOPER'),
(select id_pais from pais where nom_pais = 'INGLATERRA'),
(select id_categoria from categoria where nom_categoria = 'MUSICAL'),
5,
2012,
'Un ex convicto, alcalde y fugitivo'
);

/*5 No me acutaliza ningun row no sé porque, he chequeado el código muchas veces y no se cual es el problema*/
update prestamo
    set fecha_termino = sysdate + 5,
        fecha_devolucion = null,
        estado = 'p'
    where rut_socio in (select rut_socio from socio where tipo = 'A')
        and fecha_termino - fecha_inicio  > 3
        and fecha_inicio in ('10/11/2019', '11/11/2019', '12/11/2019')
        and cod_copia in (select c.cod_copia from copia c inner join titulo t on c.cod_titulo = t.cod_titulo
                            where t.descripcion like '%amor%');
                            
/*6*/
delete from copia
    where(
    cod_titulo in (select cod_titulo from titulo where id_director = (select id_director from director where nom_director = 'HIRSCHBIEGEL')) and
    cod_copia not in (select cod_copia from prestamo) and
    cod_titulo in (select cod_titulo from titulo where id_categoria in (select id_categoria from categoria where dias_prestamo < (select avg(dias_prestamo) from categoria where precio between 1000 and 2500)))
    );
delete from titulo
    where( 
    id_director = (select id_director from director where nom_director = 'HIRSCHBIEGEL') and
    cod_titulo not in (select cod_titulo from copia) and
    id_categoria in (select id_categoria from categoria where dias_prestamo < (select avg(dias_prestamo) from categoria where precio between 1000 and 2500))
    );