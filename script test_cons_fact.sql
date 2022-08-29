--test recuperar 2 SELECT 
exec evaluacion..sp_consulta_fact @i_operacion="Q", @i_codigo=4

--recuperar por rango de fecha
exec evaluacion..sp_consulta_fact @i_operacion="S", @i_fecha_d = "2022-08-26 01:46", @i_fecha_h = "2022-08-26 01:48"

--Calcular el total de una sp_facturacion
exec evaluacion..sp_consulta_fact @i_operacion="R", @i_codigo=2
exec evaluacion..sp_consulta_fact @i_operacion="R", @i_codigo=4
exec evaluacion..sp_consulta_fact @i_operacion="R", @i_codigo=1
exec evaluacion..sp_consulta_fact @i_operacion="R", @i_codigo=3