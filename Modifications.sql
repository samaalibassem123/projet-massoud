use DatawareHouse
go
-- add fk for milieu on the emploi fact table
ALTER TABLE dbo.Fait_Emploi
ADD id_milieu INT NULL;  -- add the column if it doesn't exist

ALTER TABLE dbo.Fait_Emploi
ADD CONSTRAINT FK_FaitEmploi_Milieu
FOREIGN KEY (id_milieu)
REFERENCES dbo.Dim_Milieu(id_milieu);

-- add fk for milieu on the migaration, fact table
ALTER TABLE dbo.Fait_Migration
ADD id_milieu INT NULL;  -- add the column if it doesn't exist

ALTER TABLE dbo.Fait_Emploi
ADD CONSTRAINT FK_Fait_Migration_Milieu
FOREIGN KEY (id_milieu)
REFERENCES dbo.Dim_Milieu(id_milieu);
