CREATE DEFINER=`root`@`localhost` PROCEDURE `SPAgregarMedico`(
IN p_medicoID INT,
IN p_nombre VARCHAR(50),
IN p_cedula VARCHAR(30),
IN p_telefono VARCHAR(30),
IN p_especialidad VARCHAR(30),
IN p_universidad VARCHAR(30)
)
BEGIN

INSERT INTO Medico
         (
           MedicoID,
		   Nombre,
		   Cedula,
		   Telefono,
		   Especialidad,
		   Universidad
         )
    VALUES 
         ( 
           p_medicoID,
		   p_nombre,
		   p_cedula,
		   p_telefono,
		   p_especialidad,
		   p_universidad                   
         ); 
         
END