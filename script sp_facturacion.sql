/*
 * Creado: Joel Diaz*/
if OBJECT_ID('sp_facturacion') is not null
begin
	drop procedure sp_facturacion
end

go
create procedure sp_facturacion(
	@i_codigo_cl	int = null,
	@i_codigo		int = null,
	@i_codigo_pr	int = null,
	@i_fecha 		varchar(10) = null,
	@i_total 		varchar(100) = null,
	@i_estado		varchar(100) = null,
	@i_cantidad		int = null,
	@i_fecha_d		datetime = null,
	@i_fecha_h		datetime = null,
	@i_operacion	char(1)
)
as
declare @w_precio_pr money
declare @w_subtotal money
declare @w_total money

--I=insertar
if @i_operacion = 'I'
begin
	if @i_codigo_cl is null
	begin
		raiserror('El codigo de cliente no puede ser vacio',1,5)
		return 1300
	end
	
	--validar cedula
	if (select 1 from cliente where cl_codigo = @i_codigo_cl) is null
	begin
		raiserror('No existe el cliente',1,5)
		return 1300
	end
	
	insert into cabecera_factura  (
		cf_codigo_cliente, 	cf_fecha, 	cf_total, 	cf_estado)
	values(
		@i_codigo_cl, 		getDate(),	0, 			'V')
end

--C=Recuerar todas las facturas
if @i_operacion = 'C'
begin
	select
		cf_codigo,
		cf_codigo_cliente,
		cf_fecha,
		cf_total 
	from cabecera_factura cf  
	where cf_codigo_cliente = @i_codigo_cl
end

--R=Recuerar todas las facturas
if @i_operacion = 'R'
begin
	select
		cf_codigo,
		cf_codigo_cliente,
		cf_fecha,
		cf_total 
	from cabecera_factura cf  
	where cf_estado='V'
end

--S=Recuerar todas las facturas
if @i_operacion = 'S'
begin
	select
		cf_codigo,
		cf_codigo_cliente,
		cf_fecha,
		cf_total 
	from cabecera_factura cf  
	where cf_fecha between @i_fecha_d and @i_fecha_h
end

--Q=Recuerar todas las facturas
if @i_operacion = 'Q'
begin
	select
		cf_codigo,
		cf_codigo_cliente,
		cf_fecha,
		cf_total 
	from cabecera_factura cf  
	where cf_codigo = @i_codigo
	
	select
		df_codigo_factura ,
		df_codigo_producto ,
		df_cantidad ,
		df_subtotal 
	from detalle_factura df
	where df_codigo_factura = @i_codigo
end

--T=recuera los detalles de factura
if @i_operacion = 'T'
begin
	select
		df_codigo_factura ,
		df_codigo_producto ,
		df_cantidad ,
		df_subtotal 
	from detalle_factura df
end

--D permite agrgar el detalle a una factura
if @i_operacion = 'D'
begin
	--validar factura
	if (select 1 from cabecera_factura cf2  where cf_codigo  = @i_codigo) is null
	begin
		raiserror('No existe la factura',1,5)
		return 1300
	end
	--validar producto
	if (select 1 from producto p  where pr_codigo  = @i_codigo_pr) is null
	begin
		raiserror('No existe el producto',1,5)
		return 1300
	end
	select @w_precio_pr = pr_precio from producto p2 where pr_codigo = @i_codigo_pr
	select @w_subtotal = @w_precio_pr * @i_cantidad
	insert into detalle_factura (
		df_codigo_factura, 	df_codigo_producto, 	df_cantidad, 	df_subtotal)
	values(
		@i_codigo,			@i_codigo_pr,			@i_cantidad,	@w_subtotal)
	
	select @w_total = sum(df.df_subtotal) from detalle_factura df where df.df_codigo_factura = @i_codigo
	
	update cabecera_factura 
	set cf_total = @w_total
	where cf_codigo = @i_codigo
end