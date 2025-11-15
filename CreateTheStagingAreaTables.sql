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
CREATE TABLE stag_Migration (
    Indicateur_Cle INT IDENTITY(1,1) PRIMARY KEY,  -- auto-increment key
    Region NVARCHAR(100),
    Milieu NVARCHAR(50),
    Sexe NVARCHAR(20),
    Pop_Emploi INT,
    Pop_Acquisition_Logement INT,
    Pop_Mariage INT,
    Pop_Accompagnement_Famille INT,
    Pop_Etudes INT,
    Pop_Autres INT
);

-- Example data (no need to insert Indicateur_Cle manually)
INSERT INTO stag_Migration (Region, Milieu, Sexe, Pop_Emploi, Pop_Acquisition_Logement, Pop_Mariage, Pop_Accompagnement_Famille, Pop_Etudes, Pop_Autres)
VALUES ('Tunisie', 'Communal', 'Masculin', 63996, 73917, 56323, 64224, 19275, 10346);
