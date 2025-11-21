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

-- Stag_EmploiPerAge TABLE
CREATE TABLE stag_EmploiPerAge (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Date_Collecte DATETIME,
    Milieu_Nom NVARCHAR(100),
    Sexe NVARCHAR(50),
    TrancheAge NVARCHAR(100),
    Region NVARCHAR(100),
    population INT
);


-- STAG_MIGRATION TABLE
CREATE TABLE stag_immigration (
    ID INT IDENTITY(1,1) PRIMARY KEY,  -- Auto-increment primary key
    Region NVARCHAR(100) ,
    date DATETIME,
    Milieu NVARCHAR(50),
    Sexe NVARCHAR(20),
    Raison NVARCHAR(100),
    Population INT
);

