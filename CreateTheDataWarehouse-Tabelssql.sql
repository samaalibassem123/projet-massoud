use DatawareHouse;
GO
--- DIM TABLES
CREATE TABLE Dim_Region (
id_region INT PRIMARY KEY IDENTITY,
nom_region VARCHAR(100),
district NVARCHAR(50) -- Nord, Centre, Sud
);


CREATE TABLE Dim_Genre (
id_genre INT PRIMARY KEY IDENTITY,
libelle_genre VARCHAR(10) -- Homme / Femme
);

CREATE TABLE Dim_Milieu (
id_milieu INT PRIMARY KEY IDENTITY,
libelle_milieu VARCHAR(20) -- Urbain / Rural
);

CREATE TABLE Dim_Age (
id_age INT PRIMARY KEY IDENTITY,
tranche_age VARCHAR(20) -- 0–14, 15–24, 25–44, etc.
);

CREATE TABLE Dim_Année (
	id_annee INT PRIMARY KEY IDENTITY,
	annee INT
);

CREATE TABLE Dim_Niveau (
id_niveau INT PRIMARY KEY IDENTITY,
libelle_niveau VARCHAR(50) -- Primaire, Secondaire, Supérieur
);


CREATE TABLE Dim_SecteurActivite (
id_secteur INT PRIMARY KEY IDENTITY,
libelle_secteur VARCHAR(50) -- Agriculture, Industrie, Services
);

CREATE TABLE Dim_RaisonMigration (
id_raison INT PRIMARY KEY IDENTITY,
libelle_raison VARCHAR(50) -- Emploi, Études, Mariage, etc.
);



CREATE TABLE Fait_Education (
id_fait_education INT PRIMARY KEY IDENTITY,
id_region INT,
id_genre INT,
id_milieu INT,
id_age INT,
id_annee INT,
id_niveau INT,
taux_scolarisation DECIMAL(5,2),
nombre_etudiants INT,
  FOREIGN KEY (id_region) REFERENCES Dim_Region(id_region),
  FOREIGN KEY (id_genre) REFERENCES Dim_Genre(id_genre),
  FOREIGN KEY (id_milieu) REFERENCES Dim_Milieu(id_milieu),
  FOREIGN KEY (id_age) REFERENCES Dim_Age(id_age),
  FOREIGN KEY (id_annee) REFERENCES Dim_Année(id_annee),
  FOREIGN KEY (id_niveau) REFERENCES Dim_Niveau(id_niveau)
);


CREATE TABLE Fait_Emploi (
id_fait_emploi INT PRIMARY KEY IDENTITY,
id_region INT,
id_genre INT,
id_age INT,
id_annee INT,
id_secteur INT,
taux_chomage DECIMAL(5,2),
nombre_actifs INT,
  FOREIGN KEY (id_region) REFERENCES Dim_Region(id_region),
  FOREIGN KEY (id_genre) REFERENCES Dim_Genre(id_genre),
  FOREIGN KEY (id_age) REFERENCES Dim_Age(id_age),
  FOREIGN KEY (id_annee) REFERENCES Dim_Année(id_annee),
  FOREIGN KEY (id_secteur) REFERENCES Dim_SecteurActivite(id_secteur)
);

use DatawareHouse;
GO
-- fait emploi par age
CREATE TABLE Fait_Emploi_per_age (
id_fait_emploi_per_age INT PRIMARY KEY IDENTITY,
id_region INT,
id_genre INT,
id_age INT,
id_annee INT,
id_milieu INT,
taux_chomage DECIMAL(5,2),
nombre_actifs INT,
  FOREIGN KEY (id_region) REFERENCES Dim_Region(id_region),
  FOREIGN KEY (id_genre) REFERENCES Dim_Genre(id_genre),
  FOREIGN KEY (id_age) REFERENCES Dim_Age(id_age),
  FOREIGN KEY (id_annee) REFERENCES Dim_Année(id_annee),
  FOREIGN KEY (id_milieu) REFERENCES Dim_Milieu(id_milieu)
);




CREATE TABLE Fait_Migration (
id_fait_migration INT PRIMARY KEY IDENTITY,
id_region INT,
id_genre INT,
id_age INT,
id_annee INT,
id_raison INT,
nombre_migrants INT,
taux_migration DECIMAL(5,2),
  FOREIGN KEY (id_region) REFERENCES Dim_Region(id_region),
  FOREIGN KEY (id_genre) REFERENCES Dim_Genre(id_genre),
  FOREIGN KEY (id_age) REFERENCES Dim_Age(id_age),
  FOREIGN KEY (id_annee) REFERENCES Dim_Année(id_annee),
  FOREIGN KEY (id_raison) REFERENCES Dim_RaisonMigration(id_raison)
);
