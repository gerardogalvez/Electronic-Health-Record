CREATE DEFINER=`root`@`localhost` PROCEDURE `SPDesplegarPacientesAnormales`(
IN p_date1 DATE,
IN p_date2 DATE
)
BEGIN

IF p_date1 IS NULL THEN
SET p_date1 = makedate(year(curdate())-1, 1);
END IF;

IF p_date2 IS NULL THEN
SET p_date2 = curdate();
END IF;

SELECT CONCAT(P.Nombres, ' ', P.Apellidos) AS Paciente, EL.Fecha, CE.NombreExamen, CR.Nombre, CR.ValorMinimo, CR.ValorMaximo, R.Valor
FROM Paciente P, ExamenLab EL, CatalogoExamenes CE, CatalogoResultados CR, Resultados R, Consulta C
WHERE P.pacienteID = C.pacienteID 
	  AND EL.ConsultaID = C.ConsultaID 
      AND EL.ExamenCatalogoID = CE.ExamenCatalogoID 
      AND R.ExamenLabID = EL.ExamenLabID 
      AND R.CatalogoResultadosID = CR.CatalogoResultadosID
      AND R.Anormal IS NOT NULL
      AND EL.Fecha BETWEEN p_date1 AND p_date2
ORDER BY Paciente, EL.Fecha;

END