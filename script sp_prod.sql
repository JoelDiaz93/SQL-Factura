/*
 * Creado: Joel Diaz*/
if OBJECT_ID('sp_productos') is not null
begin
	drop procedure sp_productos
end

go
create procedure sp_productos(
	@i_codigo		int = null,
	@i_nombre 		varchar(100) = null,
	@i_precio		money = null,
	@i_buscar		varchar(100) = null,
	@i_operacion	char(1)
)
as
declare @w_codigo int
declare @w_nombre varchar(100)
declare @w_precio money

--I=insertar
if @i_operacion = 'I'
begin
	if @i_precio is null
	begin
		raiserror('El precio no puede ser vacio',1,5)
		return 1300
	end
	if @i_nombre is null
	begin
		raiserror('El nombre no puede ser vacio',1,5)
		return 1300
	end
	
	select @w_codigo = max(pr_codigo) from producto
	select @w_codigo = @w_codigo +1
	
	insert into producto  (
		pr_nombre, pr_codigo, pr_precio)
	values(
		@i_nombre, @w_codigo, @i_precio)
end

--U=Recuerar todos los clientes en estado V
if @i_operacion = 'U'
begin
	if @i_codigo is null
	begin
		raiserror('El codigo no puede ser vacio',1,5)
		return 1300
	end
	if @i_nombre is null
	begin
		select @i_nombre = pr_nombre from producto p where pr_codigo = @i_codigo
	end
	if @i_precio is null
	begin
		select @i_precio = pr_precio  from producto p where pr_codigo = @i_codigo
	end
	update producto 
	set
		pr_nombre = @i_nombre,
		pr_precio = @i_precio
	where pr_codigo = @i_codigo
end

--S=Recuerar todos los clientes en estado V
if @i_operacion = 'S'
begin
	if @i_buscar is null
	begin
		raiserror('La busqueda no puede ser vacio',1,5)
		return 1300
	end
	select
		pr_codigo ,
		pr_nombre,
		pr_precio
	from producto p 
	where pr_nombre like '%' + @i_buscar + '%'
end

--R=Recuerar todos los clientes en estado V
if @i_operacion = 'R'
begin
	select
		pr_codigo ,
		pr_nombre,
		pr_precio
	from producto p 
end