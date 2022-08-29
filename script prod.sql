if OBJECT_ID('producto') is not null
begin
	drop table producto	
	print 'entra borrando'
end
 
create table producto(
	pr_nombre varchar(50) not null,
	pr_codigo int not null,
	pr_precio money not null
)

Select * from producto 