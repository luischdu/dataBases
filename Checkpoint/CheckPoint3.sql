-- 11 Generar un reporte por género e informar la cantidad de canciones que posee. 
-- Si una canción tiene más de un género, debe ser incluida en la cuenta de cada uno de esos géneros.
SELECT genero.idGenero, genero, count(titulo) as 'Cantidad de canciones'  FROM proyecto_spotify.genero
JOIN  generoxcancion on genero.idGenero = generoxcancion.idGenero
JOIN cancion on cancion.idCancion = generoxcancion.idCancion
group by Genero
order by genero.idGenero;


-- 12 

SELECT titulo as 'Nombre Playlist', descripcion as 'Estado', nombreusuario as 'Usuario', Fechaeliminada FROM proyecto_spotify.playlist
JOIN usuario on usuario.idUsuario = playlist.idusuario
JOIN estadoplaylist on estadoplaylist.idEstadoPlaylist = playlist.idestado
WHERE idestado = 2
order by Fechaeliminada desc;

-- 13

SELECT tipousuario.TipoUsuario as 'Tipo de Usuario', count(nombreusuario) as 'Cantidad de Usuarios'
FROM proyecto_spotify.tipousuario
JOIN proyecto_spotify.usuario on tipousuario.idTipoUsuario = usuario.idTipoUsuario
group by tipousuario.TipoUsuario;

-- 14 
SELECT TipoUsuario, count(*) 'Cantidad de usuarios que se suscribieron'
FROM proyecto_spotify.suscripcion
JOIN tipousuario on suscripcion.IdTipoUsuario = tipousuario.idTipoUsuario
where FechaInicio between '2020-01-01' and '2020-12-31'
group by TipoUsuario;

-- 15 

SELECT album.titulo as Album, discografica.nombre as Discografica, cancion.titulo 
as 'Nombre cancion', cancion.cantreproduccion as 'Cantidad Max. de Reproducciones'
FROM proyecto_spotify.album
INNER JOIN discografica on album.iddiscografica = discografica.idDiscografica
INNER JOIN cancion on album.idAlbum = cancion.IdAlbum
order by cantreproduccion desc
limit 1;

-- 16
SELECT playlist.titulo as 'Playlist Users Argentina', cancion.titulo as 'Canciones Users Argentina' 
FROM proyecto_spotify.playlist
INNER JOIN playlistxcancion on playlist.idPlaylist = playlistxcancion.idPlaylist
INNER JOIN cancion on cancion.idCancion = playlistxcancion.Idcancion
INNER JOIN usuario on playlist.idusuario = usuario.idUsuario
INNER JOIN pais on usuario.Pais_idPais = pais.idPais
WHERE pais.idPais = 1

