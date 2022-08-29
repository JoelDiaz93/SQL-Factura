-- test producto
exec evaluacion..sp_productos @i_operacion="I", @i_nombre="esfero", @i_precio=0.75
exec evaluacion..sp_productos @i_operacion="I", @i_nombre="lapiz", @i_precio=0.30
exec evaluacion..sp_productos @i_operacion="I", @i_nombre="cuaderno", @i_precio=1.75
exec evaluacion..sp_productos @i_operacion="I", @i_nombre="borrador", @i_precio=0.50
exec evaluacion..sp_productos @i_operacion="I", @i_nombre="regla", @i_precio=1.10

exec evaluacion..sp_productos @i_operacion="U", @i_nombre="graduador", @i_codigo=6
exec evaluacion..sp_productos @i_operacion="U", @i_precio=0.92, @i_codigo=6

exec evaluacion..sp_productos @i_operacion="R"

exec evaluacion..sp_productos @i_operacion="S", @i_buscar="or"

