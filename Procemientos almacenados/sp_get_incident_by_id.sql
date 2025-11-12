DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_incident_by_id`(
    IN `p_idINCIDNT` INT
)
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
BEGIN
    /*
        Procedimiento: sp_get_incident_by_id
        Descripción: Retorna el  registro  de la tabla de un incident especifico en formato JSON, 
                     incluyendo shovel, imagen, statusshovel y statusincident,
                     usando el formato estándar:
                     SELECT JSON_OBJECT('JsonResponse', JSON_ARRAYAGG(lista.Incidents)) AS JsonResponse
    */

    SELECT 
        JSON_OBJECT(
            'JsonResponse',
            IFNULL(JSON_ARRAYAGG(lista.Incidents), JSON_ARRAY())
        ) AS JsonResponse
    FROM (
        SELECT JSON_OBJECT(
            -- Datos del incidente
            'idINCIDNT',   inc.idIncident,
            'DATETIME',    inc.dateTime,
            'description', inc.description,
            'observation', inc.observation,
            'idUser',      inc.idUser,

            -- Datos shovel
            'shovel', JSON_OBJECT(
                'idShovel',     sh.idShovel,
                'serialNumber', sh.serialNumber,
                'model',        sh.model,
                'brand',        sh.brand,
                'dateTime',     sh.dateTime,
                'status', JSON_OBJECT(
                    'idStatus',    ssh.idStatus,
                    'name',        ssh.name,
                    'description', ssh.description,
                    'operation',   ssh.operation
                )
            ),

            -- Datos imagen
            'image', JSON_OBJECT(
                'idImage',     img.idImage,
                'path',        img.path,
                'rawName',     img.rawName,
                'dateTimePic', img.dateTimePic
            ),

            -- Datos StatusIncident 
            'StatusIncident', JSON_OBJECT(
                'idStatus',    sinc.idStatus,
                'name',        sinc.name,
                'description', sinc.description
            )
        ) AS Incidents
        FROM incident inc
        LEFT JOIN shovel         sh   ON inc.idShovel         = sh.idShovel
        LEFT JOIN image          img  ON inc.idImage          = img.idImage
        LEFT JOIN statusshovel   ssh  ON sh.status            = ssh.idStatus
        LEFT JOIN statusincident sinc ON inc.idStatusIncident = sinc.idStatus
        WHERE inc.idIncident = p_idINCIDNT  

    ) AS lista;
END$$

DELIMITER ;
