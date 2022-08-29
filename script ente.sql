if OBJECT_ID('cliente') is not null
begin
	drop table cliente	
	print 'entra borrando'
end
 
create table cliente(
	cl_codigo int identity(1,1) not null,
	cl_nombre varchar(100) not null,
	cl_apellido varchar(100) not null,
	cl_cedula varchar(10) not null,
	cl_estado char(1) not null,
)

Select * from cliente 