--Ingreso de valores a detalle de factura
exec evaluacion..sp_facturacion @i_operacion="D", @i_codigo=1, @i_codigo_pr=2, @i_cantidad=3
exec evaluacion..sp_facturacion @i_operacion="D", @i_codigo=2, @i_codigo_pr=1, @i_cantidad=2
exec evaluacion..sp_facturacion @i_operacion="D", @i_codigo=3, @i_codigo_pr=3, @i_cantidad=5
exec evaluacion..sp_facturacion @i_operacion="D", @i_codigo=2, @i_codigo_pr=5, @i_cantidad=4
exec evaluacion..sp_facturacion @i_operacion="D", @i_codigo=4, @i_codigo_pr=6, @i_cantidad=1
exec evaluacion..sp_facturacion @i_operacion="D", @i_codigo=4, @i_codigo_pr=3, @i_cantidad=4
exec evaluacion..sp_facturacion @i_operacion="D", @i_codigo=4, @i_codigo_pr=2, @i_cantidad=2
--Productos que no existen
exec evaluacion..sp_facturacion @i_operacion="D", @i_codigo=4, @i_codigo_pr=11, @i_cantidad=1
exec evaluacion..sp_facturacion @i_operacion="D", @i_codigo=4, @i_codigo_pr=12, @i_cantidad=1
--Facturas que no existen
exec evaluacion..sp_facturacion @i_operacion="D", @i_codigo=7, @i_codigo_pr=11, @i_cantidad=1
exec evaluacion..sp_facturacion @i_operacion="D", @i_codigo=8, @i_codigo_pr=11, @i_cantidad=1

exec evaluacion..sp_facturacion @i_operacion="T"