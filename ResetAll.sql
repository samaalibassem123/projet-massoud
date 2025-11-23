-- reset datawarehouse
delete from DatawareHouse.dbo.Fait_Education
delete from DatawareHouse.dbo.Fait_Emploi
delete from DatawareHouse.dbo.Fait_Emploi_per_age
delete from DatawareHouse.dbo.Fait_Migration


-- Reset Identity for DatawareHouse tables
DBCC CHECKIDENT ('DatawareHouse.dbo.Fait_Education', RESEED, 0);
DBCC CHECKIDENT ('DatawareHouse.dbo.Fait_Emploi', RESEED, 0);
DBCC CHECKIDENT ('DatawareHouse.dbo.Fait_Emploi_per_age', RESEED, 0);
DBCC CHECKIDENT ('DatawareHouse.dbo.Fait_Migration', RESEED, 0);

-- reset staging area
delete from StagingArea.dbo.stag_Emploi
delete from StagingArea.dbo.stag_EmploiPerAge
delete from StagingArea.dbo.stag_immigration
delete from StagingArea.dbo.stag_Education


-- Reset Identity for StagingArea tables
DBCC CHECKIDENT ('StagingArea.dbo.stag_Emploi', RESEED, 0);
DBCC CHECKIDENT ('StagingArea.dbo.stag_EmploiPerAge', RESEED, 0);
DBCC CHECKIDENT ('StagingArea.dbo.stag_immigration', RESEED, 0);
DBCC CHECKIDENT ('StagingArea.dbo.stag_Education', RESEED, 0);




delete from DatawareHouse.dbo.Dim_Milieu
-- Reset Identity for DatawareHouse tables
DBCC CHECKIDENT ('DatawareHouse.dbo.Dim_Milieu', RESEED, 0);