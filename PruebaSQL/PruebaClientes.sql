create database PruebaClientes;

use PruebaClientes;

create table Clientes (
ID INT PRIMARY KEY,
Nombre VARCHAR(30),
Apellido VARCHAR(30),
);

create table Ventas (
Fecha DATE,
Sucursal VARCHAR(50),
Numero_Fac VARCHAR(30),
Importe DECIMAL(18, 2),
Id_cliente INT,
FOREIGN KEY (Id_cliente) REFERENCES Clientes(ID),
);

INSERT INTO Clientes (ID, Nombre, Apellido) VALUES 
(1, 'Carlos' , 'Perez'),
(2, 'Maria', 'Paz'),
(3, 'Juan', 'Martinez'),
(4, 'Luis', 'Petit'),
(5, 'Mario', 'Vargas'),
(6, 'Eduardo', 'Quintero');

SELECT * FROM Clientes;

INSERT INTO Ventas (Fecha, Sucursal, Numero_Fac, Importe, Id_cliente) VALUES
('2024-08-16', 'Sucursal A', 'FAC01', 120000, 1),
('2024-02-25', 'Sucursal B', 'FAC02', 90000, 2),
('2024-06-12', 'Sucursal A', 'FAC03', 150000, 3),
('2024-05-22', 'Sucursal B', 'FAC04', 2000000, 4),
('2024-04-08', 'Sucursal B', 'FAC05', 50000, 5),
('2024-01-23', 'Sucursal A', 'FAC06', 10000, 6);

SELECT * FROM Ventas;

SELECT C.ID, C.NOMBRE, C.Apellido,
SUM(V.Importe) AS TotalCompras
FROM Clientes C
JOIN Ventas V ON C.ID = V.Id_cliente
WHERE V.Fecha >= DATEADD(YEAR, -1,
GETDATE())
GROUP BY C.ID, C.Nombre, C.Apellido
HAVING SUM(V.Importe) > 100000
ORDER BY TotalCompras DESC;



