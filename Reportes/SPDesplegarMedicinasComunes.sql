CREATE DEFINER=`root`@`localhost` PROCEDURE `SPDesplegarMedicinasComunes`(
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

SELECT CM.NombreGenerico, COUNT(MR.MedicamentoRecetaID) as vecesRecetado
FROM CatalogoMedicamento CM
LEFT OUTER JOIN MedicamentoEnReceta MR ON MR.CatalogMedID = CM.CatalogMedID
JOIN Receta R ON R.RecetaID = MR.RecetaID
WHERE R.Fecha BETWEEN p_date1 AND p_date2
GROUP BY CM.NombreGenerico
ORDER BY vecesRecetado DESC;

END