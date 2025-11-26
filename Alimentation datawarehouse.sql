
-- FACT EDUCATION
SELECT  DISTINCT
    -- 1. Conditional Gouverment Key Lookup
    -- Returns id_gouverment if the region matches the Gouvernorat pattern, otherwise returns NULL.
    (SELECT TOP 1 T1.id_gouverment
     FROM DatawareHouse.dbo.Dim_Gouverment T1
     WHERE SE.Region = T1.gouverment AND SE.Region LIKE 'Gouvernorat%') AS id_gouverment,

    -- 2. Conditional District Key Lookup
    -- Returns id_district if the region does NOT match the Gouvernorat pattern, otherwise returns NULL.
    (SELECT TOP 1 T2.id_district
     FROM DatawareHouse.dbo.Dim_District T2
     WHERE SE.Region = T2.district AND SE.Region NOT LIKE 'Gouvernorat%') AS id_district,
     
    -- 3. Genre Key (Simple implicit join)
    GR.id_genre,
    
    -- 4. Milieu Key (Simple implicit join)
    M.id_milieu,
    
    -- 5. Année Key (Simple implicit join)
    A.id_annee,
    
    -- 6. Niveau Key (Simple implicit join)
    N.id_niveau,

    SE.population AS nombre_etudiants
FROM 
    StagingArea.dbo.stag_Education SE,
    DatawareHouse.dbo.Dim_Genre GR,
    DatawareHouse.dbo.Dim_Milieu M,
    DatawareHouse.dbo.Dim_Année A,
    DatawareHouse.dbo.Dim_Niveau N
WHERE
    -- The WHERE clause only handles the standard, unambiguous dimension joins:
    
    -- Genre transformation join (Mapping Féminin/Masculin to F/M)
    GR.libelle_genre = CASE 
        WHEN SE.Sexe IN ('Féminin', 'Femme') THEN 'F' 
        WHEN SE.Sexe IN ('Masculin', 'Homme') THEN 'M'
        ELSE NULL 
    END
    
    -- Milieu join
    AND SE.Milieu = Case
        WHEN M.libelle_milieu = 'Rural'  then 'Rural' 
        when M.libelle_milieu = 'Urbain'  then 'Communal'
     END
    -- Année join (extracting year from Date_Collecte)
    AND YEAR(SE.Date_Collecte) = A.annee
    
    -- Niveau join
    AND SE.Niveau_Instruction = N.libelle_niveau;

-- FACT EMPLOI
SELECT
    id_gouverment,
    id_district,
    id_delegation,
    id_genre,
    id_annee,
    id_milieu,
    id_secteur,
    id_age,
    nombre_actifs -- This column name is used for the combined measure
