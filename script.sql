--Creamos la base de datos
CREATE DATABASE blog;
--Nos conectamos a la base de datos
\c blog
--estamos dentro de la base de datos prompt
--creamos la tabla
--Primero deben ir las entidades fuertes: las que no requieren de otro para poder existir
--Luego deben ir las entidades secundarias: las que son dependientes/hijas de las primeras entidades
---Creamos la estrucutura
CREATE TABLE usuario(
    Id INTEGER PRIMARY KEY,
    email VARCHAR(40));

CREATE TABLE post(
    Id INTEGER PRIMARY KEY,
    usuario_id INTEGER, 
    titulo VARCHAR(40),
    fecha DATE,
    FOREIGN KEY (usuario_id) REFERENCES
    usuario(id)
    );
CREATE TABLE comentario(
    Id INTEGER PRIMARY KEY,
    post_id INTEGER, 
    usuario_id INTEGER, 
    texto VARCHAR(40),
    fecha DATE,
    FOREIGN KEY (post_id) REFERENCES
    post(id),
    FOREIGN KEY (usuario_id) REFERENCES
    usuario(id)
    );
    
\copy usuario FROM '/home/sixtolio/Escritorio/Proyectos_JS/Modulo5/Grupal/usuario.csv' csv HEADER;


\copy post FROM '/home/sixtolio/Escritorio/Proyectos_JS/Modulo5/Grupal/post.csv' csv HEADER;


-- Seleccionar el correo, id y título de todos los post publicados por el usuario 5.


SELECT * FROM post WHERE usuario_id = 5;

