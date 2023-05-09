create table Tablita
    (a char(1),
    b number(5));
    
insert into tablita values('p',30);
insert into tablita values('q',20);
insert into tablita values('r',10);
insert into tablita values('s',70);
insert into tablita values('t',50);
insert into tablita values('u',null);
insert into tablita values('x',10);
insert into tablita values('v',50);

select count(*) from Tablita;
select count(b) from tablita;
select min(b) from tablita;
select max(b) from tablita;

select min(b) from tablita
    where a between 's' and 'v';
    
select avg(b) from tablita;

select avg(distinct b) from tablita;

/*1*/
select count(*), round(avg(comision),2) from empleado
    where comision != 0;

/*2*/
select round(avg(salario_sem * 4),2) from empleado;

/*3*/

/*4*/
select count(distinct(grado)) from empleado
    where cod_depto = 30;
    
/*5*/
select count(distinct(empleo)), grado from empleado
    group by grado;