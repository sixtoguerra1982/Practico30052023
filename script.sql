-- 0
DROP DATABASE blog;
-- 1.Creamos la base de datos
CREATE DATABASE blog;
-- 1.1 Nos conectamos a la base de datos
\c blog
--estamos dentro de la base de datos prompt
-- 2.creamos la tabla
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

\copy usuario FROM 'C:\Users\56954\Desktop\trabajo\Practico30052023\usuario.csv' csv HEADER;


\copy post FROM 'C:\Users\56954\Desktop\trabajo\Practico30052023\post.csv' csv HEADER;

\copy comentario FROM 'C:\Users\56954\Desktop\trabajo\Practico30052023\comentario.csv' csv HEADER;


--4 Seleccionar el correo, id y título de todos los post publicados por el usuario 5.

SELECT * FROM post WHERE usuario_id = 5;

--5 Listar el correo, id y el detalle de todos los comentarios 
--que no hayan sido realizados por el usuario con email ​usuario06@hotmail.com​

SELECT u.id as user_id, u.email, c.id, c.texto FROM comentario AS c INNER JOIN usuario AS u ON c.usuario_id = u.id 
WHERE u.email <> 'usuario06@hotmail.com';




--6. Listar los usuarios que no han publicado ningún post. 
-- SELECT * FROM post JOIN usuario ON post.usuario_id = usuario.id;

SELECT * FROM usuario FULL JOIN post ON usuario.id = post.usuario_id WHERE post.usuario_id IS NULL;

-- 7. Mostrar todos los post con sus comentarios, incluyendo aquellos que no poseen comentarios
SELECT * FROM post p FULL OUTER JOIN comentario c ON p.id = c.post_id ORDER BY p.id;

-- 8. Listar todos los usuarios que hayan publicado un post en junio
SELECT * FROM usuario INNER JOIN post ON post.usuario_id = usuario.id WHERE fecha BETWEEN '2020-06-01' AND '2020-06-30';


