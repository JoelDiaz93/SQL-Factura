--Ingreso de datos de cabecera de factura
exec evaluacion..sp_facturacion @i_operacion="I", @i_codigo_cl=1
exec evaluacion..sp_facturacion @i_operacion="I", @i_codigo_cl=3
exec evaluacion..sp_facturacion @i_operacion="I", @i_codigo_cl=2
exec evaluacion..sp_facturacion @i_operacion="I", @i_codigo_cl=5
exec evaluacion..sp_facturacion @i_operacion="I", @i_codigo_cl=4

exec evaluacion..sp_facturacion @i_operacion="R"

