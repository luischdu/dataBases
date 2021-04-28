INSERT INTO `caso_spotify`.`pais`
(`idPais`, `Nombre_Pais`)VALUES
(57,"Colombia"),
(54,"Argentina"),
(1,"Estados Unidos");

INSERT INTO `caso_spotify`.`discografica`
(`idDiscografica`,
`Nombre`,
`Pais_idPais`)
VALUES
(1, "Columbia Records", 1);

INSERT INTO `caso_spotify`.`artista`
(`idartista`,
`nombre_Artista`,
`imagen_Art`)
VALUES
(1, "Foster the people", "shorturl.at/drwLQ");
--
INSERT INTO `caso_spotify`.`albumnes`
(`idAlbumnes`,
`Titulo`,
`anio_publicacion`,
`Imagen`,
`artista_idartista`,
`Discografica_idDiscografica`)
VALUES
(1, "Torches", 2011, "shorturl.at/ftFYZ",1, 1);

INSERT INTO `caso_spotify`.`suscripcion`
(`idSuscripcion`,
`Fecha_suscripcion`,
`Fecha_renovacion`,
`Forma_pago`,
`tipo_suscripcion`)
VALUES
(1, "2021-04-08", "2021-05-08", 1, 1);


INSERT INTO `caso_spotify`.`usuario`
(`idUSUARIO`,
`email`,
`password`,
`fecha_nacimiento`,
`sexo`,
`codigo_pastal`,
`Pais`,
`Suscripcion_idSuscripcion`)
VALUES
(1, "pepito@email.com", "holamundo", "1998-09-10", "Masculino", 23523, "Argentina", 1);


INSERT INTO `caso_spotify`.`play_list`
(`idPlay_list`,
`Titulo_play_list`,
`Num_canciones`,
`fecha_creacion`,
`USUARIO_idUSUARIO`,
`Estado_play_list`)
VALUES (1, "Inde", 1, "2021-02-15", 1, 1);



--
INSERT INTO `caso_spotify`.`canciones`
(`idCANCIONES`,
`titulo`,
`duracion`,
`numero_vec_escuchada`,
`num_likes`,
`Play_list_idPlay_list`,
`Albumnes_idAlbumnes`)
VALUES
(1, "Hudini",210, 20, 18, 1, 1);

INSERT INTO `caso_spotify`.`generos`
(`idGENEROS`,
`Titulo`,
`CANCIONES_idCANCIONES`)
VALUES
(1, "Rock-Alternativo", 1);

-- ya insertado arriba--

INSERT INTO `caso_spotify`.`tajeta`
(`idTajeta`,
`Marca_tarjeta`,
`ultimo_dig`,
`Fecha_vencimiento`,
`USUARIO_idUSUARIO`)
VALUES
(1, "Visa", 1234, "2026-09-01", 1);

INSERT INTO `caso_spotify`.`tranferencia`
(`idTranferencia`,
`CBU`,
`Alias`,
`USUARIO_idUSUARIO`)
VALUES
(1, 987654321, "Pepito Peposo", 1);









