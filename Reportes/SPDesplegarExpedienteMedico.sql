CREATE DEFINER=`root`@`localhost` PROCEDURE `SPDesplegarExpedienteMedico`(
IN p_medicoID INT
)
BEGIN

SELECT * FROM Medico M WHERE MedicoID = p_medicoID;

SELECT COUNT(C.ConsultaID) AS cantidadConsultas
FROM Consulta C
WHERE C.MedicoID = p_medicoID;

SELECT C.Fecha, CONCAT(P.Nombres, ' ', P.Apellidos) AS Paciente
FROM Consulta C
INNER JOIN Paciente P ON C.PacienteID = P.PacienteID
WHERE C.MedicoID = p_medicoID
ORDER BY C.Fecha DESC;

SELECT COUNT(C.ConsultaID) AS cantidadExamenes
FROM Consulta C
INNER JOIN ExamenLab EL ON EL.ConsultaID = C.ConsultaID
WHERE C.MedicoID = p_medicoID;

SELECT EL.Fecha, CONCAT(P.Nombres, ' ', P.Apellidos) AS Paciente, CE.NombreExamen
FROM Consulta C
INNER JOIN ExamenLab EL ON EL.ConsultaID = C.ConsultaID
INNER JOIN Paciente P ON C.PacienteID = P.PacienteID
INNER JOIN CatalogoExamenes CE ON EL.ExamenCatalogoID = CE.ExamenCatalogoID
WHERE C.MedicoID = p_medicoID
ORDER BY EL.Fecha DESC;

END