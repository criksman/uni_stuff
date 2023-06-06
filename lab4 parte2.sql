/*1*/
select count(*) from empleado e, depto d
where e.cod_depto = d.cod_depto
and d.ubicacion like 'Quilpu%'

/*2*/
select e.nom_emp, e.empleo, d.nom_depto, d.ubicacion from empleado e, depto d
where e.cod_depto = d.cod_depto

/*3*/
select e.nom_emp, s.cod_supervisor, s.nom_emp from empleado e, empleado s
where e.cod_supervisor = s.cod_emp

/*4*/
select e.nom_emp, d.nom_depto, s.sueldo_minimo, s.sueldo_maximo from empleado e, depto d, sueldo s
where e.cod_depto = d.cod_depto and e.grado = s.grado;

/*5*/
select e.nom_emp from empleado e
where exists(select * from depto d 
            where e.cod_depto = d.cod_depto and d.ubicacion = 'Valpo');
            
/*6*/
select d.cod_depto, d.nom_depto from depto d
where (select count(*) from empleado e
        where d.cod_depto = e.cod_depto) > 4
        
/*7*/
select * e.nom_emp, d.nom_depto, e.empleo, e.salario_sem from empleado e, departamento d;

select * from empleado;
select * from depto
select * from sueldo;