-- =============================
-- Tabla Tipo de Usuario
-- =============================

INSERT INTO UserType (name, description, permissions)
VALUES
('Supervisor de Turno', 'Encargado de supervisar las operaciones en terreno y revisar alertas del estado de las palas.', 'gestión'),
('Técnico de Mantenimiento', 'Responsable de revisar alertas de desgaste y coordinar intervenciones de mantenimiento preventivo.', 'gestión'),
('Operador de Monitoreo', 'Encargado del seguimiento en tiempo real del estado operativo de las palas desde la sala de control.', 'gestión'),
('Administrador del Sistema', 'Gestor principal de usuarios, roles y configuraciones generales del sistema GETS.', 'administración');


-- =============================
-- Tabla Usuario
-- =============================
INSERT INTO User (name, lastName, email, password_hash, password_salt, idUserType)
VALUES
('Gabriel', 'Muñoz', 'gmunoz@example.com', UNHEX('636F6E74726173656E6131'), UNHEX('73616C7431'), 1),
('Camila', 'Reyes', 'creyes@example.com', UNHEX('636F6E74726173656E6132'), UNHEX('73616C7432'), 2),
('Diego', 'Vargas', 'dvargas@example.com', UNHEX('636F6E74726173656E6133'), UNHEX('73616C7433'), 3),
('Valentina', 'López', 'vlopez@example.com', UNHEX('636F6E74726173656E6134'), UNHEX('73616C7434'), 4),
('Tomás', 'Rojas', 'trojas@example.com', UNHEX('636F6E74726173656E6135'), UNHEX('73616C7435'), 1);


-- =============================
-- Tabla Estado de Pala
-- =============================
INSERT INTO StatusShovel (name, description, operation)
VALUES
('Online', 'Pala operativa y disponible para trabajo.', TRUE),
('Mantenimiento', 'Pala en proceso de revisión o reparación.', FALSE),
('Offline', 'Pala fuera de servicio o desconectada del sistema.', FALSE);



-- =============================
-- Tabla Pala
-- =============================
INSERT INTO Shovel (serialNumber, model, brand, status)
VALUES
('SHV-001', 'EX5600-7', 'Hitachi', 1),
('SHV-002', 'PC8000-6', 'Komatsu', 1),
('SHV-003', '7495 HF', 'Caterpillar', 2),
('SHV-004', 'RH340-B', 'Liebherr', 3),
('SHV-005', 'EX8000-6', 'Hitachi', 1),
('SHV-006', 'PC7000-11', 'Komatsu', 2),   
('SHV-007', 'EX3600-6', 'Hitachi', 1),    
('SHV-008', '4100XPC', 'P&H', 2),         
('SHV-009', 'R996-B', 'Liebherr', 3),     
('SHV-010', '7495-ER', 'Caterpillar', 3);  


-- =============================
-- Tabla Estado de Incidentes
-- =============================
INSERT INTO StatusIncident (name, description)
VALUES
('Abierto', 'Incidente detectado y pendiente de revisión.'),
('Aprobado', 'El incidente ha sido analizado o verificado por el equipo técnico.'),
('En Espera', 'Incidente pausado a la espera de confirmación o recursos.'),
('Finalizado', 'Incidente resuelto y validado por el sistema o por mantenimiento.');


