create table editorial (
	cod_editorial   varchar2(4)      not null,
	nombre    	varchar2(20)     not null,
    	direccion    	varchar2(20),
	ciudad    	varchar2(20));
alter table editorial
	add (constraint cp_edit primary key (cod_editorial));

create table bodega (
	cod_bodega     	varchar2(4)      not null,
	nombre     	varchar2(20)     not null,
        direccion     	varchar2(20)     not null,
	ciudad     	varchar2(20),
	telefono   	varchar2(10)     not null);
alter table bodega
	add (constraint cp_bod primary key (cod_bodega));
alter table bodega
	add (constraint un_nom_bod unique (nombre));

  
create table existencia (
	cod_bodega     	varchar2(4)      not null,
	cod_libro     	varchar2(4)      not null,
        cantidad    	number(4)        not null,
        cant_minima    	number(4)        not null);
alter table existencia 
        add (constraint cp_existe primary key (cod_bodega, cod_libro));
alter table existencia
        add (constraint ca_existe_bod foreign key (cod_bodega)
              references bodega (cod_bodega));
alter table existencia
        add (constraint ca_existe_lib foreign key (cod_libro)
              references libro (cod_libro));
alter table existencia
        add (constraint ck_existe_cantidad check (cantidad > 0));
alter table existencia
        add (constraint ck_existe_cant_min check (cant_minima > 0));

create table libreria (
        cod_libreria    varchar2(4)      not null,
        nombre     	varchar2(20)     not null,
        direccion     	varchar2(20),
        ciudad     	varchar2(12),
        telefono   	varchar2(12)     not null);
alter table libreria
        add (constraint cp_libreria primary key (cod_libreria));

create table vendedor (
        cod_vendedor    varchar2(4)      not null,
        nombre     	varchar2(20)     not null,
        telefono   	varchar2(20)     not null,
        comision    	number(4,2)      default 5.5 not null);
alter table vendedor
        add (constraint cp_vend primary key (cod_vendedor));
alter table vendedor
        add (constraint ck_vend_com check (comision < 20));

create table pedido (
        num_pedido    	number(4)        not null,
        cod_libreria  	varchar2(4)      not null,
	cod_bodega    	varchar2(4),
        cod_vendedor  	varchar2(4),
        fecha       	date             not null,
        pendiente   	char(1)          default 'S' not null);
alter table pedido
        add (constraint ck_ped_pte check (pendiente in ('S','N')));
        
create table libro(
    cod_libro varchar2(4),
    titulo varchar2(50) NOT NULL,
    autores varchar2(20) NOT NULL,
    prec_compra number(6),
    prec_venta number(6),
    cod_editorial varchar2(4) NOT NULL
);

alter table libro
    add (constraint cp_libro primary key (cod_libro));
    
alter table libro
    add (constraint ca_libro_edi foreign key (cod_editorial) references editorial(cod_editorial));

create table detalle(
    num_pedido number(4) NOT NULL,
    cod_libro varchar2(4) NOT NULL,
    cantidad number(4) NOT NULL
);

alter table detalle
    add (constraint cp_num_ped_lib primary key(num_pedido, cod_libro));

alter table detalle
    add (constraint ca_det_ped foreign key (num_pedido) references pedido(num_pedido));
    
alter table detalle
    add (constraint ca_det_libro_libro foreign key (cod_libro) references libro(cod_libro));
    
ALTER SESSION SET NLS_DATE_FORMAT='DD/MM/YYYY';

insert into editorial values ('ACM','ACM', 'Avda. Montt 850', 'Santiago');
insert into editorial values ('AW','Addison Wesley', 'Quinta 980', 'Concepci�n');
insert into editorial values ('MGH','Mc Graw-Hill', 'Condell 880', 'Valpara�so');
insert into editorial values ('PH','Prentice-Hall', 'Independencia 25', 'Santiago');
insert into editorial values ('ST','Salvat', 'Libertad 700', 'Vi�a');

insert into libro values ('C500','Stephen Hawking. Una vida para la ciencia', 'M.White y J.Gribbin', 10000, 18000, 'ST');
insert into libro values ('R130','A Relational Model', 'Codd E.F.', 8000, 15000, 'ACM');
insert into libro values ('R222','Large Databases', 'Codd E.F.', 9000, 17000, 'ACM');
insert into libro values ('R356','Understanding Relations', 'Codd E.F.', 9000, 15000, 'ACM');
insert into libro values ('R456','Relational Database Management', 'Codd E.F.', 9500, 16000, 'ACM');
insert into libro values ('R503','Extending The Relational Model', 'Codd E.F.', 16000, 30000, 'ACM');
insert into libro values ('R600','Relational Databases', 'Chamberlin D.', 16000, 38000, 'ACM');
insert into libro values ('R771','Relational Database Systems', 'Kim W.', 10000, 20000, 'ACM');
insert into libro values ('R824','Relational Databases', 'Date C.J.', 10000, 15000, 'AW');
insert into libro values ('R923','Introduction To Database Systems', 'Date C.J.', 7000, 14000, 'AW');

