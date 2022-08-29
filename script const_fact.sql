/*
 * Creado: Joel Diaz*/
if OBJECT_ID('sp_consulta_fact') is not null
begin
	drop procedure sp_consulta_fact
end

go
create procedure sp_consulta_fact(
	--@i_codigo_cl	int = null,
	@i_codigo		int = null,
	--@i_codigo_pr	int = null,
	--@i_fecha 		varchar(10) = null,
	--@i_total 		varchar(100) = null,
	--@i_estado		varchar(100) = null,
	--@i_cantidad		int = null,
	@i_fecha_d		datetime = null,
	@i_fecha_h		datetime = null,
	@i_operacion	char(1)
)
as
declare @w_total money

--Q=Recuerar todas las facturas con un join
if @i_operacion = 'Q'
begin
	--Cliente y cabecera
	select
		cl_cedula , cl_nombre , cl_apellido, cf_codigo, cf_fecha, cf.cf_total 
	from cliente c , cabecera_factura cf  
	where cf.cf_codigo_cliente = c.cl_codigo and cf.cf_codigo = @i_codigo 
	--detalle y producto
	select
		df.df_codigo_factura, df.df_codigo_producto, p.pr_nombre, p.pr_precio, df.df_cantidad, df.df_subtotal 
	from detalle_factura df, producto p  
	where df.df_codigo_producto = p.pr_codigo and df.df_codigo_factura = @i_codigo 
end

--S=Recuerar todas las facturas por rango de fecha
if @i_operacion = 'S'
begin
	--Cliente y cabecera
	select
		cl_cedula , cl_nombre , cl_apellido, cf_codigo, cf_fecha
	from cliente c , cabecera_factura cf  
	where cf.cf_codigo_cliente = c.cl_codigo and cf.cf_fecha between @i_fecha_d and @i_fecha_h
end

--R=Recuerar todas las facturas
if @i_operacion = 'R'
begin
	select @w_total = sum(df.df_subtotal) from detalle_factura df where df.df_codigo_factura = @i_codigo
	
	update cabecera_factura 
	set cf_total = @w_total
	where cf_codigo = @i_codigo
end