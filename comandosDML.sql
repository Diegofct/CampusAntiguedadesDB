-- Inserción de Roles
INSERT INTO Roles (nombreRol) VALUES 
    ('Administrador'),
    ('Vendedor'),
    ('Comprador'),
    ('Curador'),
    ('Asistente'),
    ('Historiador'),
    ('Restaurador'),
    ('Coleccionista'),
    ('Investigador'),
    ('Consultor');

-- Inserción de Usuarios
INSERT INTO Usuarios (nombre, email, contraseña, idRol) VALUES 
    ('Carlos Mendoza', 'carlos.mendoza@example.com', 'contraseña123', 1),
    ('Laura García', 'laura.garcia@example.com', 'miContraseña!2024', 2),
    ('Juan Pérez', 'juan.perez@example.com', 'password2024', 3),
    ('Ana López', 'ana.lopez@example.com', 'pass1234', 4),
    ('Miguel Rodríguez', 'miguel.rodriguez@example.com', 'contraseñaMiguel', 5),
    ('Elena Torres', 'elena.torres@example.com', 'elena2024', 6),
    ('Pablo Fernández', 'pablo.fernandez@example.com', 'pablo@123', 7),
    ('Sofía Martínez', 'sofia.martinez@example.com', 'sofia2024!', 8),
    ('Jorge Gómez', 'jorge.gomez@example.com', 'jorge1234', 9),
    ('Paola Jiménez', 'paola.jimenez@example.com', 'paolaPass', 10);

-- Inserción de Categorías
INSERT INTO Categorías (nombre) VALUES 
    ('Muebles Antiguos'),
    ('Arte'),
    ('Joyería'),
    ('Relojes'),
    ('Cerámica'),
    ('Textiles'),
    ('Libros'),
    ('Armas Antiguas'),
    ('Esculturas'),
    ('Monedas');

-- Inserción de Antigüedades
INSERT INTO Antiguedades (nombre, descripcion, precio, estadoConservacion, idCategoria, estado) VALUES 
    ('Silla Luis XVI', 'Silla de época Luis XVI con tapicería original.', 1200.00, 'Excelente', 1, 'en venta'),
    ('Cuadro de Van Gogh', 'Reproducción de un cuadro famoso de Van Gogh.', 50000.00, 'Muy Bueno', 2, 'en venta'),
    ('Anillo de Esmeraldas', 'Anillo de esmeraldas del siglo XIX.', 8000.00, 'Bueno', 3, 'en venta'),
    ('Reloj de Bolsillo', 'Reloj de bolsillo de plata con grabados.', 1500.00, 'Excelente', 4, 'en venta'),
    ('Jarrón Ming', 'Jarrón Ming de porcelana china.', 25000.00, 'Muy Bueno', 5, 'en venta'),
    ('Tapiz Medieval', 'Tapiz medieval con escenas de caza.', 3000.00, 'Bueno', 6, 'en venta'),
    ('Edición Original de Don Quijote', 'Primera edición de Don Quijote, en español.', 6000.00, 'Excelente', 7, 'en venta'),
    ('Espada de Caballero', 'Espada antigua de caballero del siglo XV.', 12000.00, 'Bueno', 8, 'en venta'),
    ('Busto de mármol', 'Busto de mármol de época romana.', 10000.00, 'Muy Bueno', 9, 'en venta'),
    ('Moneda de Oro', 'Moneda de oro del siglo XVIII.', 5000.00, 'Excelente', 10, 'en venta');

-- Inserción de Fotos
INSERT INTO Fotos (idAntiguedad, url) VALUES 
    (1, 'http://example.com/fotos/silla_antigua_luis_xvi.jpg'),
    (2, 'http://example.com/fotos/reproduccion_van_gogh.jpg'),
    (3, 'http://example.com/fotos/anillo_esmeraldas_siglo_xix.jpg'),
    (4, 'http://example.com/fotos/reloj_bolsillo_plata.jpg'),
    (5, 'http://example.com/fotos/jarron_ming_porcelana.jpg'),
    (6, 'http://example.com/fotos/tapiz_medieval_caza.jpg'),
    (7, 'http://example.com/fotos/edicion_original_don_quijote.jpg'),
    (8, 'http://example.com/fotos/espada_caballero_siglo_xv.jpg'),
    (9, 'http://example.com/fotos/busto_marmol_romano.jpg'),
    (10, 'http://example.com/fotos/moneda_oro_siglo_xviii.jpg');

