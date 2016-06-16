CREATE DEFINER=`root`@`localhost` PROCEDURE `SPDesplegarReceta`(
IN p_recetaID INT
)
BEGIN

SELECT 
	CONCAT(P.Nombres, ' ', P.Apellidos) AS Paciente,
    M.Nombre AS Medico,
	R.Fecha
FROM Receta R, Consulta C, Paciente P, Medico M
WHERE
	R.RecetaID = p_recetaID
    AND R.ConsultaID = C.ConsultaID
    AND C.PacienteID = P.PacienteID
    AND C.MedicoID = M.MedicoID;
    
SELECT
    CM.NombreGenerico,
    MR.Presentacion,
    CONCAT(MR.dosis, ' ', ' mg') AS Dosis, 
    CONCAT('Tomar cada ', MR.intervalo, ' horas durante ', MR.dias, ' dias.') AS Descripcion
FROM Receta R, MedicamentoEnReceta MR, CatalogoMedicamento CM
WHERE
	R.RecetaID = p_recetaID
    AND MR.recetaID = R.recetaID 
    AND MR.catalogMedID = CM.catalogMedID;

END