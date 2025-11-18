SELECT
    g.libelle_genre,
    m.libelle_milieu,
    n.libelle_niveau,
    e.population
FROM 
    StagingArea.dbo.stag_Etudiant e, 
    DatawareHouse.dbo.Dim_Genre g,
    DatawareHouse.dbo.Dim_Milieu m,
    DatawareHouse.dbo.Dim_Niveau n
where
    e.Milieu = m.libelle_milieu and
    e.Niveau_Instruction = n.libelle_niveau

