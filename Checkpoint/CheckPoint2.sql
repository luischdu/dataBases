-- 1 Mostrar la cantidad de usuarios cuyo código de tipo de usuario es 1 (free) , 2 (standard) y 3 (premium).
SELECT idTipoUsuario, count(*)
FROM proyecto_spotify.usuario
group by idTipoUsuario;

-- 2 Listar los álbumes que poseen la letra Z en su título.

SELECT titulo FROM proyecto_spotify.album
WHERE titulo like ('%z%');

-- 3) Listar la cantidad de canciones que posee por usuario en sus playlist y su promedio, la cantidad maxima
-- y la cantidad minima

SELECT  idusuario , sum(cantcanciones) as cantidad , avg(cantcanciones) as promedio , 
max(cantcanciones) as maximo , min(cantcanciones) as min FROM playlist
GROUP BY idusuario;

-- 4 Mostrar la playlist que tiene más canciones.
SELECT titulo
FROM proyecto_spotify.playlist
order by cantcanciones desc
limit 1;

-- 5 Listar los 10 usuarios más jóvenes.

SELECT nombreusuario, nyap, fecha_nac FROM proyecto_spotify.usuario
order by fecha_nac desc
limit 10;

-- 6 Listar los 10 usuarios más longevos.

SELECT nombreusuario, nyap, fecha_nac FROM proyecto_spotify.usuario
order by fecha_nac asc
limit 10;

-- 7  Listar las 5 canciones con más likes, ordenadas descendentemente.

SELECT titulo FROM proyecto_spotify.cancion
order by cantlikes desc
limit 5;

--  8) Generar un reporte de todos los artistas ordenados alfabeticamente-----------------------------------------------------
select * from artista group by Nombre ASC;

-- 9) Listar por pais la cantidad de usuarios que posee 
select count(*) as cantidad, pais_idPais as ID_Pais from usuario group by Pais_idPais;


-- 10 )Listar la ultima fecha de creacion de una playlist cuyo titulo incluya una A
select max(Fechacreacion) as ultimafecha, titulo from playlist where titulo like "%a%";
-- -------------------------------------------------------------------------------------------
-- 11) Listar de las passwords historicas, las 3 mas utilizadas, cuantas veces se utilizaron y la primera fecha
-- que se utilizo y la ultima 
 select password, count(*) as cantidad, min(Fecha) as Primerafecha , max(Fecha) as UltimaFecha 
 from passwordxusuario group by Password order by cantidad DESC LIMIT 3;


-- 12) Insert un usuario nuevo, con los siguientes datos tener en cuenta las relaciones
-- insert into usuario values ("Evangelina Gomez",
insert into usuario values (20,"miusuariodespotify@gmail.com","Evangelina Gomez",'1995-11-15',"F","B1429ATF","S1234m",1,3);
select * from usuario;


-- 13) Insertar un nuevo metodo de pago, que sea QR, y luego modificar todos los usuarios que tienen como metodo
-- de pago en efectivo por el nuevo metodo QR
select * from tipoformaPago;
insert into tipoformapago values (5,"QR");
update datospagoxusuario set idTipoFormaPago = 5 where idTipoFormaPago = 1;

-- 14) Eliminar el genero tipo trap
select * from genero;
delete from genero where idGenero=12;

-- 15 Generar un listado de los países con la cantidad de discográficas que posee cada uno, utilizando el código de país.
SELECT idPais as CodigoPais, count(*) as 'Cantidad de disqueras' FROM proyecto_spotify.discografica
group by idPais;

-- 16  Listar por género la cantidad de canciones, solo utilizar el codigo de género.

SELECT IdGenero, count(*) as 'Cantidad de canciones por genero'
FROM proyecto_spotify.generoxcancion
group by IdGenero;

-- 17  Listar la canción de menor duración

SELECT titulo as 'Canción de menor duración' FROM proyecto_spotify.cancion
order by duracion asc
limit 1;

-- 18 Listar las 5 canciones de mayor duración.

SELECT titulo as 'Top 5 de mayor duración' FROM proyecto_spotify.cancion
order by duracion desc
limit 5;

-- 19 Listar todas las tarjetas cuyo vencimiento sea este año.

SELECT * FROM proyecto_spotify.datospagoxusuario
where (idTipoFormaPago = 2 or idTipoFormaPago = 3) and AnioCaduca = 21;

-- 20 Listar a todos los artistas que no tengan imagen, ordenados alfabéticamente.

SELECT * FROM proyecto_spotify.artista
where imagen is null
order by Nombre;