-- Inserción de Transacciones
INSERT INTO Transacciones (idComprador, idVendedor, idAntiguedad, precio) VALUES 
    (3, 2, 1, 1200.00),
    (7, 1, 2, 50000.00),
    (5, 3, 3, 8000.00),
    (8, 4, 4, 1500.00),
    (6, 5, 5, 25000.00),
    (9, 7, 6, 3000.00),
    (10, 8, 7, 6000.00),
    (4, 9, 8, 12000.00),
    (2, 10, 9, 10000.00),
    (1, 6, 10, 5000.00);

-- Inserción de Consultas
INSERT INTO Consultas (idAntiguedad) VALUES 
    (1),
    (2),
    (3),
    (4),
    (5),
    (6),
    (7),
    (8),
    (9),
    (10);


-- Listar todas las antigüedades disponibles para la venta
SELECT 
    A.nombre AS NombreAntiguedad,
    C.nombre AS Categoria,
    A.precio,
    A.estadoConservacion
FROM 
    Antiguedades A
JOIN 
    Categorías C ON A.idCategoria = C.idCategoria
WHERE 
    A.estado = 'en venta';

-- Buscar antigüedades por categoría y rango de precio
SELECT 
    A.nombre AS NombreAntiguedad,
    A.precio
FROM 
    Antiguedades A
JOIN 
    Categorías C ON A.idCategoria = C.idCategoria
WHERE 
    C.nombre = 'Muebles Antiguos' AND
    A.precio BETWEEN 500 AND 2000
    AND A.estado = 'en venta';

-- Mostrar el historial de ventas de un cliente específico
SELECT 
    A.nombre AS NombreAntiguedad,
    T.fechaTransaccion,
    T.precio,
    U.nombre AS Comprador
FROM 
    Transacciones T
JOIN 
    Antiguedades A ON T.idAntiguedad = A.idAntiguedad
JOIN 
    Usuarios U ON T.idComprador = U.idUsuario
WHERE 
    T.idVendedor = 2; 

-- Obtener el total de ventas realizadas en un periodo de tiempo
SELECT 
    SUM(T.precio) AS TotalVentas
FROM 
    Transacciones T
WHERE 
    T.fechaTransaccion BETWEEN '2024-09-17' AND '2024-09-30';

-- Encontrar los clientes más activos (con más compras realizadas)
SELECT 
    U.nombre AS Cliente,
    COUNT(T.idComprador) AS NumeroCompras
FROM 
    Transacciones T
JOIN 
    Usuarios U ON T.idComprador = U.idUsuario
GROUP BY 
    U.idUsuario
ORDER BY 
    NumeroCompras DESC
LIMIT 10;

-- Listar las antigüedades más populares por número de visitas o consultas
SELECT 
    A.nombre AS NombreAntiguedad,
    COUNT(C.idConsulta) AS NumeroConsultas
FROM 
    Antiguedades A
JOIN 
    Consultas C ON A.idAntiguedad = C.idAntiguedad
GROUP BY 
    A.idAntiguedad
ORDER BY 
    NumeroConsultas DESC
LIMIT 10;

-- Listar las antigüedades vendidas en un rango de fechas específico
SELECT 
    A.nombre AS NombreAntiguedad,
    U.nombre AS Vendedor,
    U2.nombre AS Comprador,
    T.fechaTransaccion,
    T.precio
FROM 
    Transacciones T
JOIN 
    Antiguedades A ON T.idAntiguedad = A.idAntiguedad
JOIN 
    Usuarios U ON T.idVendedor = U.idUsuario
JOIN 
    Usuarios U2 ON T.idComprador = U2.idUsuario
WHERE 
    T.fechaTransaccion BETWEEN '2024-09-17' AND '2024-09-30';

-- Obtener un informe de inventario actual
SELECT 
    C.nombre AS Categoria,
    COUNT(A.idAntiguedad) AS CantidadArticulos
FROM 
    Antiguedades A
JOIN 
    Categorías C ON A.idCategoria = C.idCategoria
WHERE 
    A.estado = 'en venta'
GROUP BY 
    C.nombre;
