-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         12.0.2-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura para tabla sistemagestion.image
CREATE TABLE IF NOT EXISTS `image` (
  `idImage` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(5000) DEFAULT NULL,
  `rawName` varchar(250) DEFAULT NULL,
  `dateTimePic` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idImage`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla sistemagestion.incident
CREATE TABLE IF NOT EXISTS `incident` (
  `idIncident` int(11) NOT NULL AUTO_INCREMENT,
  `dateTime` timestamp NULL DEFAULT current_timestamp(),
  `description` varchar(255) DEFAULT NULL,
  `observation` varchar(250) DEFAULT NULL,
  `idUser` int(11) DEFAULT NULL,
  `idShovel` int(11) DEFAULT NULL,
  `idStatusIncident` int(11) DEFAULT NULL,
  `idImage` int(11) DEFAULT NULL,
  PRIMARY KEY (`idIncident`),
  KEY `fk_incident_user` (`idUser`),
  KEY `fk_incident_shovel` (`idShovel`),
  KEY `fk_incident_status` (`idStatusIncident`),
  KEY `fk_incident_image` (`idImage`),
  CONSTRAINT `fk_incident_image` FOREIGN KEY (`idImage`) REFERENCES `image` (`idImage`),
  CONSTRAINT `fk_incident_shovel` FOREIGN KEY (`idShovel`) REFERENCES `shovel` (`idShovel`),
  CONSTRAINT `fk_incident_status` FOREIGN KEY (`idStatusIncident`) REFERENCES `statusincident` (`idStatus`),
  CONSTRAINT `fk_incident_user` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla sistemagestion.shovel
CREATE TABLE IF NOT EXISTS `shovel` (
  `idShovel` int(11) NOT NULL AUTO_INCREMENT,
  `serialNumber` varchar(100) DEFAULT NULL,
  `model` varchar(200) DEFAULT NULL,
  `brand` varchar(200) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `dateTime` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idShovel`),
  KEY `fk_shovel_status` (`status`),
  CONSTRAINT `fk_shovel_status` FOREIGN KEY (`status`) REFERENCES `statusshovel` (`idStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla sistemagestion.statusincident
CREATE TABLE IF NOT EXISTS `statusincident` (
  `idStatus` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`idStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla sistemagestion.statusshovel
CREATE TABLE IF NOT EXISTS `statusshovel` (
  `idStatus` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `operation` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla sistemagestion.user
CREATE TABLE IF NOT EXISTS `user` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varbinary(512) NOT NULL,
  `password_salt` varbinary(512) NOT NULL,
  `idUserType` int(11) DEFAULT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_user_usertype` (`idUserType`),
  CONSTRAINT `fk_user_usertype` FOREIGN KEY (`idUserType`) REFERENCES `usertype` (`idUserType`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla sistemagestion.usertype
CREATE TABLE IF NOT EXISTS `usertype` (
  `idUserType` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `permissions` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idUserType`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para procedimiento sistemagestion.getshovel
DELIMITER //
CREATE PROCEDURE `getshovel`()
BEGIN
    /*
        Procedimiento: sp_get_shovels
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
END//
DELIMITER ;

-- Volcando estructura para procedimiento sistemagestion.get_shovel
DELIMITER //
CREATE PROCEDURE `get_shovel`()
BEGIN
    SELECT JSON_OBJECT('JsonResponse', JSON_ARRAYAGG(lista.Shovels)) AS JsonResponse
    FROM (
        SELECT JSON_OBJECT(
            'idShovel',      s.idShovel,
            'serialNumber',  s.SERIALnumber,
            'model',         s.model,
            'brand',         s.brand,
            'status',        s.STATUS,
            'datetime',      s.DATETIME
        ) AS Shovels
        FROM Shovel s
    ) AS lista;
END//
DELIMITER ;

-- Volcando estructura para procedimiento sistemagestion.get_shovel_by_id
DELIMITER //
CREATE PROCEDURE `get_shovel_by_id`(
	IN `idShovel` INT
)
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
    WHERE s.idShovel = idShovel;
END//
DELIMITER ;

-- Volcando estructura para procedimiento sistemagestion.sp_delete_shovel
DELIMITER //
CREATE PROCEDURE `sp_delete_shovel`(
    IN p_serialNumber VARCHAR(255)
)
BEGIN
    IF EXISTS (SELECT 1 FROM incident WHERE idShovel = (SELECT idShovel FROM shovel WHERE serialNumber = p_serialNumber)) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'No se puede eliminar: la pala tiene incidentes asociados';
    ELSE
        DELETE FROM shovel WHERE serialNumber = p_serialNumber;
    END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento sistemagestion.sp_get_dashboard
DELIMITER //
CREATE PROCEDURE `sp_get_dashboard`()
BEGIN
  /*
    Retorna un único registro con la columna JsonResponse.
    Estructura:
    {
      "JsonResponse": [
        {
          "incidents_status_counts": { ... },
          "incidents_by_month": [ ... ],
          "shovels_status_counts": { ... },
          "shovels_by_brand": [ ... ]
        }
      ]
    }
  */

  SELECT
    JSON_OBJECT(
      'JsonResponse',
      IFNULL(JSON_ARRAYAGG(lista.dashboard), JSON_ARRAY())
    ) AS JsonResponse
  FROM (
    SELECT
      JSON_OBJECT(
        -- ==================== --
        -- count de incidencias --
        -- ==================== --
        'incidents_status_counts',
        (
          SELECT JSON_OBJECT(
            'Abierto',     IFNULL(SUM(idStatusIncident = 1), 0),
            'Aprobado',    IFNULL(SUM(idStatusIncident = 2), 0),
            'Cancelado',   IFNULL(SUM(idStatusIncident = 3), 0),
            'Finalizado',  IFNULL(SUM(idStatusIncident = 4), 0),
            'Total',       IFNULL(COUNT(*), 0)
          )
          FROM incident
        ),

        -- ================================= -- 
        -- count por fecha e incidencias     --
        -- ================================= --
        'incidents_by_month',
        (
          SELECT IFNULL(
            JSON_ARRAYAGG(
              JSON_OBJECT(
                'mes_anio', t.mes_anio,
                'idStatusIncident', t.idStatusIncident,
                'status',
                  CASE t.idStatusIncident
                    WHEN 1 THEN 'Abierto'
                    WHEN 2 THEN 'Aprobado'
                    WHEN 3 THEN 'Cancelado'
                    WHEN 4 THEN 'Finalizado'
                    ELSE 'Desconocido'
                  END,
                'total', t.total
              )
            ),
            JSON_ARRAY()
          )
          FROM (
            SELECT
              DATE_FORMAT(`DATETIME`, '%Y-%m') AS mes_anio,
              idStatusIncident,
              COUNT(*) AS total
            FROM incident
            GROUP BY DATE_FORMAT(`DATETIME`, '%Y-%m'), idStatusIncident
            ORDER BY DATE_FORMAT(`DATETIME`, '%Y-%m') ASC, idStatusIncident ASC
          ) AS t
        ),

        -- ==================== --
        -- count de Palas       --
        -- ==================== --
        'shovels_status_counts',
        (
          SELECT JSON_OBJECT(
            'Online',         IFNULL(SUM(status = 1), 0),
            'Mantenimiento',  IFNULL(SUM(status = 2), 0),
            'Offline',        IFNULL(SUM(status = 3), 0),
            'Total',          IFNULL(COUNT(*), 0)
          )
          FROM shovel
        ),

        -- ============================== --
        -- count de Palas por marca       --
        -- ============================== --
        'shovels_by_brand',
        (
          SELECT IFNULL(
            JSON_ARRAYAGG(
              JSON_OBJECT(
                'brand',  sb.brand,
                'status', sb.status,
                'statusName',
                  CASE sb.status
                    WHEN 1 THEN 'Online'
                    WHEN 2 THEN 'Mantenimiento'
                    WHEN 3 THEN 'Offline'
                    ELSE 'Desconocido'
                  END,
                'total',  sb.total
              )
            ),
            JSON_ARRAY()
          )
          FROM (
            SELECT brand, status, COUNT(*) AS total
            FROM shovel
            GROUP BY brand, status
            ORDER BY brand ASC, status ASC
          ) AS sb
        )
      ) AS dashboard
  ) AS lista;
END//
DELIMITER ;

-- Volcando estructura para procedimiento sistemagestion.sp_get_incidents
DELIMITER //
CREATE PROCEDURE `sp_get_incidents`()
BEGIN
    /*
        Procedimiento: sp_get_incidents
        Descripción: Retorna todos los registros de la tabla incident en formato JSON,
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
    ) AS lista;
END//
DELIMITER ;

-- Volcando estructura para procedimiento sistemagestion.sp_get_incident_by_id
DELIMITER //
CREATE PROCEDURE `sp_get_incident_by_id`(
    IN `p_idINCIDNT` INT
)
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
END//
DELIMITER ;

-- Volcando estructura para procedimiento sistemagestion.sp_get_incident_by_idshovel
DELIMITER //
CREATE PROCEDURE `sp_get_incident_by_idshovel`(
	IN `p_idShovel` INT
)
BEGIN
    /*
        Procedimiento: sp_get_incident_by_idshovel
        Descripción: Retorna los registros de incidents filtrados por idShovel en formato JSON, 
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
        WHERE inc.idShovel = p_idShovel  
    ) AS lista;
END//
DELIMITER ;

-- Volcando estructura para procedimiento sistemagestion.sp_insert_incident
DELIMITER //
CREATE PROCEDURE `sp_insert_incident`(
	IN `p_idUser` INT,
	IN `p_idShovel` INT,
	IN `p_idStatusIncident` INT,
	IN `p_path` VARCHAR(255),
	IN `p_rawname` VARCHAR(255),
	IN `p_datetimepic` VARCHAR(255)
)
BEGIN
    DECLARE v_idImage INT;
    
    -- Primero insertamos en la tabla image
    INSERT INTO image (path, rawname, datetimepic)
    VALUES (p_path, p_rawname, p_datetimepic);
    
    -- Obtenemos el ID generado automáticamente
    SET v_idImage = LAST_INSERT_ID();
    
    -- Luego insertamos en la tabla incident con el FK de image
    INSERT INTO incident (idUser, idShovel, idStatusIncident, idImage)
    VALUES (p_idUser, p_idShovel, p_idStatusIncident, v_idImage);
    
    -- Opcional: retornar el ID del incidente creado
    SELECT LAST_INSERT_ID() AS idIncident, v_idImage AS idImage;
    
END//
DELIMITER ;

-- Volcando estructura para procedimiento sistemagestion.sp_insert_shovel
DELIMITER //
CREATE PROCEDURE `sp_insert_shovel`(
    IN p_serialNumber VARCHAR(255),
    IN p_model VARCHAR(255),
    IN p_brand VARCHAR(255),
    IN p_status INT
)
BEGIN
    INSERT INTO shovel (serialNumber, model, brand, status)
    VALUES (p_serialNumber, p_model, p_brand, p_status);   
END//
DELIMITER ;

-- Volcando estructura para procedimiento sistemagestion.sp_update_incident_borrar
DELIMITER //
CREATE PROCEDURE `sp_update_incident_borrar`(
	IN `p_idIncident` INT,
	IN `p_idStatusIncident` INT,
	IN `p_observation` VARCHAR(255)
)
BEGIN
    UPDATE incident 
    SET 
        observation = p_observation,
        idStatusIncident = p_idStatusIncident
    WHERE idIncident = p_idIncident;
END//
DELIMITER ;

-- Volcando estructura para procedimiento sistemagestion.sp_update_shovel_status
DELIMITER //
CREATE PROCEDURE `sp_update_shovel_status`(
	IN `p_idshovel` VARCHAR(255),
	IN `p_status` INT
)
BEGIN
    UPDATE shovel 
    SET status = p_status
    WHERE idshovel = p_idshovel;  
END//
DELIMITER ;

-- Volcando estructura para procedimiento sistemagestion.sp_uptdate_incidente
DELIMITER //
CREATE PROCEDURE `sp_uptdate_incidente`(
	IN `p_idIncident` INT,
	IN `p_idStatusIncident` INT,
	IN `p_observation` VARCHAR(255),
	IN `p_idshovel` INT,
	IN `p_statusshovel` INT
)
BEGIN
    -- Actualizar incidente
    UPDATE incident 
    SET observation = p_observation,
        idStatusIncident = p_idStatusIncident
    WHERE idIncident = p_idIncident;
    
    -- Actualizar shovel con validación
    IF p_idshovel IS NOT NULL THEN
        -- Si statusshovel es NULL, poner 3 (offline por defecto)
        SET p_statusshovel = IFNULL(p_statusshovel, 3);
        
        -- Validar que sea un status válido (1=disponible, 2=mantenimiento, 3=offline)
        IF p_statusshovel NOT IN (1, 2, 3) THEN
            SET p_statusshovel = 3; -- Si es inválido, poner offline
        END IF;
        
        CALL sp_update_shovel_status(p_idshovel, p_statusshovel);
    END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento sistemagestion.sp_uptdate_incident_observation
DELIMITER //
CREATE PROCEDURE `sp_uptdate_incident_observation`(
    IN p_idIncident INT,
    IN p_observation VARCHAR(255)
)
BEGIN
    -- 1º actualizar los infroamcion 
    UPDATE incident 
    SET observation = p_observation
    WHERE idIncident=p_idIncident;

END//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
