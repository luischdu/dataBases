
create schema  if not exists eUniversoLector;

create table socio(
codigo int not null,
DNI int,
Apellido varchar(100),
Nombre varchar(100),
Direccion varchar(200),
localidad varchar(100),
primary key (codigo)
);

create table TelefonoxSocio(
codigo int not null,
NroTelefono varchar(100),
codigo_socio int not null,
primary key (codigo),
foreign key (codigo_socio) references socio (codigo)
);
create table editorial(
codigo int not null,
razon_social varchar(100),
telefono varchar(100),
primary key (codigo)
);

create table autor (
codigo int not null,
Apellido varchar(100),
Nombre varchar(100),
primary key(codigo)
);

create table libro(
codigo int not null,
ISBN varchar(13),
Titulo varchar(200),
Anio_Escrituta date,
codigo_autor int,
Anio_Edicion date,
codigo_editorial int,
primary key (codigo),
foreign key (codigo_autor) references autor (codigo),
foreign key (codigo_editorial) references editorial (codigo)
);

create table prestamo (
codigo int not null,
codigo_socio int,
fecha datetime,
fecha_devolucion date,
fecha_tope date,
primary key (codigo),
foreign key (codigo_socio) references socio (codigo)
);

create table volumen(
codigo int not null,
codigo_libro int,
deteriarado bool,
primary key (codigo),
foreign key (codigo_libro) references libro (codigo)
);
create table pestamoxvolumen(
codigo int not null,
codigo_prestamo int,
codigo_volumen int,
primary key(codigo),
foreign key (codigo_prestamo) references prestamo (codigo),
foreign key (codigo_volumen) references volumen (codigo)

);

