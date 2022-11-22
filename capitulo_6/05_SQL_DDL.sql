#uso de base de datos USE DATABASE statement

#  SQL DDL (DATA DEFINITION LANGUAJE)

# creación / eliminación de bases de datos CREATE DATEBASE statement

# creación de tablas CREATE TABLE statement

# creación de tablas - RESTRICCIONES
# primary key | no puede tener duplicado y auto incremento
# foreingn key | clave foranea va ser clave primaria en otra tabla
# default | por defecto
# not null | no puede tener el campo vacio
# unique | el dato debe ser unico
# check | debe ser verificado
# constraint | nombre a un primary key, foreingn, etc.

# Modificaciones de tablas ALTER TABLE statement II DROP COLUMN elimina la columna
# Modificaciones de tablas ALTER TABLE statement III MODIFY COLUMN columna modificada
# Modificaciones de tablas ALTER TABLE statement IV ALTER TABLE nuevo nombre a la columna
# Modificaciones de tablas ALTER TABLE statement V ADD , restricciones
# Borrado de tablas DROP TABLE statement, se pierde todos los datos


# Creación de vistas CREATE VIEW statement , creación de una vista. Una vista es una tabla virtual
# que se crea como resultado de una select.
# Modificaciones de vistas CREATE OR REPLACE VIEW statement, modificaciones de la vista
# Eliminaciones de vistas - DROP VIEW statement, sentencia empleada para eliminar la vista

#drop database music;

#crear la base de datos 
create database if not exists music;

#seleccionar la base de datos para su uso
use music;

# crear tablas artista
create table if not exists artist(
id int auto_increment,
name varchar(100),
bio text,
constraint pk_artist primary key(id)
);

# crear tabla album contiene relacion obligatoria con artist
create table if not exists album(
id int auto_increment,
title varchar(150),
released_year int ,
id_artist int not null,
constraint pk_album primary key(id),
constraint fk_album_artist foreign key(id_artist) references artists(id)
);

# crear tabla song contiene relacion obligatoria con album
create table if not exists song(
id int auto_increment,
title varchar(150),
duration int,
num_times_played int,
id_album int not null,
constraint pk_song primary key(id),
constraint fk_song_album foreign key(id_album) references album(id)
);

#crear tabla user
create table if not exists user(
id int auto_increment,
first_name varchar(50),
last_name varchar(50),
nick varchar(50),
email varchar(200),
constraint pk_user primary key(id)
);

# crear tabla playlist
create table if not exists playlist(
id int auto_increment,
title varchar(150),
id_public bit,
constraint pk_playlist primary key(id)
);

# crear relacion user con playlist
create table if not exists user_has_playlist(
id_user int,
id_playlist int,
constraint pk_user_has_playlist primary key(id_user, id_playlist),
constraint fk_user_has_playlist_user foreign key(id_user) references user(id),
constraint fk_user_has_playlist_plalist foreign key(id_playlist) references playlist(id)
);

# crear tabla relacion playlist con song
create table if not exists playlist_has_song(
id_playlist int,
id_song int,
constraint pk_playlist_has_song primary key(id_playlist, id_song),
constraint fk_playlist_has_song_playlist foreign key(id_playlist) references playlist(id),
constraint fk_playlist_has_song_song foreign key(id_song) references song(id)
);

# crear tabla relacion user con artist
create table if not exists user_likes_artist(
id_user int,
id_artist int,
constraint pk_user_likes_artist primary key(id_user, id_artist), 
constraint fk_user_likes_artist_user foreign key(id_user) references user(id),
constraint fk_user_likes_artist_artist foreign key(id_artist) references artist(id)
);

# crear tabla relación user con album
create table if not exists user_likes_album(
id_user int,
id_album int,
constraint pk_user_likes_album primary key(id_user, id_album),
constraint fk_user_likes_album_user foreign key(id_user) references user(id),
constraint fk_user_likes_album_album foreign key(id_album) references album(id)
);

# crear tabla relación user con song
create table if not exists user_likes_song(
id_user int,
id_song int,
constraint pk_user_likes_song primary key(id_user, id_song),
constraint fk_user_likes_song_user foreign key(id_user) references user(id),
constraint kf_user_likes_song_song foreign key(id_song) references song(id) 
);




