CREATE DEFINER=`root`@`localhost` PROCEDURE `SPDesplegarAnormalGral`()
BEGIN

SELECT CE.NombreExamen, CR.Nombre, COUNT(*) AS '# veces anormal'
FROM Resultados R
INNER JOIN ExamenLab EL ON R.ExamenLabID = EL.ExamenLabID
INNER JOIN CatalogoResultados CR ON R.CatalogoResultadosID = CR.CatalogoResultadosID
INNER JOIN CatalogoExamenes CE ON EL.ExamenCatalogoID = CE.ExamenCatalogoID
WHERE R.Anormal IS NOT NULL
GROUP BY CE.NombreExamen, CR.Nombre
ORDER BY '# veces anormal' DESC;

END