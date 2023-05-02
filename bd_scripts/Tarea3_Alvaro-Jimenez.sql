create table depto
  (cod_depto int      not null,
   nom_depto char(10) not null,
   ubicacion char(10) not null);

alter table depto
   add (constraint pk_depto primary key (cod_depto));

create table empleado
  (cod_emp     int      not null,
   nom_emp     char(15) not null,
   empleo      char(20) not null,
   cod_supervisor int   null,
   fecha_ingreso  date  not null,
   salario_sem int      not null,
   comision    int      null,
   cod_depto   int      not null);

alter table empleado
   add (constraint pk_empleado primary key (cod_emp))
   add (constraint fk_empleado_depto foreign key(cod_depto) references depto(cod_depto))
   add (constraint fk_empleado_supervisor foreign key(cod_supervisor) references empleado(cod_emp));

create table sueldo
  (grado         int not null,
   sueldo_minimo int not null,
   sueldo_maximo int not null);

alter table sueldo
   add (constraint pk_sueldo primary key (grado));
   
insert into depto values (10,'Finanzas','Valpo');
insert into depto  values (20,'Desarrollo','Stgo');
insert into depto  values (30,'Ventas','Vi?a');
insert into depto  values (40,'Operaci?n','Quilpu?');


insert into empleado  values (7839, 'Karla', 'Gerente','','17/11/2006',5000,0,10);
insert into empleado  values (7566, 'Juan P.', 'supervisor',7839,'02/04/2006',2975,0,20);
insert into empleado  values (7902, 'Fabi?n', 'analista',7566,'03/12/2006',3000,0,20);
insert into empleado  values (7369, 'Juan', 'prog',7902,'17/12/2005',800,0,20);
insert into empleado  values (7698, 'Blanca', 'supervisor',7839,'01/05/2006',2850,0,30);
insert into empleado  values (7499, 'Allen', 'vendedor',7698,'20/02/2006',1600,300,30);
insert into empleado  values (7521, 'Williams', 'vendedor',7698,'22/02/2006',1250,500,30);
insert into empleado  values (7654, 'Mart?n', 'vendedor',7698,'28/10/2006',1250,1400,30);
insert into empleado  values (7782, 'Carlos', 'supervisor',7839,'09/06/2006',2450,0,10);
insert into empleado  values (7788, 'Silvia', 'analista',7566,'09/12/2006',3000,0,20);
insert into empleado  values (7844, 'Tom?s', 'vendedor',7698,'08/10/2006',1500,0,30);
insert into empleado  values (7876, 'Alvaro', 'prog',7788,'12/01/2008',1100,0,20);
insert into empleado  values (7900, 'Jaime', 'prog',7698,'03/12/2006',950,0,30);
insert into empleado  values (7934, 'Miguel', 'prog',7782,'23/01/2007',1300,0,10);


insert into sueldo values (1,700,1200);
insert into sueldo values (2,1201,1400);
insert into sueldo values (3,1401,2000);
insert into sueldo values (4,2001,3000);
insert into sueldo values (5,3001,9999);


/*1*/
select * from empleado;
select * from depto;
select * from sueldo;

/*2*/
select cod_emp, salario_sem, comision, cod_depto, fecha_ingreso from empleado;

/*3*/
select nom_emp "EMPLEADO" from empleado;

/*4*/
select nom_emp, empleo from empleado
    order by empleo asc;

/*5*/
select nom_emp, empleo, salario_sem from empleado
    order by empleo asc, salario_sem desc;

/*6*/
select distinct cod_depto from empleado;

/*7*/
select * from empleado
    where empleo = 'vendedor';

/*8*/
select * from empleado
    where cod_depto != 20;
    
/*9*/
select * from empleado
    where fecha_ingreso < '01/01/2007';
    
/*10*/
insert into depto values(50, 'Estudio', 'Stgo');
insert into depto values(60, 'RRHH', 'Rancagua');
insert into depto values(70, 'Servicio', 'Valpo');

