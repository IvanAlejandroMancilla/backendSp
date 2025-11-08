DELIMITER $$

CREATE DEFINER = `root`@`localhost` PROCEDURE `sp_insert_incident`(
    IN p_idUser INT,
    IN p_idShovel INT,
    IN p_idStatusIncident INT,
    IN p_path VARCHAR(255),
    IN p_rawname VARCHAR(255),
    IN p_datetimepic VARCHAR(255)
)
BEGIN
    DECLARE v_idImage INT;
    
    -- 1º insertar en la tabla image
    INSERT INTO image (path, rawname, datetimepic)
    VALUES (p_path, p_rawname, p_datetimepic);
    
    -- asignar ID generado automáticamente
    SET v_idImage = LAST_INSERT_ID();
    
    -- 2º insertar en la tabla incident con el FK de image
    INSERT INTO incident (idUser, idShovel, idStatusIncident, idImage)
    VALUES (p_idUser, p_idShovel, p_idStatusIncident, v_idImage);
    
    -- Opcional: retornar el ID del incidente creado
    SELECT LAST_INSERT_ID() AS idIncident, v_idImage AS idImage;
    
END$$

DELIMITER ;