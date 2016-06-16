CREATE DEFINER=`root`@`localhost` PROCEDURE `SPDesplegarExpedientePaciente`(
IN p_pacienteID INT
)
BEGIN

SELECT * FROM Paciente P WHERE PacienteID = p_pacienteID;

SELECT COUNT(C.ConsultaID) AS cantidadConsultas
FROM Consulta C
WHERE C.PacienteID = p_pacienteID;

SELECT C.Fecha, M.Nombre AS Medico
FROM Consulta C
INNER JOIN Medico M ON C.MedicoID = M.MedicoID
WHERE C.PacienteID = p_pacienteID
ORDER BY C.Fecha DESC;

SELECT COUNT(C.ConsultaID) AS cantidadExamenes
FROM Consulta C
INNER JOIN ExamenLab EL ON EL.ConsultaID = C.ConsultaID
WHERE C.PacienteID = p_pacienteID;

SELECT EL.Fecha, M.Nombre AS Medico, CE.NombreExamen
FROM Consulta C
INNER JOIN ExamenLab EL ON EL.ConsultaID = C.ConsultaID
INNER JOIN Medico M ON C.MedicoID = M.MedicoID
INNER JOIN CatalogoExamenes CE ON EL.ExamenCatalogoID = CE.ExamenCatalogoID
WHERE C.PacienteID = p_pacienteID
ORDER BY EL.Fecha DESC;

SELECT 
    C.Fecha AS 'Fecha de consulta',
    C.Altura,
    C.Peso,
    CONCAT(ROUND((C.Peso/POWER(C.Altura, 2)), 3), ' ', 'kg/m^2') AS IMC
FROM Paciente P, Consulta C
WHERE P.pacienteID = C.pacienteID
AND P.pacienteID = p_pacienteID
ORDER BY C.Fecha DESC;

END