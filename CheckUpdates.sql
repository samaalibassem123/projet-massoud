-- count rows on datawarehouse
select count(*) as 'fait_education_rows'  from DatawareHouse.dbo.Fait_Education
select count(*) as 'fait_emploi_rows'  from DatawareHouse.dbo.Fait_Emploi

select count(*)   as 'fait_migration_rows' from DatawareHouse.dbo.Fait_Migration

-- count rows on  staging_area
select count(*)  as 'stag_emploi_rows' from StagingArea.dbo.stag_EmploiPerSecteur
select count(*)  as 'stag_emploiparage_rows' from StagingArea.dbo.stag_EmploiPerAge
select count(*)  as 'stag_immigration_rows' from StagingArea.dbo.stag_Migration
select count(*)  as 'stag_etudiant_rows' from StagingArea.dbo.stag_Education