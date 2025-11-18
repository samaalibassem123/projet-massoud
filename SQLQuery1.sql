--***SHARED DIMENSIONS VALUES

-- GET THE MILIEUs
SELECT distinct Milieu 
from StagingArea.dbo.stag_emploi

UNION

select distinct Milieu
from StagingArea.dbo.stag_Etudiant

UNION

select distinct Milieu
from StagingArea.dbo.stag_immigration


-- GET THE SEX 
SELECT distinct Sexe 
from StagingArea.dbo.stag_emploi

UNION

select distinct Sexe
from StagingArea.dbo.stag_Etudiant

UNION

select distinct Sexe
from StagingArea.dbo.stag_immigration


-- GET THE Regions 
SELECT distinct Region 
from StagingArea.dbo.stag_emploi

UNION

select distinct Region
from StagingArea.dbo.stag_Etudiant

UNION

select distinct Region
from StagingArea.dbo.stag_immigration


--***SINGLE DIMENSIONS VALUES

-- GET THE SECTEUR D'activiter from employees table
SELECT distinct Secteur_Activite 
from StagingArea.dbo.stag_emploi


-- GET THE raison from stag_immigration table
SELECT distinct raison 
from StagingArea.dbo.stag_immigration