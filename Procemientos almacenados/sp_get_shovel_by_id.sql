CREATE DEFINER=`root`@`localhost` PROCEDURE `get_shovel_by_id`(
	IN `id_Shovel` INT
)
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
BEGIN
    /*
        Procedimiento: sp_get_shovel_by_id
        Descripción: Devuelve los registros de la tabla Shovel en formato JSON, diferenciado por id
    */
    SELECT JSON_OBJECT(
        'JsonResponse',
        JSON_OBJECT(
            'idShovel',     s.idShovel,
            'serialNumber', s.SERIALnumber,
            'model',        s.model,
            'brand',        s.brand,
            'status',       s.STATUS,
            'datetime',     s.DATETIME
        )
    ) AS JsonResponse
    --  falta agregar una tabla de estado pala --
    FROM Shovel s
    WHERE s.idShovel = id_Shovel;
END