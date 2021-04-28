
CREATE SCHEMA IF NOT EXISTS `Caso_spotify` DEFAULT CHARACTER SET utf8 ;
USE `Caso_spotify` ;


CREATE TABLE IF NOT EXISTS `Caso_spotify`.`Suscripcion` (
  `idSuscripcion` INT NOT NULL,
  `Fecha_suscripcion` DATE NULL,
  `Fecha_renovacion` DATE NULL,
  `Forma_pago` TINYINT NULL,
  `tipo_suscripcion` TINYINT NULL,
  PRIMARY KEY (`idSuscripcion`));
  
CREATE TABLE IF NOT EXISTS `Caso_spotify`.`USUARIO` (
  `idUSUARIO` INT NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `fecha_nacimiento` DATE NULL,
  `sexo` VARCHAR(45) NULL,
  `codigo_pastal` INT NULL,
  `Pais` VARCHAR(100) NULL,
  `Suscripcion_idSuscripcion` INT NOT NULL,
  PRIMARY KEY (`idUSUARIO`),
  INDEX `fk_USUARIO_Suscripcion_idx` (`Suscripcion_idSuscripcion` ASC) ,
  CONSTRAINT `fk_USUARIO_Suscripcion`
    FOREIGN KEY (`Suscripcion_idSuscripcion`)
    REFERENCES `Caso_spotify`.`Suscripcion` (`idSuscripcion`)
    );

CREATE TABLE IF NOT EXISTS `Caso_spotify`.`Play_list` (
  `idPlay_list` INT NOT NULL,
  `Titulo_play_list` VARCHAR(100) NULL,
  `Num_canciones` INT NULL,
  `fecha_creacion` DATE NULL,
  `USUARIO_idUSUARIO` INT NOT NULL,
  `Estado_play_list` TINYINT NULL,
  PRIMARY KEY (`idPlay_list`),
  INDEX `fk_Play_list_USUARIO1_idx` (`USUARIO_idUSUARIO` ASC) ,
  CONSTRAINT `fk_Play_list_USUARIO1`
    FOREIGN KEY (`USUARIO_idUSUARIO`)
    REFERENCES `Caso_spotify`.`USUARIO` (`idUSUARIO`)
  );



CREATE TABLE IF NOT EXISTS `Caso_spotify`.`artista` (
  `idartista` INT NOT NULL,
  `nombre_Artista` VARCHAR(45) NULL,
  `imagen_Art` VARCHAR(100) NULL,
  PRIMARY KEY (`idartista`));



CREATE TABLE IF NOT EXISTS `Caso_spotify`.`Pais` (
  `idPais` INT NOT NULL,
  `Nombre_Pais` VARCHAR(45) NULL,
  PRIMARY KEY (`idPais`));

CREATE TABLE IF NOT EXISTS `Caso_spotify`.`Discografica` (
  `idDiscografica` INT NOT NULL,
  `Nombre` VARCHAR(100) NULL,
  `Pais_idPais` INT NOT NULL,
  PRIMARY KEY (`idDiscografica`),
  INDEX `fk_Discografica_Pais1_idx` (`Pais_idPais` ASC) ,
  CONSTRAINT `fk_Discografica_Pais1`
    FOREIGN KEY (`Pais_idPais`)
    REFERENCES `Caso_spotify`.`Pais` (`idPais`)
   );

