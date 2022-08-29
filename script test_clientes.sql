--test cliente
exec evaluacion..sp_clientes @i_operacion="I", @i_cedula="1234567890", @i_nombre="Karina", @i_apellido="Torres"
exec evaluacion..sp_clientes @i_operacion="I", @i_cedula="0987654321", @i_nombre="Alicia", @i_apellido="Miraflores"
exec evaluacion..sp_clientes @i_operacion="I", @i_cedula="1231234445", @i_nombre="Johana", @i_apellido="Gavilanes"
exec evaluacion..sp_clientes @i_operacion="I", @i_cedula="1111333345", @i_nombre="Abigail", @i_apellido="Novoa"
exec evaluacion..sp_clientes @i_operacion="I", @i_cedula="1234567890", @i_nombre="Esperanza", @i_apellido="Roca"

exec evaluacion..sp_clientes @i_operacion="D", @i_codigo=2

exec evaluacion..sp_clientes @i_operacion="S"
