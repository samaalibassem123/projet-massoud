--***SHARED DIMENSIONS VALUES

-- GET THE MILIEUs
SELECT distinct Milieu 
from StagingArea.dbo.stag_emploi

UNION

select distinct Milieu
from StagingArea.dbo.stag_Etudiant

UNION

select distinct Milieu
from StagingArea.dbo.stag_Migration


-- GET THE SEX 
SELECT distinct Sexe 
from StagingArea.dbo.stag_emploi

UNION

select distinct Sexe
from StagingArea.dbo.stag_Etudiant

UNION

select distinct Sexe
from StagingArea.dbo.stag_Migration


-- GET THE Regions 
SELECT distinct Region 
from StagingArea.dbo.stag_emploi

UNION

select distinct Region
from StagingArea.dbo.stag_Etudiant

UNION

select distinct Region
from StagingArea.dbo.stag_Migration


--***SINGLE DIMENSIONS VALUES

-- GET THE SECTEUR D'activiter from employees table
SELECT distinct Secteur_Activite 
from StagingArea.dbo.stag_emploi


-- GET THE Niveau_Instruction from employees table
SELECT distinct  Niveau_Instruction
from StagingArea.dbo.stag_Etudiant

