# 🪓 GETS - Base de Datos del Sistema de Monitoreo de Palas Mecánicas  
## 📚 Proyecto de Título – Ingeniería en Informática (2025)

La base de datos del sistema **GETS (Ground Engagement Teeth System)** centraliza toda la información del monitoreo inteligente de palas mecánicas utilizadas en minería.  
Diseñada en **MySQL**, permite gestionar usuarios, estados, incidentes e imágenes, garantizando **integridad relacional, trazabilidad y soporte** a los módulos analíticos e IA del sistema.

---

### 🧱 Tablas Principales
1. **UserType** – Roles y permisos del sistema  
2. **User** – Información de usuarios registrados  
3. **StatusShovel** – Estados operativos de las palas  
4. **Shovel** – Registro de palas monitoreadas  
5. **StatusIncident** – Ciclo de vida de los incidentes  
6. **Incident** – Eventos detectados por el sistema  
7. **Image** – Imágenes asociadas a cada incidente  

---

### ⚙️ Procedimientos Almacenados
- `sp_InsertIncident`  
- `sp_UpdateIncidentStatus`  
- `sp_GetShovelStatusSummary`  
- `sp_GetIncidentsByDateRange`  
- `sp_GetUserActivity`  

---

### 📂 Archivos del Repositorio
**schema.sql** → Definición de tablas, claves y relaciones.  
**inserts_data.sql** → Datos iniciales de usuarios, palas, incidentes e imágenes.  
**procedures.sql** → SPs para consultas y operaciones frecuentes.  
**views.sql** → Vistas predefinidas para análisis y reportes.  
