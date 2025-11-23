--***SHARED DIMENSIONS VALUES

-- GET THE MILIEUs
SELECT distinct Milieu 
from StagingArea.dbo.stag_emploi

UNION

SELECT distinct Milieu 
from StagingArea.dbo.stag_EmploiPerAge

UNION

select distinct Milieu
from StagingArea.dbo.stag_Education

UNION

select distinct Milieu
from StagingArea.dbo.stag_immigration


-- GET THE SEX 
SELECT distinct Sexe 
from StagingArea.dbo.stag_emploi

UNION


SELECT distinct Sexe 
from StagingArea.dbo.stag_EmploiPerAge

UNION

select distinct Sexe
from StagingArea.dbo.stag_Education

UNION

select distinct Sexe
from StagingArea.dbo.stag_immigration


-- GET THE Gouvernorat 
SELECT distinct Region 
from StagingArea.dbo.stag_emploi WHERE Region LIKE 'Gouvernorat%'

UNION

SELECT distinct Region 
from StagingArea.dbo.stag_EmploiPerAge WHERE Region LIKE 'Gouvernorat%'

UNION

select distinct Region
from StagingArea.dbo.stag_Education WHERE Region LIKE 'Gouvernorat%'

UNION

select distinct Region
from StagingArea.dbo.stag_immigration WHERE Region LIKE 'Gouvernorat%'

-- GET THE District 
SELECT distinct Region 
from StagingArea.dbo.stag_emploi WHERE Region not LIKE 'Gouvernorat%'

UNION

SELECT distinct Region 
from StagingArea.dbo.stag_EmploiPerAge WHERE Region not LIKE 'Gouvernorat%'

UNION

select distinct Region
from StagingArea.dbo.stag_Education WHERE Region not LIKE 'Gouvernorat%'

UNION

select distinct Region
from StagingArea.dbo.stag_immigration WHERE not Region LIKE 'Gouvernorat%'


-- GET THE DATE
SELECT distinct Year(Date_Collecte)  as Anner
from StagingArea.dbo.stag_immigration

UNION

SELECT distinct Year(Date_Collecte) as Anner 
from StagingArea.dbo.stag_EmploiPerAge

UNION

select distinct Year(Date_Collecte) as Anner
from StagingArea.dbo.stag_Education

UNION

select distinct Year(Date_Collecte) as Anner
from StagingArea.dbo.stag_Emploi



--***SINGLE DIMENSIONS VALUES

-- GET THE SECTEUR D'activiter from employees table
SELECT distinct Secteur_Activite 
from StagingArea.dbo.stag_emploi


-- GET THE raison from stag_immigration table
SELECT distinct raison 
from StagingArea.dbo.stag_immigration

-- GET THE AGE TRANCHES FROM THE emplyer paer age table
SELECT distinct TrancheAge
from StagingArea.dbo.stag_EmploiPerAge

-- GET THE Niveau_Instruction from employees table
SELECT distinct  Niveau_Instruction
from StagingArea.dbo.stag_Education