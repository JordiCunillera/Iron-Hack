CREATE DATABASE IF NOT EXISTS TikTokDB;
USE TikTokDB;

CREATE TABLE IF NOT EXISTS usuarios (
	id_usuario INT NOT NULL UNIQUE,
    usuario VARCHAR(100),
    correo VARCHAR(100),
    fecha_usuario DATE,
    pais VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_usuario)
    );

CREATE TABLE IF NOT EXISTS videos (
	id_video INT NOT NULL UNIQUE,
    titulo_video VARCHAR(100),
    descripcion_video VARCHAR(100),
    fecha_video DATE,
    duracion_video DATETIME,
    PRIMARY KEY (id_video),
    id_usuario INT,
    CONSTRAINT fk_usuario_video
    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)
    );
    
CREATE TABLE IF NOT EXISTS comentarios (
	id_comentario INT NOT NULL UNIQUE,
    texto_comentario VARCHAR(100) NOT NULL,
    fecha_comentario DATE,
    PRIMARY KEY (id_comentario),
    id_video INT,
    id_usuario INT,
    CONSTRAINT fk_video_comentario
    FOREIGN KEY (id_video) REFERENCES videos (id_video),
    CONSTRAINT fk_usuario_comentario
    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario) 
    );
    
CREATE TABLE IF NOT EXISTS likes (
	id_like INT NOT NULL UNIQUE,
    fecha_like DATE,
    PRIMARY KEY (id_like),
    id_video INT,
    id_usuario INT,
    CONSTRAINT fk_video_like
    FOREIGN KEY (id_video) REFERENCES videos (id_video),
    CONSTRAINT fk_usuario_like
    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario) 
    );

CREATE TABLE IF NOT EXISTS seguidores (
	id_seguidor INT NOT NULL UNIQUE,
    fecha_seguimiento DATE,
    PRIMARY KEY (id_seguidor),
    id_seguido INT NOT NULL UNIQUE,
    CONSTRAINT fk_usuarios_seguidor
    FOREIGN KEY (id_seguidor) REFERENCES usuarios (id_usuario),
    CONSTRAINT fk_usuarios_seguido
    FOREIGN KEY (id_seguido) REFERENCES usuarios (id_usuario)
    );

INSERT INTO usuarios (id_usuario, usuario, pais)
VALUES (1, "Jordi", "Cataluña"),
	(2, "Kiren", "Cataluña"),
    (3, "Jacobo", "España");

INSERT INTO videos (id_video, titulo_video, id_usuario)
VALUES (1, "Jordi gana a Jacobo al ajedrez", 1),
	(2, "Kiren va cojo", 2),
    (3, "Jacobo se fuma un piti", 3);

INSERT INTO comentarios (id_comentario, texto_comentario, id_video, id_usuario)
VALUES (1, "Para variar", 1, 2),
	(2, "Parece un zombie", 2, 3),
    (3, "Puro cine", 3, 1);

INSERT INTO likes (id_like, id_video, id_usuario)
VALUES (1, 1, 2),
	(2, 1, 3),
    (3, 1, 1);

INSERT INTO seguidores (id_seguidor, id_seguido)
VALUES (1, 2),
	(2, 3),
    (3, 1);

SELECT * FROM tiktokdb.usuarios;
SELECT * FROM tiktokdb.videos;
SELECT * FROM tiktokdb.comentarios;
SELECT * FROM tiktokdb.likes;
SELECT * FROM tiktokdb.seguidores;

SELECT * FROM usuarios ORDER BY usuario;
SELECT * FROM usuarios WHERE pais="Cataluña";
SELECT * FROM comentarios WHERE fecha_comentario IS NULL;

-- ALTER TABLE videos DROP COLUMN pais;
   
-- DELETE FROM especies;

    