--Recuperar por codigo de factura cabecera y detalle
exec evaluacion..sp_facturacion @i_operacion="Q", @i_codigo=1
exec evaluacion..sp_facturacion @i_operacion="Q", @i_codigo=4