/*11*/
insert into empleado values (7369, 'John', 'supervisor','','12/2/2023',5000,0,40);

/*12*/
insert into empleado values (7935, 'Jorge', 'vendedor','','13/2/2023',6000,0,50);
insert into empleado values (7936, 'BagDarrel', 'prog','','13/2/2023',3000,0,50);
insert into empleado values (7937, 'Person', 'prog','','13/2/2023',3000,0,50);
insert into empleado values (7938, 'Ernesto', 'supervisor','','13/2/2023',4000,0,50);

/*---------------------*/

/*1*/
update sueldo
    set sueldo_maximo = 5000
    where grado = 5;

/*2*/
insert into sueldo values(6,4001, 5000);
insert into sueldo values(7,5001, 9999);

/*3*/
update empleado
    set comision = (comision*0.1)+comision
    where cod_depto = 30;

/*4*/
alter table sueldo
    add(descripcion varchar(30));

update sueldo
    set sueldo_maximo = 6000
    where grado = 7;
    
update sueldo
    set descripcion = 'TRAMO7'
    where grado = 7;

/*5*/
update depto
    set nom_depto = 'Produccion'
    where cod_depto = 30;
    
update empleado
    set empleo = 'productor'
    where cod_depto = 30;

/*6*/
delete from depto
    where cod_depto > 49;
    
/*7*/
alter table empleado
    add(grado int)
    add(constraint fk_empleado_sueldo foreign key(grado) references sueldo(grado));
    
/*8*/
create table sin_comision_des
  (cod_emp     int      not null,
   nom_emp     char(15) not null,
   empleo      char(20) not null,
   cod_supervisor int   null,
   fecha_ingreso  date  not null,
   salario_sem int      not null,
   comision    int      null,
   cod_depto   int      not null);
   
alter table sin_comision_des
    add(grado int);

alter table sin_comision_des
   add (constraint pk_desempleado primary key (cod_emp))
   add (constraint fk_desempleado_depto foreign key(cod_depto) references depto(cod_depto))
   add (constraint fk_desempleado_sueldo foreign key(grado) references sueldo(grado));

insert into sin_comision_des
    select * from empleado
    where comision = 0 AND cod_depto = 20;

delete from empleado
    where comision = 0 AND cod_depto = 20;
    
/*Guia 3*/

insert into empleado values (7838, 'Karlo', 'analista','7839','17/11/2006',5000,0,40,5);
insert into empleado values (7565, 'Juana.', 'supervisor',7839,'02/04/2006',2975,0,40,4);
insert into empleado values (7697, 'Ana', 'supervisor',7839,'01/05/2006',4500,0,40,5);
insert into empleado values (7901, 'Cecilia', 'analista',7697,'03/12/2006',3000,0,40,4);
insert into empleado values (7368, 'Cristina', 'prog','7565','17/12/2005',800,0,40,1);

/*1*/
select * from empleado
    where cod_supervisor is not null;
    
/*2*/
select * from empleado
    where grado in(1,3,4);

/*3*/
select * from empleado
    where empleo not in('supervisor', 'prog');

/*4*/
select * from empleado
    where cod_depto in(select cod_depto from depto where ubicacion = 'Valpo');
    
/*5*/
update sueldo
    set descripcion = 'sin info'
    where grado between 1 and 6;

/*6*/
select * from empleado
    where fecha_ingreso not between '01/01/2007' and '31/12/2007';
    
/*7*/
select * from empleado
    where nom_emp like '__r%';

/*8*/
select nom_emp, salario_sem from SIN_COMISION_DES
    where nom_emp like '%Juan%';
    
/*9*/
select nom_emp, salario_sem from empleado
    where nom_emp not like '%a%' and nom_emp not like '%A%';
    
/*10*/
select * from empleado
    where salario_sem like '%50';
    
/*11*/
select * from empleado
    where empleo like 'p%';

/*12*/
select * from empleado
    where cod_supervisor is null;