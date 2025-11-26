-- create database StagingArea;
USE StagingArea;
GO

-- stag_Education TABLE
CREATE TABLE stag_Education (
    Indicateur_Cle INT IDENTITY(1,1) PRIMARY KEY,  -- auto-increment
    Date_Collecte DATETIME,
    Milieu NVARCHAR(50),
    Sexe NVARCHAR(20),
    Niveau_Instruction NVARCHAR(50),
    Region NVARCHAR(100),
    population INT
);


-- stag_EmploiPerSecteur TABLE
CREATE TABLE stag_EmploiPerSecteur(
    Indicateur_Cle INT IDENTITY(1,1) PRIMARY KEY,  -- auto-increment
    Date_Collecte DATETIME,
    Milieu NVARCHAR(50),
    Sexe NVARCHAR(20),
    Secteur_Activite NVARCHAR(100),
    Region NVARCHAR(100),
    population INT
);

-- Stag_EmploiPerAge TABLE
CREATE TABLE stag_EmploiPerAge (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Date_Collecte DATETIME,
    Milieu NVARCHAR(50),
    Sexe NVARCHAR(20),
    TrancheAge NVARCHAR(100),
    Region NVARCHAR(100),
    population INT
);


-- stag_Migration TABLE
CREATE TABLE stag_Migration (
    ID INT IDENTITY(1,1) PRIMARY KEY, 
    Region NVARCHAR(100),
    Date_Collecte DATETIME,
    Milieu NVARCHAR(50),
    Sexe NVARCHAR(20),
    Raison NVARCHAR(100),
    population INT
);