-- =============================
-- Tabla Imagen
-- =============================
INSERT INTO Image (path, rawName)
VALUES
('/images/shovels/SHV001_2025-11-01_0830.jpg', 'SHV001_0830'),
('/images/shovels/SHV001_2025-11-01_1000.jpg', 'SHV001_1000'),
('/images/shovels/SHV002_2025-11-01_0815.jpg', 'SHV002_0815'),
('/images/shovels/SHV002_2025-11-01_1200.jpg', 'SHV002_1200'),
('/images/shovels/SHV003_2025-11-02_0910.jpg', 'SHV003_0910'),
('/images/shovels/SHV003_2025-11-02_1530.jpg', 'SHV003_1530'),
('/images/shovels/SHV004_2025-11-02_0715.jpg', 'SHV004_0715'),
('/images/shovels/SHV004_2025-11-02_1100.jpg', 'SHV004_1100'),
('/images/shovels/SHV005_2025-11-03_0945.jpg', 'SHV005_0945'),
('/images/shovels/SHV005_2025-11-03_1400.jpg', 'SHV005_1400'),
('/images/shovels/SHV006_2025-11-03_1700.jpg', 'SHV006_1700'),
('/images/shovels/SHV006_2025-11-03_2300.jpg', 'SHV006_2300'),
('/images/shovels/SHV007_2025-11-04_0615.jpg', 'SHV007_0615'),
('/images/shovels/SHV007_2025-11-04_1145.jpg', 'SHV007_1145'),
('/images/shovels/SHV008_2025-11-04_1730.jpg', 'SHV008_1730'),
('/images/shovels/SHV008_2025-11-04_2355.jpg', 'SHV008_2355'),
('/images/shovels/SHV009_2025-11-05_0700.jpg', 'SHV009_0700'),
('/images/shovels/SHV009_2025-11-05_1030.jpg', 'SHV009_1030'),
('/images/shovels/SHV010_2025-11-05_1500.jpg', 'SHV010_1500'),
('/images/shovels/SHV010_2025-11-05_2000.jpg', 'SHV010_2000'),
('/images/shovels/SHV003_2025-11-06_0830.jpg', 'SHV003_0830'),
('/images/shovels/SHV006_2025-11-06_1215.jpg', 'SHV006_1215'),
('/images/shovels/SHV007_2025-11-06_1330.jpg', 'SHV007_1330'),
('/images/shovels/SHV009_2025-11-06_1545.jpg', 'SHV009_1545'),
('/images/shovels/SHV010_2025-11-06_1800.jpg', 'SHV010_1800'),
('/images/shovels/SHV001_2025-11-07_0600.jpg', 'SHV001_0600'),
('/images/shovels/SHV001_2025-11-07_0900.jpg', 'SHV001_0900'),
('/images/shovels/SHV002_2025-11-07_1030.jpg', 'SHV002_1030'),
('/images/shovels/SHV002_2025-11-07_1330.jpg', 'SHV002_1330'),
('/images/shovels/SHV003_2025-11-07_1500.jpg', 'SHV003_1500'),
('/images/shovels/SHV003_2025-11-07_1730.jpg', 'SHV003_1730'),
('/images/shovels/SHV004_2025-11-07_1930.jpg', 'SHV004_1930'),
('/images/shovels/SHV004_2025-11-07_2130.jpg', 'SHV004_2130'),
('/images/shovels/SHV005_2025-11-08_0630.jpg', 'SHV005_0630'),
('/images/shovels/SHV005_2025-11-08_0830.jpg', 'SHV005_0830'),
('/images/shovels/SHV006_2025-11-08_1000.jpg', 'SHV006_1000'),
('/images/shovels/SHV006_2025-11-08_1400.jpg', 'SHV006_1400'),
('/images/shovels/SHV007_2025-11-08_1600.jpg', 'SHV007_1600'),
('/images/shovels/SHV007_2025-11-08_1830.jpg', 'SHV007_1830'),
('/images/shovels/SHV008_2025-11-08_2100.jpg', 'SHV008_2100'),
('/images/shovels/SHV008_2025-11-08_2300.jpg', 'SHV008_2300'),
('/images/shovels/SHV009_2025-11-09_0700.jpg', 'SHV009_0700'),
('/images/shovels/SHV009_2025-11-09_0930.jpg', 'SHV009_0930'),
('/images/shovels/SHV010_2025-11-09_1130.jpg', 'SHV010_1130'),
('/images/shovels/SHV010_2025-11-09_1530.jpg', 'SHV010_1530'),
('/images/shovels/SHV005_2025-11-10_0700.jpg', 'SHV005_0700'),
('/images/shovels/SHV006_2025-11-10_0915.jpg', 'SHV006_0915'),
('/images/shovels/SHV007_2025-11-10_1200.jpg', 'SHV007_1200'),
('/images/shovels/SHV009_2025-11-10_1445.jpg', 'SHV009_1445'),
('/images/shovels/SHV010_2025-11-10_1745.jpg', 'SHV010_1745'),
('/images/shovels/SHV001_2025-11-11_0600.jpg', 'SHV001_0600'),
('/images/shovels/SHV001_2025-11-11_0830.jpg', 'SHV001_0830'),
('/images/shovels/SHV002_2025-11-11_1030.jpg', 'SHV002_1030'),
('/images/shovels/SHV002_2025-11-11_1230.jpg', 'SHV002_1230'),
('/images/shovels/SHV003_2025-11-11_1400.jpg', 'SHV003_1400'),
('/images/shovels/SHV003_2025-11-11_1600.jpg', 'SHV003_1600'),
('/images/shovels/SHV004_2025-11-11_1800.jpg', 'SHV004_1800'),
('/images/shovels/SHV004_2025-11-11_2000.jpg', 'SHV004_2000'),
('/images/shovels/SHV005_2025-11-12_0630.jpg', 'SHV005_0630'),
('/images/shovels/SHV005_2025-11-12_0830.jpg', 'SHV005_0830'),
('/images/shovels/SHV006_2025-11-12_1000.jpg', 'SHV006_1000'),
('/images/shovels/SHV006_2025-11-12_1200.jpg', 'SHV006_1200'),
('/images/shovels/SHV007_2025-11-12_1400.jpg', 'SHV007_1400'),
('/images/shovels/SHV007_2025-11-12_1600.jpg', 'SHV007_1600'),
('/images/shovels/SHV008_2025-11-12_1800.jpg', 'SHV008_1800'),
('/images/shovels/SHV008_2025-11-12_2000.jpg', 'SHV008_2000'),
('/images/shovels/SHV009_2025-11-13_0700.jpg', 'SHV009_0700'),
('/images/shovels/SHV009_2025-11-13_0930.jpg', 'SHV009_0930'),
('/images/shovels/SHV010_2025-11-13_1130.jpg', 'SHV010_1130'),
('/images/shovels/SHV010_2025-11-13_1330.jpg', 'SHV010_1330'),
('/images/shovels/SHV005_2025-11-13_1530.jpg', 'SHV005_1530'),
('/images/shovels/SHV006_2025-11-13_1730.jpg', 'SHV006_1730'),
('/images/shovels/SHV007_2025-11-13_1930.jpg', 'SHV007_1930'),
('/images/shovels/SHV009_2025-11-13_2130.jpg', 'SHV009_2130'),
('/images/shovels/SHV010_2025-11-13_2330.jpg', 'SHV010_2330');


