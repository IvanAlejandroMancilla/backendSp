-- -- ==================== --
-- -- count de incidencias --
-- -- ==================== --
-- SELECT 
--     SUM(CASE WHEN idStatusIncident = 1 THEN 1 ELSE 0 END) AS `Abierto`,
--     SUM(CASE WHEN idStatusIncident = 2 THEN 1 ELSE 0 END) AS `Aprobado`,
--     SUM(CASE WHEN idStatusIncident = 3 THEN 1 ELSE 0 END) AS `Cancelado`,
--     SUM(CASE WHEN idStatusIncident = 4 THEN 1 ELSE 0 END) AS `Finalizado`,
--     COUNT(*) AS `Total`
-- FROM incident;

-- -- ================================ --
-- --  count por fecha e incidencias   --
-- -- ================================ --
-- SELECT 
--     DATE_FORMAT(DATETIME, '%Y-%m') AS mes_anio,
--     idStatusIncident,
--     COUNT(*) AS total
-- FROM incident
-- GROUP BY DATE_FORMAT(DATETIME, '%Y-%m'), idStatusIncident
-- ORDER BY DATE_FORMAT(DATETIME, '%Y-%m') ASC;

-- -- ==================== --
-- --    count de Palas    --
-- -- ==================== --
-- SELECT 
--     SUM(CASE WHEN status = 1 THEN 1 ELSE 0 END) AS `Online`,
--     SUM(CASE WHEN status = 2 THEN 1 ELSE 0 END) AS `Mantenimiento`,
--     SUM(CASE WHEN status = 3 THEN 1 ELSE 0 END) AS `Offline`,
--     COUNT(*) AS `Total`
-- FROM shovel;

-- -- ============================== --
-- --    count de Palas por marca    --
-- -- ============================== --
-- SELECT 
--   brand, STATUS,
-- FROM shovel
-- GROUP BY brand ASC;
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_dashboard`()
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
END$$

DELIMITER ;
