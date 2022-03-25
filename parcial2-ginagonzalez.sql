drop table empleado
drop table cargo
drop table estrato
drop table sede
----------------------------
--SELECT
select * from empleado
select * from sede
select * from cargo
select * from estrato

--DROP FILA ID
alter table empleado drop column ID
alter table sede drop column ID
alter table cargo drop column ID
alter table estrato drop column ID


-- PRIMARY KEY
alter table empleado
  add primary key (cc)

alter table cargo
  add primary key (id_cargo)

alter table sede
  add primary key (id_sede)

alter table estrato
  add primary key (id_estrato)


--FOREIGN KEY
alter table empleado
add constraint fk_emp_cargo 
    foreign key(id_cargo) 
    references cargo (id_cargo)

alter table empleado
add constraint fk_emp_estrato
    foreign key(id_estrato) 
    references estrato (id_estrato)

alter table empleado
add constraint fk_emp_sede
    foreign key(id_sede) 
    references sede (id_sede)


-- PARCIAL 2 PRESENTADO POR GINA GONZALEZ

--1.	¿Cuántos empleados son?
select count(*) as cantidadempleados from empleado 

--2.	¿Cuántos empleados por sede?

select sede.sede , count(*) as cantidadempleados
from empleado,sede
where empleado.id_sede = sede.id_sede
GROUP BY sede.sede

--3.	¿Cuántos empleados por estrato?

select estrato.estrato , count(*) as cantidadempleados
from empleado,estrato
where empleado.id_estrato =estrato.id_estrato
GROUP BY estrato.estrato

--4.	¿Cuál es el empleado más nuevo?
select empleado.cc , empleado.nombre, fecha_contratacion as fecha from empleado where fecha_contratacion=(select max (fecha_contratacion) from empleado)

--5.	¿Cuál es el empleado más antiguo?
select empleado.cc ,empleado.nombre, fecha_contratacion as fecha from empleado where fecha_contratacion=(select min (fecha_contratacion) from empleado)

--6.	Consultar el nombre, sede y cargo del empleado con CC igual 10662101

SELECT empleado.cc,empleado.nombre, cargo.cargo,sede.sede
FROM empleado,cargo, sede
WHERE empleado.id_cargo = cargo.id_cargo and  empleado.id_sede=sede.id_sede  and empleado.cc=10662101

--7.	Un empleado fue despedido de la compania y por Habesdata autorizaron eliminar todos sus datos de la base de datos con CC Igual 10188530
select cc from empleado where cc=10188530

delete from empleado where cc=10188530

--8.	Consultar todos los empleados cuyo ingreso en la compania estén entre  2000 y 2005
SELECT	cc,nombre,fecha_contratacion
FROM    empleado
WHERE	fecha_contratacion BETWEEN '01/01/00' AND '31/12/05'
order by fecha_contratacion desc;

--9.	Obtener el nombre y edad de los empleados más jóvenes y más antiguos y ordene el nombre de manera decreciente 

select nombre,edad_,fecha_contratacion
from empleado
where (edad_=(select min (edad_) from empleado)) or (fecha_contratacion=(select min (fecha_contratacion) from empleado))
order by nombre desc;

--10.	Consultar todos los empleados que estén entre 17  y 25 edad

select cc,nombre as empleado, edad_ from empleado where edad_ between 17 and 25

--11.Queremos saber el promedio de edad de los empleados de la empresa

select  avg(edad_) as promedio_edad
from empleado

--12. necesitamos sumar todos los sueldos de los empleados

SELECT SUM(sueldo) as suma_sueldo FROM empleado

--13.Queremos saber el nombre, sede, estrato, fecha de contratación y el nombre del cargo del empleado que más gana en la empresa.  

SELECT empleado.nombre, cargo.cargo,sede.sede,estrato.estrato,empleado.fecha_contratacion,empleado.sueldo
FROM empleado,  cargo, sede, estrato
WHERE empleado.id_cargo = cargo.id_cargo and empleado.id_estrato = estrato.id_estrato and  empleado.id_sede=sede.id_sede and (empleado.sueldo=(select max (empleado.sueldo) from empleado))
--comprobacion--
select max(sueldo) from empleado 

--14.Queremos saber el nombre del médico más joven que haya en la sede SUR

SELECT empleado.nombre, cargo.cargo,sede.sede,empleado.edad_
FROM empleado, cargo, sede
WHERE  empleado.edad_=(select min(empleado.edad_) from empleado) and empleado.id_cargo=cargo.id_cargo and  empleado.id_sede=sede.id_sede and sede.id_sede=103 and cargo.id_cargo=204

-- no hay un empleado con esas caracteristicas pero si se cambia la cansulta quedaría

SELECT empleado.nombre, cargo.cargo,sede.sede,empleado.edad_
FROM empleado, cargo, sede
WHERE  empleado.edad_=(select min(empleado.edad_) from empleado) and empleado.id_cargo=cargo.id_cargo and  empleado.id_sede=sede.id_sede and sede.id_sede=103 and cargo.id_cargo=202


--15.Genere una consulta que muestre:

select estrato.estrato , count(*) as cantidadempleados
from empleado,estrato
where  empleado.id_estrato=estrato.id_estrato
GROUP BY estrato.estrato
order by estrato.estrato asc;

--16.Genere una consulta que muestre:
select sede.sede , count(*) as cantidadempleados
from empleado,sede
where empleado.id_sede=sede.id_sede
GROUP BY sede.sede
order by sede.sede asc;