-- =============================
-- Tabla Incidentes
-- =============================
INSERT INTO Incident (description, observation, idUser, idShovel, idStatusIncident, idImage)
VALUES
('Desgaste leve detectado en diente frontal.', 'Revisión programada para próximo turno.', 1, 1, 1, 1),
('Sensor de temperatura sin respuesta.', 'Se recomienda verificar conexión del sensor.', 2, 2, 2, 2),
('Desalineación visual en cámara lateral.', 'Posible vibración mecánica.', 3, 3, 3, 3),
('Pérdida parcial de visibilidad.', 'Suciedad en lente detectada.', 4, 4, 4, 4),
('Alerta de sobrecalentamiento.', 'Temperatura excede umbral por 15 minutos.', 5, 5, 1, 5),
('Diente ausente detectado.', 'Confirmar físicamente en terreno.', 1, 6, 3, 6),
('Conexión intermitente en cámara 2.', 'Reinicio automático pendiente.', 2, 7, 2, 7),
('Anomalía en lectura de vibración.', 'Nivel por sobre valor nominal.', 3, 8, 3, 8),
('Mantenimiento preventivo registrado.', 'Verificación visual completada.', 4, 9, 4, 9),
('Falsa alarma descartada.', 'Sistema ajustado tras calibración.', 5, 10, 4, 10),
('Error de transmisión.', 'Pérdida de paquete en red local.', 1, 1, 4, 11),
('Diente fisurado detectado.', 'Alerta escalada a supervisor.', 2, 2, 3, 12),
('Verificación manual en curso.', 'Esperando confirmación de mantenimiento.', 3, 3, 2, 13),
('Sin actividad por más de 30 min.', 'Posible apagado no programado.', 4, 4, 2, 14),
('Vibración excesiva detectada.', 'Nivel RMS sobre límite.', 5, 5, 3, 15),
('Desgaste confirmado.', 'Planificar reemplazo.', 1, 6, 4, 16),
('Temperatura normalizada.', 'Incidente cerrado automáticamente.', 2, 7, 4, 17),
('Error recurrente.', 'Se reabre incidente previo.', 3, 8, 2, 18),
('Sin señal por interferencia.', 'Probable obstrucción temporal.', 4, 9, 1, 19),
('Falla eléctrica menor.', 'Cableado revisado.', 5, 10, 2, 20),
('Advertencia por polvo excesivo.', 'Cámara requiere limpieza.', 1, 1, 3, 21),
('Vibración fuera de rango.', 'Envío a mantenimiento.', 2, 2, 4, 22),
('Lectura anómala.', 'Se procederá a recalibrar.', 3, 3, 1, 23),
('Sensor óptico desconectado.', 'Requiere revisión técnica.', 4, 4, 2, 24),
('Cámara principal sin señal.', 'Probable desconexión de red.', 5, 5, 3, 25),
('Reinicio no programado.', 'Se investigará causa raíz.', 1, 6, 4, 26),
('Análisis en curso.', 'Equipo técnico en revisión.', 2, 7, 1, 27),
('Alerta crítica.', 'Escalado a supervisor general.', 3, 8, 4, 28),
('Evento duplicado.', 'Se cancela registro redundante.', 4, 9, 2, 29),
('Verificación automática completada.', 'Incidente cerrado.', 5, 10, 4, 30),
('Fallo de sensor de vibración.', 'Componente reemplazado.', 1, 1, 4, 31),
('Detección falsa.', 'Revisión de modelo AI en curso.', 2, 2, 1, 32),
('Cámara térmica sin respuesta.', 'Se solicita inspección.', 3, 3, 1, 33),
('Pérdida temporal de red.', 'Servicio restablecido.', 4, 4, 4, 34),
('Registro duplicado.', 'Cancelado manualmente.', 5, 5, 2, 35),
('Anomalía menor.', 'Supervisada en dashboard.', 1, 6, 3, 36),
('Aumento de temperatura.', 'Se activa protocolo de seguridad.', 2, 7, 1, 37),
('Sin transmisión de cámara.', 'Esperando diagnóstico.', 3, 8, 2, 38),
('Lectura interrumpida.', 'Evaluando estabilidad del enlace.', 4, 9, 1, 39),
('Mantenimiento solicitado.', 'Turno noche procederá.', 5, 10, 3, 40),
('Falla mecánica leve.', 'Diente con microfisura.', 1, 1, 4, 41),
('Conexión restablecida.', 'Prueba satisfactoria.', 2, 2, 4, 42),
('Análisis terminado.', 'Incidente cerrado correctamente.', 3, 3, 4, 43),
('Componente reemplazado.', 'Sistema operativo estable.', 4, 4, 4, 44),
('Sensor calibrado.', 'Valores dentro de rango.', 5, 5, 4, 45),
('Se reabre caso por repetición.', 'Revisión adicional requerida.', 1, 6, 2, 46),
('Revisión pendiente.', 'Esperando asignación.', 2, 7, 1, 47),
('Alerta normalizada.', 'Sin riesgo operativo.', 3, 8, 4, 48),
('Diente desprendido.', 'Alerta prioritaria.', 4, 9, 1, 49),
('Falsa alarma descartada.', 'Confirmación manual.', 5, 10, 2, 50),
('Sensor óptico estable.', 'Condiciones normales.', 1, 1, 4, 51),
('Reinicio exitoso.', 'Sistema restablecido.', 2, 2, 4, 52),
('Verificación visual positiva.', 'Sin daños aparentes.', 3, 3, 4, 53),
('Conectividad restaurada.', 'Operación estable.', 4, 4, 4, 54),
('Advertencia por ruido.', 'Pendiente validación.', 5, 5, 1, 55),
('Vibración estabilizada.', 'Sin anomalías.', 1, 6, 4, 56),
('Desgaste detectado nuevamente.', 'Revisión recurrente.', 2, 7, 2, 57),
('Cámara lateral fuera de foco.', 'Reenfoque pendiente.', 3, 8, 3, 58),
('Caída de enlace.', 'Evaluar conexión inalámbrica.', 4, 9, 2, 59),
('Operación normal.', 'Registro de control.', 5, 10, 4, 60),
('Sobrecalentamiento leve.', 'Esperando enfriamiento.', 1, 1, 1, 61),
('Revisión nocturna.', 'Turno noche informado.', 2, 2, 2, 62),
('Pérdida de imagen parcial.', 'Zona oscura en cámara.', 3, 3, 3, 63),
('Lectura fuera de rango.', 'Mantenimiento informado.', 4, 4, 4, 64),
('Error temporal.', 'Reinicio programado.', 5, 5, 4, 65),
('Alerta duplicada.', 'Descartada automáticamente.', 1, 6, 2, 66),
('Sensor bloqueado.', 'Verificar campo visual.', 2, 7, 2, 67),
('Obstrucción detectada.', 'Limpieza pendiente.', 3, 8, 1, 68),
('Sin datos recientes.', 'Esperando transmisión.', 4, 9, 3, 69),
('Sistema estable.', 'Sin incidentes mayores.', 5, 10, 4, 70),
('Temperatura elevada.', 'Advertencia monitoreada.', 1, 1, 1, 71),
('Cámara reiniciada.', 'Operación normal.', 2, 2, 4, 72),
('Verificación técnica completada.', 'Incidente cerrado.', 3, 3, 4, 73),
('Diente desgastado.', 'Planificar reemplazo.', 4, 4, 2, 74),
('Revisión completada.', 'Caso cerrado.', 5, 5, 4, 75);


