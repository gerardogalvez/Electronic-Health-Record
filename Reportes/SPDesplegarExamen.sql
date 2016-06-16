CREATE DEFINER=`root`@`localhost` PROCEDURE `SPDesplegarExamen`(
IN p_examenID INT
)
BEGIN

SELECT CONCAT(P.Nombres, ' ', P.Apellidos) AS Paciente, M.Nombre AS Medico, CE.NombreExamen, EL.Fecha
FROM Paciente P, Medico M, Consulta C, ExamenLab EL, catalogoExamenes CE
WHERE C.pacienteID = P.pacienteID 
	AND C.medicoID = M.medicoID 
	AND EL.consultaID = C.consultaID 
	AND CE.ExamenCatalogoID = EL.ExamenCatalogoID
	AND EL.ExamenLabID = p_examenID;

SELECT CR.Nombre, R.Valor, CR.ValorMinimo, CR.ValorMaximo, R.Anormal
FROM catalogoExamenes CE, examenLab E, paciente P, resultados R, catalogoResultados CR, consulta C
WHERE P.pacienteID = C.pacienteID
	AND E.consultaID = C.consultaID 
    AND E.ExamenCatalogoID = CE.ExamenCatalogoID
	AND CE.ExamenCatalogoID = CR.ExamenCatalogoID 
    AND CR.CatalogoResultadosID = R.CatalogoResultadosID
	AND E.ExamenLabID = p_examenID;

END