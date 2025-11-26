--***SHARED DIMENSIONS VALUES

-- GET THE MILIEUs
SELECT distinct Milieu 
from StagingArea.dbo.stag_EmploiPerSecteur


UNION

SELECT distinct Milieu 
from StagingArea.dbo.stag_EmploiPerAge

UNION

select distinct Milieu
from StagingArea.dbo.stag_Education

UNION

select distinct Milieu
from StagingArea.dbo.stag_Migration


-- GET THE SEX 
SELECT distinct Sexe 
from StagingArea.dbo.stag_EmploiPerSecteur


UNION


SELECT distinct Sexe 
from StagingArea.dbo.stag_EmploiPerAge

UNION

select distinct Sexe
from StagingArea.dbo.stag_Education

UNION

select distinct Sexe
from StagingArea.dbo.stag_Migration


-- GET THE Gouvernorat 
SELECT distinct Region 
from StagingArea.dbo.stag_EmploiPerSecteur WHERE Region LIKE 'Gouvernorat%'

UNION

SELECT distinct Region 
from StagingArea.dbo.stag_EmploiPerAge WHERE Region LIKE 'Gouvernorat%'

UNION

select distinct Region
from StagingArea.dbo.stag_Education WHERE Region LIKE 'Gouvernorat%'

UNION

select distinct Region
from StagingArea.dbo.stag_Migration WHERE Region LIKE 'Gouvernorat%'

-- GET THE District 
SELECT distinct Region 
from StagingArea.dbo.stag_EmploiPerSecteur WHERE Region not  LIKE 'Gouvernorat%' and Region not LIKE 'Délégation%'

UNION

SELECT distinct Region 
from StagingArea.dbo.stag_EmploiPerAge WHERE Region not  LIKE 'Gouvernorat%' and Region not LIKE 'Délégation%'

UNION

select distinct Region
from StagingArea.dbo.stag_Education WHERE Region not  LIKE 'Gouvernorat%' and Region not LIKE 'Délégation%'

UNION

select distinct Region
from StagingArea.dbo.stag_Migration WHERE Region not  LIKE 'Gouvernorat%' and Region not LIKE 'Délégation%'


-- GET THE Delegations
SELECT distinct Region 
from StagingArea.dbo.stag_EmploiPerSecteur WHERE Region  LIKE 'Délégation%'

UNION

SELECT distinct Region 
from StagingArea.dbo.stag_EmploiPerAge WHERE Region  LIKE 'Délégation%'

UNION

select distinct Region
from StagingArea.dbo.stag_Migration WHERE Region  LIKE 'Délégation%'



-- GET THE DATE
SELECT distinct Year(Date_Collecte)  as Anner
from StagingArea.dbo.stag_Migration

UNION

SELECT distinct Year(Date_Collecte) as Anner 
from StagingArea.dbo.stag_EmploiPerAge

UNION

select distinct Year(Date_Collecte) as Anner
from StagingArea.dbo.stag_Education

UNION

select distinct Year(Date_Collecte) as Anner
from StagingArea.dbo.stag_EmploiPerSecteur




--***SINGLE DIMENSIONS VALUES

-- GET THE SECTEUR D'activiter from employees table
SELECT distinct Secteur_Activite 
from StagingArea.dbo.stag_EmploiPerSecteur



-- GET THE raison from stag_immigration table
SELECT distinct raison 
from StagingArea.dbo.stag_Migration

-- GET THE AGE TRANCHES FROM THE emplyer per age table
SELECT distinct TrancheAge
from StagingArea.dbo.stag_EmploiPerAge

-- GET THE Niveau_Instruction from employees table
SELECT distinct  Niveau_Instruction
from StagingArea.dbo.stag_Education