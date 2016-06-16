CREATE DEFINER=`root`@`localhost` PROCEDURE `SPAgregarPaciente`(
IN p_pacienteID INT,
IN p_nombres VARCHAR(30),
IN p_sexo CHAR(1),
IN p_apellidos VARCHAR(30),
IN p_tiposangre VARCHAR(4),
IN p_direccion VARCHAR(50),
IN p_nacimiento DATE
)
BEGIN

INSERT INTO Paciente
         (
           PacienteID, 
           Nombres,
           Sexo,
           Apellidos,
           TipoSangre,
           Direccion,
           Nacimiento
         )
    VALUES 
         ( 
           p_pacienteID,
		   p_nombres,
		   p_sexo,
		   p_apellidos,
		   p_tiposangre,
		   p_direccion,
		   p_nacimiento                    
         ); 

END