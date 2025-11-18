-- data for tje education fact table
SELECT
    g.id_genre,
    m.id_milieu,
    n.id_niveau,
    r.id_region,
    d.id_annee,
    e.population
FROM 
    StagingArea.dbo.stag_Etudiant e, 
    DatawareHouse.dbo.Dim_Genre g,
    DatawareHouse.dbo.Dim_Milieu m,
    DatawareHouse.dbo.Dim_Niveau n,
    DatawareHouse.dbo.Dim_Region r,
    DatawareHouse.dbo.Dim_Année d
where
    Year(e.Date_Collecte) = d.annee and 
    e.Milieu = m.libelle_milieu and
    e.Niveau_Instruction = n.libelle_niveau and
    e.Region = r.nom_region and
    g.libelle_genre = case 
        when e.Sexe = 'Masculin' then 'M' 
        when e.Sexe = 'Féminin' then 'F'
    end

-- data for the  fact table emploi
SELECT
    g.id_genre,
    m.id_milieu,
    s.id_secteur,
    r.id_region,
    d.id_annee,
    e.Population
FROM 
    StagingArea.dbo.stag_Emploi e, 
    DatawareHouse.dbo.Dim_Genre g,
    DatawareHouse.dbo.Dim_Milieu m,
    DatawareHouse.dbo.Dim_SecteurActivite s,
    DatawareHouse.dbo.Dim_Region r,
    DatawareHouse.dbo.Dim_Année d
where
    Year(e.Date_Collecte) = d.annee and 
    e.Milieu = m.libelle_milieu and
    e.Secteur_Activite = s.libelle_secteur and
    e.Region = r.nom_region and
    g.libelle_genre = case 
        when e.Sexe = 'Masculin' then 'M' 
        when e.Sexe = 'Féminin' then 'F'
    end


-- data for the fact table Migration
SELECT
    g.id_genre,
    rm.id_raison,
    r.id_region,
    d.id_annee,
    m.id_milieu,
    s.Population
FROM 
    StagingArea.dbo.stag_immigration s, 
    DatawareHouse.dbo.Dim_Genre g,
    DatawareHouse.dbo.Dim_Milieu m,
    DatawareHouse.dbo.Dim_RaisonMigration rm,
    DatawareHouse.dbo.Dim_Region r,
    DatawareHouse.dbo.Dim_Année d
where
    Year(s.date) = d.annee and 
    s.Milieu = m.libelle_milieu and
    s.Raison = rm.libelle_raison and
    s.Region = r.nom_region and
    g.libelle_genre = case 
        when s.Sexe = 'Masculin' then 'M' 
        when s.Sexe = 'Féminin' then 'F'
    end