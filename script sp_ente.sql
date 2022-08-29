/*
 * Creado: Joel Diaz*/
if OBJECT_ID('sp_clientes') is not null
begin
	drop procedure sp_clientes
end

go
create procedure sp_clientes(
	@i_codigo		int = null,
	@i_cedula 		varchar(10) = null,
	@i_nombre 		varchar(100) = null,
	@i_apellido		varchar(100) = null,
	@i_operacion	char(1)
)
as

--I=insertar
if @i_operacion = 'I'
begin
	if @i_cedula is null
	begin
		raiserror('La cedula no puede ser vacio',1,5)
		return 1300
	end
	if @i_nombre is null
	begin
		raiserror('El primer nombre no puede ser vacio',1,5)
		return 1300
	end
	if @i_apellido is null
	begin
		raiserror('El primer apellido no puede ser vacio',1,5)
		return 1300
	end
	
	--validar cedula
	if exists(select 1 from cliente where cl_cedula = @i_cedula)
	begin
		raiserror('La cedula ya esta registrada',1,5)
		return 1300
	end
	
	insert into cliente (
		cl_nombre, cl_apellido, cl_cedula, cl_estado)
	values(
		@i_nombre, @i_apellido, @i_cedula, 'V')
end

--D=Eliminar cliente
if @i_operacion = 'D'
begin
	update cliente 
	set cl_estado = 'E'
	where cl_codigo = @i_codigo
end

--S=Recuerar todos los clientes en estado V
if @i_operacion = 'S'
begin
	select
		cl_codigo ,
		cl_cedula,
		cl_nombre,
		cl_apellido 
	from cliente c  
	where cl_estado='V'
end