DELIMITER $$

CREATE DEFINER = `root`@`localhost` PROCEDURE `sp_update_shovel_status`(
    IN p_serialNumber VARCHAR(255),
    IN p_status INT)
BEGIN
    UPDATE shovel 
    SET status = p_status
    WHERE serialNumber = p_serialNumber;
END$$

DELIMITER ;