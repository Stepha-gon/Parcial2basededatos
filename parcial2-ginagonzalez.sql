select * from empleado
select * from sede
select * from cargo
select * from estrato
select * from empleado_cargo
select * from empleado_estrato
select * from empleado_sede

alter table empleado drop column ID
alter table sede drop column ID
alter table cargo drop column ID
alter table estrato drop column ID
alter table empleado_cargo drop column ID
alter table empleado_estrato drop column ID
alter table empleado_sede drop column ID

alter table empleado
  add primary key (cc)
alter table cargo
  add primary key (id_cargo)
alter table sede
  add primary key (id_sede)
alter table estrato
  add primary key (id_estrato)

alter table empleado
add constraint fk_emp_cargo 
    foreign key(id_cargo) 
    references cargo (id_cargo)
alter table empleado
add constraint fk_emp_sede
    foreign key(id_sede) 
    references sede (id_sede)
alter table empleado
add constraint fk_emp_estrato
    foreign key(id_estrato) 
    references estrato (id_estrato)

select count(*) from empleado

SELECT id_sede AS sede, count(*) AS cantidad FROM empleado GROUP BY id_sede

SELECT id_estrato AS estrato, count(*) AS cantidad FROM empleado GROUP BY id_estrato

SELECT  max(fecha_contratacion) as fecha from empleado 

SELECT  min(fecha_contratacion) as fecha from empleado 
SELECT SUM(sueldo) as sumasueldo FROM empleado


select nombre,id_sede,id_cargo from empleado where cc=10662101

select cc from empleado where cc=10188530

delete from empleado where cc=10188530

SELECT fecha_contratacion as fecha from empleado where fecha_contratacion between 01/01/2000 31/12/04


SELECT estrato AS estrato, count(*) AS cantidad FROM estrato GROUP BY estrato

SELECT sede AS sede, count(*) AS cantidad FROM sede GROUP BY sede

select cc as empleado from empleado where edad_ between 17 and 25
