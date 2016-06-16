CREATE DEFINER=`root`@`localhost` PROCEDURE `SPDesplegarExamenesComunes`(
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

SELECT CE.NombreExamen, COUNT(EL.ExamenLabID) AS vecesOrdenado
FROM CatalogoExamenes CE
JOIN ExamenLab EL ON CE.ExamenCatalogoID = EL.ExamenCatalogoID
WHERE EL.Fecha BETWEEN p_date1 AND p_date2
GROUP BY CE.ExamenCatalogoID
ORDER BY vecesOrdenado DESC;

END