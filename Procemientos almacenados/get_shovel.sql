CREATE DEFINER=`root`@`localhost` PROCEDURE `getshovel`()
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
BEGIN
    /*
        Procedimiento: sp_get_shovel
        Descripción: Retorna todos los registros de la tabla Shovel en formato JSON array.
    */

    SELECT IFNULL(
        JSON_ARRAYAGG(
            JSON_OBJECT(
                'idShovel',      s.idShovel,
                'serialNumber',  s.SERIALnumber,
                'model',         s.model,
                'brand',         s.brand,
                'status',        s.STATUS,
                'datetime',      s.DATETIME
            )
        ),
        JSON_ARRAY()   
    ) AS JsonResponse
    FROM Shovel s;
END