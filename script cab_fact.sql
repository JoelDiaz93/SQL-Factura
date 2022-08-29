if OBJECT_ID('cabecera_factura') is not null
begin
	drop table cabecera_factura	
	print 'entra borrando'
end
 
create table cabecera_factura(
	cf_codigo_cliente int not null,
	cf_fecha datetime not null,
	cf_codigo int identity(1,1) not null,
	cf_total money not null,
	cf_estado varchar(1) not null
)

Select * from cabecera_factura 