FROM
(
    -- **FACT EMPLOI per ACTIVITER**
    SELECT DISTINCT
        -- 1. Conditional Gouverment Key Lookup
        (SELECT TOP 1 T1.id_gouverment
         FROM DatawareHouse.dbo.Dim_Gouverment T1
         WHERE SE.Region = T1.gouverment AND SE.Region LIKE 'Gouvernorat%') AS id_gouverment,

        -- 2. Conditional District Key Lookup
        (SELECT TOP 1 T2.id_district
         FROM DatawareHouse.dbo.Dim_District T2
         WHERE SE.Region = T2.district AND SE.Region NOT LIKE 'Gouvernorat%' AND SE.Region NOT LIKE 'Délégation%') AS id_district,

        -- 3. Conditional Delegation Key Lookup
        (SELECT TOP 1 T3.id_delegation
         FROM DatawareHouse.dbo.Dim_Delegation T3
         WHERE SE.Region = T3.delegation AND SE.Region LIKE 'Délégation%') AS id_delegation,

        -- 4. Genre Key
        GR.id_genre,

        -- 5. Année Key
        A.id_annee,

        -- 6. Milieu Key
        M.id_milieu,

        -- 7. Secteur Activite Key
        S.id_secteur,

        -- 8. Age Key
        NULL AS id_age,

        -- Staging Data (For the measure)
        SE.population AS nombre_actifs
    FROM
        StagingArea.dbo.stag_EmploiPerSecteur SE,
        DatawareHouse.dbo.Dim_Genre GR,
        DatawareHouse.dbo.Dim_Année A,
        DatawareHouse.dbo.Dim_Milieu M,
        DatawareHouse.dbo.Dim_SecteurActivite S
    WHERE
        -- Genre transformation join
        GR.libelle_genre = CASE
            WHEN SE.Sexe IN ('Féminin', 'Femme') THEN 'F'
            WHEN SE.Sexe IN ('Masculin', 'Homme') THEN 'M'
            ELSE NULL
        END

        -- Année join
        AND YEAR(SE.Date_Collecte) = A.annee

        -- Milieu join
        AND SE.Milieu = CASE
            WHEN M.libelle_milieu = 'Rural' THEN 'Rural'
            WHEN M.libelle_milieu = 'Urbain' THEN 'Communal'
        END

        -- Secteur Activite join
        AND SE.Secteur_Activite = S.libelle_secteur

    UNION ALL

    -- **FACT EMPLOI PER AGE**
    SELECT DISTINCT
        -- 1. Conditional Gouverment Key Lookup
        (SELECT TOP 1 T1.id_gouverment
         FROM DatawareHouse.dbo.Dim_Gouverment T1
         WHERE SE.Region = T1.gouverment AND SE.Region LIKE 'Gouvernorat%') AS id_gouverment,

        -- 2. Conditional District Key Lookup
        (SELECT TOP 1 T2.id_district
         FROM DatawareHouse.dbo.Dim_District T2
         WHERE SE.Region = T2.district AND SE.Region NOT LIKE 'Gouvernorat%' AND SE.Region NOT LIKE 'Délégation%') AS id_district,

        -- 3. Conditional Delegation Key Lookup
        (SELECT TOP 1 T3.id_delegation
         FROM DatawareHouse.dbo.Dim_Delegation T3
         WHERE SE.Region = T3.delegation AND SE.Region LIKE 'Délégation%') AS id_delegation,

        -- 4. Genre Key
        GR.id_genre,

        -- 5. Année Key
        A.id_annee,

        -- 6. Milieu Key
        M.id_milieu,

        -- 7. Secteur Key (NULL as it's not relevant for this fact source)
        NULL AS id_secteur,

        -- 8. Age Key
        AGE.id_age,

        -- Staging Data (For the measure)
        SE.population AS nombre_actifs -- Rename to match the first SELECT's measure column
    FROM
        StagingArea.dbo.stag_EmploiPerAge SE,
        DatawareHouse.dbo.Dim_Genre GR,
        DatawareHouse.dbo.Dim_Age AGE,
        DatawareHouse.dbo.Dim_Année A,
        DatawareHouse.dbo.Dim_Milieu M
    WHERE
        -- Genre transformation join
        GR.libelle_genre = CASE
            WHEN SE.Sexe IN ('Féminin', 'Femme') THEN 'F'
            WHEN SE.Sexe IN ('Masculin', 'Homme') THEN 'M'
            ELSE NULL
        END

        -- Age join
        AND SE.TrancheAge = AGE.tranche_age

        -- Année join
        AND YEAR(SE.Date_Collecte) = A.annee

        -- Milieu join
        AND SE.Milieu = CASE
            WHEN M.libelle_milieu = 'Rural' THEN 'Rural'
            WHEN M.libelle_milieu = 'Urbain' THEN 'Communal'
        END
) AS CombinedEmploymentData;


-- FACT MIGATION
SELECT  DISTINCT
    -- 1. Conditional Gouverment Key Lookup
    (SELECT TOP 1 T1.id_gouverment
     FROM DatawareHouse.dbo.Dim_Gouverment T1
     WHERE SI.Region = T1.gouverment AND SI.Region LIKE 'Gouvernorat%') AS id_gouverment,

     -- 2. Conditional District Key Lookup
        (SELECT TOP 1 T2.id_district
         FROM DatawareHouse.dbo.Dim_District T2
         WHERE SI.Region = T2.district AND SI.Region NOT LIKE 'Gouvernorat%' AND SI.Region NOT LIKE 'Délégation%') AS id_district,

        -- 3. Conditional Delegation Key Lookup
        (SELECT TOP 1 T3.id_delegation
         FROM DatawareHouse.dbo.Dim_Delegation T3
         WHERE SI.Region = T3.delegation AND SI.Region LIKE 'Délégation%') AS id_delegation,
     
    -- 3. Genre Key
    GR.id_genre,
    
    -- 4. Milieu Key
    M.id_milieu,
    
    -- 5. Année Key
    A.id_annee,
    
    -- 6. Raison Migration Key
    R.id_raison,

    -- Staging Data (For Reference)

    SI.population AS nombre_migrants
FROM 
    StagingArea.dbo.stag_Migration SI,
    DatawareHouse.dbo.Dim_Genre GR,
    DatawareHouse.dbo.Dim_Milieu M,
    DatawareHouse.dbo.Dim_Année A,
    DatawareHouse.dbo.Dim_RaisonMigration R
WHERE
    -- Genre transformation join
    GR.libelle_genre = CASE 
        WHEN SI.Sexe IN ('Féminin', 'Femme') THEN 'F' 
        WHEN SI.Sexe IN ('Masculin', 'Homme') THEN 'M'
        ELSE NULL 
    END
    
       -- Milieu join
    AND SI.Milieu = Case
        WHEN M.libelle_milieu = 'Rural'  then 'Rural' 
        when M.libelle_milieu = 'Urbain'  then 'Communal'
     END
    -- Année join
    AND YEAR(SI.Date_Collecte) = A.annee
    
    -- Raison Migration join
    AND SI.Raison = R.libelle_raison;