CREATE TABLE IF NOT EXISTS `Caso_spotify`.`Albumnes` (
  `idAlbumnes` INT NOT NULL,
  `Titulo` VARCHAR(100) NULL,
  `anio_publicacion` INT NULL,
  `Imagen` VARCHAR(100) NULL,
  `artista_idartista` INT NOT NULL,
  `Discografica_idDiscografica` INT NOT NULL,
  PRIMARY KEY (`idAlbumnes`),
  INDEX `fk_Albumnes_artista1_idx` (`artista_idartista` ASC) ,
  INDEX `fk_Albumnes_Discografica1_idx` (`Discografica_idDiscografica` ASC) ,
  CONSTRAINT `fk_Albumnes_artista1`
    FOREIGN KEY (`artista_idartista`)
    REFERENCES `Caso_spotify`.`artista` (`idartista`),
  CONSTRAINT `fk_Albumnes_Discografica1`
    FOREIGN KEY (`Discografica_idDiscografica`)
    REFERENCES `Caso_spotify`.`Discografica` (`idDiscografica`)
   );



CREATE TABLE IF NOT EXISTS `Caso_spotify`.`CANCIONES` (
  `idCANCIONES` INT NOT NULL,
  `titulo` VARCHAR(100) NULL,
  `duracion` INT NULL,
  `numero_vec_escuchada` INT NULL,
  `num_likes` INT NULL,
  `Play_list_idPlay_list` INT NOT NULL,
  `Albumnes_idAlbumnes` INT NOT NULL,
  PRIMARY KEY (`idCANCIONES`),
  INDEX `fk_CANCIONES_Play_list1_idx` (`Play_list_idPlay_list` ASC) ,
  INDEX `fk_CANCIONES_Albumnes1_idx` (`Albumnes_idAlbumnes` ASC) ,
  CONSTRAINT `fk_CANCIONES_Play_list1`
    FOREIGN KEY (`Play_list_idPlay_list`)
    REFERENCES `Caso_spotify`.`Play_list` (`idPlay_list`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CANCIONES_Albumnes1`
    FOREIGN KEY (`Albumnes_idAlbumnes`)
    REFERENCES `Caso_spotify`.`Albumnes` (`idAlbumnes`)
 );

CREATE TABLE IF NOT EXISTS `Caso_spotify`.`GENEROS` (
  `idGENEROS` INT NOT NULL,
  `Titulo` VARCHAR(100) NULL,
  `CANCIONES_idCANCIONES` INT NOT NULL,
  PRIMARY KEY (`idGENEROS`),
  INDEX `fk_GENEROS_CANCIONES1_idx` (`CANCIONES_idCANCIONES` ASC) ,
  CONSTRAINT `fk_GENEROS_CANCIONES1`
    FOREIGN KEY (`CANCIONES_idCANCIONES`)
    REFERENCES `Caso_spotify`.`CANCIONES` (`idCANCIONES`)
 );




CREATE TABLE IF NOT EXISTS `Caso_spotify`.`Tajeta` (
  `idTajeta` INT NOT NULL,
  `Marca_tarjeta` VARCHAR(45) NULL,
  `ultimo_dig` INT NULL,
  `Fecha_vencimiento` DATE NULL,
  `USUARIO_idUSUARIO` INT NOT NULL,
  PRIMARY KEY (`idTajeta`),
  INDEX `fk_Tajeta_USUARIO1_idx` (`USUARIO_idUSUARIO` ASC) ,
  CONSTRAINT `fk_Tajeta_USUARIO1`
    FOREIGN KEY (`USUARIO_idUSUARIO`)
    REFERENCES `Caso_spotify`.`USUARIO` (`idUSUARIO`)
 );




CREATE TABLE IF NOT EXISTS `Caso_spotify`.`Tranferencia` (
  `idTranferencia` INT NOT NULL,
  `CBU` INT NULL,
  `Alias` VARCHAR(100) NULL,
  `USUARIO_idUSUARIO` INT NOT NULL,
  PRIMARY KEY (`idTranferencia`),
  INDEX `fk_Tranferencia_USUARIO1_idx` (`USUARIO_idUSUARIO` ASC) ,
  CONSTRAINT `fk_Tranferencia_USUARIO1`
    FOREIGN KEY (`USUARIO_idUSUARIO`)
    REFERENCES `Caso_spotify`.`USUARIO` (`idUSUARIO`)
   );

