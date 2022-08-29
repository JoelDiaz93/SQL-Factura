if OBJECT_ID('detalle_factura') is not null
begin
	drop table detalle_factura	
	print 'entra borrando'
end
 
create table detalle_factura(
	df_codigo_producto varchar(5)  not null,
	df_codigo_factura int not null,
	df_cantidad int not null,
	df_subtotal money not null
)

Select * from detalle_factura 