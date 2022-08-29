-- recuperar cabeceras por codigo de cliente
exec evaluacion..sp_facturacion @i_operacion="C", @i_codigo_cl=2
exec evaluacion..sp_facturacion @i_operacion="C", @i_codigo_cl=1
exec evaluacion..sp_facturacion @i_operacion="C", @i_codigo_cl=3
exec evaluacion..sp_facturacion @i_operacion="C", @i_codigo_cl=4