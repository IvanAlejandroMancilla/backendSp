-- =============================
-- Usar sps
-- =============================

CALL get_shovel();
CALL get_shovel_by_id(6);

-- =============================
-- lIMPIAR DATOS DE TABLAS
-- =============================

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE image;
TRUNCATE TABLE incident;
TRUNCATE TABLE shovel;
TRUNCATE TABLE statusincident;
TRUNCATE TABLE statusshovel;
TRUNCATE TABLE user;
TRUNCATE TABLE usertype;

SET FOREIGN_KEY_CHECKS = 1;

-- =============================
-- COMPROBAR DATOS EN PALAS
-- =============================
SELECT * FROM usertype;
SELECT * FROM user;
SELECT * FROM statusshovel;
SELECT * FROM shovel;
SELECT * FROM statusincident;
SELECT * FROM image;
SELECT * FROM incident;
