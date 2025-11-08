DELIMITER $$
CREATE DEFINER = `root`@`localhost` PROCEDURE `sp_delete_shovel_V2`(
    IN p_serialNumber VARCHAR(255)
)
BEGIN
    IF EXISTS (SELECT 1 FROM incident WHERE idShovel = (SELECT idShovel FROM shovel WHERE serialNumber = p_serialNumber)) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'No se puede eliminar: la pala tiene incidentes asociados';
    ELSE
        DELETE FROM shovel WHERE serialNumber = p_serialNumber;
    END IF;
END$$
DELIMITER ;