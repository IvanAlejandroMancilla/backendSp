DELIMITER $$

CREATE DEFINER = `root`@`localhost` PROCEDURE `sp_uptdate_incident`(
    IN p_idIncident INT,
    IN P_idStatusIncident INT,
    IN p_observation VARCHAR(255)
)
BEGIN
    -- 1º actualizar los infroamcion 
    UPDATE incident 
    SET observation = p_observation,idStatusIncident= P_idStatusIncident
    WHERE idIncident=p_idIncident;

END$$

DELIMITER ;