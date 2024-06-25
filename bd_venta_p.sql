-- Creación de la tabla categorias
CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

-- Creación de la tabla productos
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    categoria_id INT,
    precio DECIMAL(10, 2) NOT NULL,
    imagen VARCHAR(255),
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

-- Creación de la tabla inventarios
CREATE TABLE inventarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    producto_id INT,
    cantidad INT NOT NULL,
    ubicacion VARCHAR(255),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);

-- Inserción de datos en la tabla categorias
INSERT INTO categorias (nombre, descripcion) VALUES
('Audio', 'Productos relacionados con sistemas de sonido'),
('Iluminación', 'Productos relacionados con sistemas de iluminación'),
('Accesorios', 'Accesorios para equipos de audio y video'),
('Instrumentos Musicales', 'Instrumentos musicales electrónicos'),
('Equipos DJ', 'Equipos para DJs profesionales'),
('Proyectores', 'Proyectores y pantallas'),
('Cables y Conectores', 'Cables y conectores profesionales');

-- Inserción de datos en la tabla productos
INSERT INTO productos (nombre, descripcion, categoria_id, precio, imagen) VALUES
('Altavoz Bluetooth', 'Altavoz portátil con Bluetooth y micrófono incorporado', 8, 99.99, 'images/altavoz.jpeg');

-- Inserción de datos en la tabla inventarios
INSERT INTO inventarios (producto_id, cantidad, ubicacion) VALUES
(3, 20, 'Almacén A');
