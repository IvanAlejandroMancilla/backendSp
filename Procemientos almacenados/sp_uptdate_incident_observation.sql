CREATE DEFINER = `root`@`localhost` PROCEDURE `sp_uptdate_incident_observation`(
    IN p_idIncident INT,
    IN p_observation VARCHAR(255)
)
BEGIN
    -- 1º actualizar los infroamcion 
    UPDATE incident 
    SET observation = p_observation
    WHERE idIncident=p_idIncident;

END$$

DELIMITER ;