CREATE DEFINER=`root`@`localhost` PROCEDURE `SPDesplegarMedicinaPaciente`(
IN p_pacienteID INT
)
BEGIN

SELECT CONCAT(P.Nombres, ' ', P.Apellidos) AS Paciente, COUNT(MR.MedicamentoRecetaID) AS 'Medicamentos tomando'
FROM Paciente P, Consulta C, Receta R, MedicamentoEnReceta MR
WHERE P.PacienteID = C.PacienteID 
	  AND R.ConsultaID = C.ConsultaID 
      AND R.RecetaID = MR.RecetaID
      AND curdate() BETWEEN R.Fecha AND date_add(R.Fecha, INTERVAL MR.Dias DAY)
      AND P.PacienteID = p_pacienteID;

SELECT CM.NombreGenerico, R.Fecha, MR.Dias
FROM CatalogoMedicamento CM, Receta R, MedicamentoEnReceta MR, Paciente P, Consulta C
WHERE P.PacienteID = C.PacienteID 
	  AND R.ConsultaID = C.ConsultaID 
      AND R.RecetaID = MR.RecetaID
      AND MR.CatalogMedID = CM.CatalogMedID
      AND curdate() BETWEEN R.Fecha AND date_add(R.Fecha, INTERVAL MR.Dias DAY)
      AND P.PacienteID = p_pacienteID;

END