insert into bodega values ('SO','Stgo. Oriente', 'Prat 580', 'Santiago', 7180025);
insert into bodega values ('SC','Stgo. Centro', 'Freire 256', 'Santiago', 5632400);
insert into bodega values ('VA','Valpso.', 'Independencia 180', 'Valpara�so', 606070);
insert into bodega values ('VM','Vi�a', 'Prat 430', 'Vi�a', 505580);

insert into existencia values ('SO','R130', 30,4);
insert into existencia values ('SO','R824', 23,5);
insert into existencia values ('SO','R923', 2,5);
insert into existencia values ('SC','R222', 12,5);
insert into existencia values ('SC','R456', 23,5);
insert into existencia values ('VA','R503', 30,2);
insert into existencia values ('VA','R600', 20,5);
insert into existencia values ('VA','R771', 1,5);
insert into existencia values ('VA','R824', 28,5);
insert into existencia values ('VM','R130', 3,5);
insert into existencia values ('VM','R222', 23,2);
insert into existencia values ('VM','R923', 2,5);
insert into existencia values ('VM','C500', 4,2);

insert into libreria values ('L1','Galileo', 'Valpara�so 420', 'Vi�a', 974530);
insert into libreria values ('L2','Altazor', 'Arlegui 370', 'Vi�a', 714789);
insert into libreria values ('L3','Andr�s Bello', 'Quinta 370', 'Vi�a', 714789);

insert into vendedor values ('JM','Juan Mart�nez', '678542', 10.0);
insert into vendedor values ('RP','Roberto Prats', '2-7713481', 12.5);

insert into pedido values (1,'L1', 'SO', 'RP', '09/09/2021', 'N');
insert into pedido values (2,'L3', 'VM','RP', '12/09/2021', 'S');
insert into pedido values (3,'L2', 'SO','JM', '18/09/2021', 'N');
insert into pedido values (4,'L1', 'SC','JM', '09/09/2021', 'S');
insert into pedido values (5,'L2', 'SC','JM', '23/09/2021', 'S');
insert into pedido values (6,'L1', 'VA','JM', '01/10/2021', 'S');
insert into pedido values (7,'L2', 'VA','JM', '15/10/2021', 'S');
insert into pedido values (8,'L1', 'VM','JM', '20/10/2021', 'S');
insert into pedido values (9,'L2', 'VM','JM', '28/10/2021', 'S');
insert into pedido values (10,'L1', 'SO','JM', '02/11/2021', 'S');
insert into pedido values (11,'L2','VM','JM', '10/11/2021', 'N');

insert into detalle values (1,'R130', 12);
insert into detalle values (1,'R824', 2);
insert into detalle values (2,'C500', 2);
insert into detalle values (2,'R923', 1);
insert into detalle values (3,'R923', 4);
insert into detalle values (4,'R222', 5);
insert into detalle values (4,'C500', 1);
insert into detalle values (5,'R456', 6);
insert into detalle values (6,'R503', 9);
insert into detalle values (6,'R600', 3);
insert into detalle values (7,'R771', 1);
insert into detalle values (7,'R824', 6);
insert into detalle values (8,'R130', 3);
insert into detalle values (8,'C500', 2);
insert into detalle values (9,'R222', 7);
insert into detalle values (9,'R923', 8);
insert into detalle values (10,'R130', 4);
insert into detalle values (10,'R923', 1);
insert into detalle values (11,'R130', 2);
insert into detalle values (11,'R222', 5);
insert into detalle values (11,'R923', 9);

select bod.cod_bodega, lib.cod_libro, lib.titulo, exi.cantidad from bodega bod
inner join existencia exi on bod.cod_bodega = exi.cod_bodega
inner join libro lib on exi.cod_libro = lib.cod_libro
inner join editorial edi on lib.cod_editorial = edi.cod_editorial
where (
exi.cantidad < exi.cant_minima and 
lib.titulo like '%Relational Database%' and
edi.ciudad like '%Santiago%' and
exi.cantidad > exi.cant_minima*2);

select lib.titulo, det.cantidad from 
libro lib
inner join detalle det on lib.cod_libro = det.cod_libro
inner join pedido ped on det.num_pedido = ped.num_pedido
where (
ped.pendiente like '%S%' and
ped.fecha between '1/9/2021' and '1/11/2021' and
det.cantidad >= 9);

update libro
    set 
    prec_compra = prec_compra*1.03,
    prec_venta = prec_venta*1.03
    where(
    cod_editorial = (select cod_editorial from editorial where nombre = 'ACM') and
    prec_venta between 15000 and 20000 and
    cod_libro = (select cod_libro from pedido where pendiente = 'S' and fecha = (select min(fecha) from pedido))
    );
    
insert into pedido values(
(select max(num_pedido) + 1 from pedido),
(select cod_libreria from libreria where nombre = 'Altazor'),
(select cod_bodega from bodega where cod_bodega = 'VM'),
null,
SYSDATE,
'S'
);

insert into detalle values(
(select max(num_pedido) from pedido),
(select cod_libro from libro where titulo like '%Hawking%'),
3
);

DELETE FROM existencia
where(
cod_libro = (select cod_libro from libro where (autores like '%Date C.J.%' and cod_editorial = (select cod_editorial from editorial where(nombre like '%Adisson Wesley%'))))
);

select * from existencia;

















