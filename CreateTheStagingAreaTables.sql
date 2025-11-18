USE StagingArea;
GO

-- STAG_ETUDIANT TABLE
CREATE TABLE stag_Etudiant (
    Indicateur_Cle INT IDENTITY(1,1) PRIMARY KEY,  -- auto-increment
    Date_Collecte DATETIME,
    Milieu NVARCHAR(50),
    Sexe NVARCHAR(20),
    Niveau_Instruction NVARCHAR(50),
    Region NVARCHAR(100),
    Population INT
);

-- Example data (no need to insert Indicateur_Cle manually)
INSERT INTO stag_Etudiant (Date_Collecte, Milieu, Sexe, Niveau_Instruction, Region, Population)
VALUES ('2014-01-01 00:00:00', 'Communal', 'Masculin', 'Primaire', 'Nord Est', 432720);


-- STAG_EMPLOI TABLE
CREATE TABLE stag_Emploi (
    Indicateur_Cle INT IDENTITY(1,1) PRIMARY KEY,  -- auto-increment
    Date_Collecte DATETIME,
    Milieu NVARCHAR(50),
    Sexe NVARCHAR(20),
    Secteur_Activite NVARCHAR(100),
    Region NVARCHAR(100),
    Population INT
);

-- Example data (no need to insert Indicateur_Cle manually)
INSERT INTO stag_Emploi (Date_Collecte, Milieu, Sexe, Secteur_Activite, Region, Population)
VALUES ('2014-01-01 00:00:00', 'Communal', 'Masculin', 'Agriculture et peche', 'Tunisie', 76872);


-- STAG_MIGRATION TABLE
CREATE TABLE stag_immigration (
    ID INT IDENTITY(1,1) PRIMARY KEY,  -- Auto-increment primary key
    Region NVARCHAR(100) NOT NULL,
    Milieu NVARCHAR(50) NOT NULL,
    Sexe NVARCHAR(20) NOT NULL,
    Raison NVARCHAR(100) NOT NULL,
    Population INT NOT NULL
);

