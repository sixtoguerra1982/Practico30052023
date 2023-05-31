-- 0
DROP DATABASE blog;
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
    usuario_id INTEGER, 
    post_id INTEGER, 
    texto VARCHAR(40),
    fecha DATE,
    
    FOREIGN KEY (usuario_id) REFERENCES
    usuario(id),
    
    FOREIGN KEY (post_id) REFERENCES
    post(id)
    );


--3. Insertar los siguientes registros.  

\copy usuario FROM '/home/sixtolio/Escritorio/Proyectos_JS/Modulo5/Grupal/usuario.csv' csv HEADER;


\copy post FROM '/home/sixtolio/Escritorio/Proyectos_JS/Modulo5/Grupal/post.csv' csv HEADER;

\copy comentario FROM '/home/sixtolio/Escritorio/Proyectos_JS/Modulo5/Grupal/comentario.csv' csv HEADER;


--4 Seleccionar el correo, id y título de todos los post publicados por el usuario 5.

SELECT * FROM post WHERE usuario_id = 5;

--5 Listar el correo, id y el detalle de todos los comentarios 
--que no hayan sido realizados por el usuario con email ​usuario06@hotmail.com​

SELECT u.id as user_id, u.email, c.id, c.texto FROM comentario AS c INNER JOIN usuario AS u ON c.usuario_id = u.id 
WHERE u.id <> 6;




--6. Listar los usuarios que no han publicado ningún post. 
-- SELECT * FROM post JOIN usuario ON post.usuario_id = usuario.id;

SELECT * FROM usuario FULL JOIN post ON usuario.id = post.usuario_id WHERE post.usuario_id IS NULL;




