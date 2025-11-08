DELIMITER $$

CREATE DEFINER = `root`@`localhost` PROCEDURE `sp_insert_shovel`(
    IN p_serialNumber VARCHAR(255)
    IN p_model VARCHAR(255)
    IN p_brand VARCHAR(255)
    IN p_status INT
)
BEGIN
    INSERT INTO shovel (serialNumber, model, brand, status)
    VALUES (p_serialNumber, p_model, p_brand, p_status);   
END$$

DELIMITER ;