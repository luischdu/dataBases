-- 1
SELECT CategoriaNombre FROM emarket.categorias;
-- 2
SELECT CategoriaNombre, Descripcion FROM emarket.categorias;
-- 3
SELECT ProductoNombre FROM emarket.productos;
-- 4 No existen
SELECT ProductoNombre FROM emarket.productos
where Discontinuado = 1;
-- 5 'Northwoods Cranberry Sauce'
SELECT ProductoNombre FROM emarket.productos
where ProductoID = 8;
-- 6
SELECT ProductoNombre, PrecioUnitario FROM emarket.productos
where PrecioUnitario between 10 and 22;
-- 7 Hay que solicitar 18 productos
SELECT count(ProductoNombre) FROM emarket.productos
where UnidadesStock < NivelReorden;
-- 8
SELECT ProductoNombre, UnidadesStock, NivelReorden FROM emarket.productos
where UnidadesStock < NivelReorden and UnidadesPedidas = 0;
-- clientes
-- 1
SELECT Compania, Contacto, Titulo, Pais FROM emarket.clientes;
-- 2
SELECT Compania, Contacto, Titulo, Pais FROM emarket.clientes
where Titulo = 'Owner';
-- 3
SELECT Compania, Contacto, Titulo, Pais FROM emarket.clientes
where Contacto like 'C%';
-- Facturas
-- 1
SELECT * FROM emarket.facturas
order by FechaFactura asc;
-- 2
SELECT * FROM emarket.facturas
where PaisEnvio = 'USA' and EnvioVia <> 3;
-- 3
SELECT * FROM emarket.facturas
where ClienteID = 'GOURL';
-- 4
SELECT * FROM emarket.facturas
where EmpleadoID in (2,3,5,8,9);

-- Parte II --
-- Productos
-- 1
SELECT * FROM emarket.productos
order by PrecioUnitario desc;
-- 2
SELECT * FROM emarket.productos
order by PrecioUnitario desc
limit 5;
-- 3
SELECT * FROM emarket.productos
order by UnidadesStock desc
limit 10;

-- facturaDetalle
-- 1
SELECT FacturaID, ProductoID, Cantidad FROM emarket.facturadetalle;
-- 2
SELECT FacturaID, ProductoID, Cantidad FROM emarket.facturadetalle
order by Cantidad desc;
-- 3 
SELECT FacturaID, ProductoID, Cantidad FROM emarket.facturadetalle
where Cantidad between 50 and 100
order by Cantidad desc;

-- 4
SELECT FacturaID as NroFactura, ProductoID as Producto, (PrecioUnitario*Cantidad) as Total FROM emarket.facturadetalle;

-- Extras --
-- 1
SELECT Contacto FROM emarket.clientes
where Pais in ('Brazil', 'Mexico') or Titulo like 'Sales%';
-- 2
SELECT Compania, Contacto FROM emarket.clientes
where Compania like 'A%';
-- 3
SELECT Ciudad, Contacto as 'Nombre y Apellido', Titulo as Puesto  FROM emarket.clientes
where Ciudad = 'Madrid';
-- 4
SELECT * FROM emarket.facturas
where FacturaID between 10000 and 10500;
-- 5 
SELECT * FROM emarket.facturas
where (FacturaID between 10000 and 10500) or ClienteID like 'B%';
-- 6
SELECT * FROM emarket.facturas
where CiudadEnvio = 'Vancouver' or EnvioVia = 3;
-- 7  iD es 5
SELECT * FROM emarket.empleados
where Apellido like '%bu%';
-- 8 Existen facturas
SELECT * FROM emarket.facturas
where EmpleadoID = 5;
