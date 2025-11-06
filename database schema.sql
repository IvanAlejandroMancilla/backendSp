-- =============================
-- Tabla Tipo de Usuario
-- =============================

CREATE TABLE UserType (
    idUserType INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(255),
    permissions VARCHAR(255)
);

-- =============================
-- Tabla Usuario
-- =============================

CREATE TABLE User (
    idUser INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    lastName VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARBINARY(512) NOT NULL,
    password_salt VARBINARY(512) NOT NULL,
    idUserType INT,
    
    CONSTRAINT fk_user_usertype
        FOREIGN KEY (idUserType)
        REFERENCES UserType(idUserType)
);

-- =============================
-- Tabla Estado de Pala
-- =============================

CREATE TABLE StatusShovel (
    idStatus INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(255),
    operation BOOL
);

-- =============================
-- Tabla Pala
-- =============================

CREATE TABLE Shovel (
    idShovel INT AUTO_INCREMENT PRIMARY KEY,
    serialNumber VARCHAR(100),
    model VARCHAR(200),
    brand VARCHAR(200),
    status INT,
    dateTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_shovel_status
        FOREIGN KEY (status)
        REFERENCES StatusShovel(idStatus)
);

-- =============================
-- Tabla Estado de Incidentes
-- =============================

CREATE TABLE StatusIncident (
    idStatus INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(250),
    description VARCHAR(250)
);

-- =============================
-- Tabla Imagen
-- =============================

CREATE TABLE Image (
    idImage INT AUTO_INCREMENT PRIMARY KEY,
    path VARCHAR(5000),
    rawName VARCHAR(250),
    dateTimePic TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =============================
-- Tabla Incidentes
-- =============================

CREATE TABLE Incident (
    idIncident INT AUTO_INCREMENT PRIMARY KEY,
    dateTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    description VARCHAR(255),
    observation VARCHAR(250),
    idUser INT,
    idShovel INT,
    idStatusIncident INT,
    idImage INT,
    
    CONSTRAINT fk_incident_user
        FOREIGN KEY (idUser)
        REFERENCES User(idUser),
        
    CONSTRAINT fk_incident_shovel
        FOREIGN KEY (idShovel)
        REFERENCES Shovel(idShovel),
        
    CONSTRAINT fk_incident_status
        FOREIGN KEY (idStatusIncident)
        REFERENCES StatusIncident(idStatus),
        
    CONSTRAINT fk_incident_image
        FOREIGN KEY (idImage)
        REFERENCES Image(idImage)
);


