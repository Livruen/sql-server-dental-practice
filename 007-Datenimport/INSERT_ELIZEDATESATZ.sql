INSERT INTO dbo.PatientHatDiagnose
(
    DiagnoseID,
    ZahnID,
    LokalisationID,
    ErfasstAm,
    ErfasstvomMitarbeiter,
    PraxisbesuchID
)
SELECT
    d.DiagnoseID,
    z.ZahnID,
    l.LokalisationID,

    -- Eintrag einige Minuten nach Ankunft
    DATEADD(MINUTE, v.MinutenNachAnkunft, pb.Ankunft),

    v.MitarbeiterID,
    pb.PraxisbesuchID

FROM
(
    VALUES
    -- Datum        ICD       Zahn   Lokalisation              Min.  Mitarbeiter

    ('2011-11-15', 'K00.6',   '51',  NULL,                     12,   6),
    ('2012-05-22', 'K00.6',   '61',  NULL,                     14,   6),
    ('2012-11-20', 'K00.6',   '71',  NULL,                     11,   6),

    ('2013-05-14', 'K02.0',   '54',  NULL,                     15,   6),
    ('2013-11-19', 'K02.0',   '64',  NULL,                     13,   6),

    ('2014-05-13', 'K02.0',   '74',  NULL,                     16,   6),
    ('2014-11-18', 'K05.0',   NULL,  N'Gingiva',               14,   6),

    -- 2015-09-01 existiert bereits!

    ('2015-09-22', 'K02.0',   '54',  NULL,                     12,   6),

    ('2016-03-15', 'K05.1',   NULL,  N'Gingiva',               15,   6),
    ('2016-09-20', 'K02.1',   '64',  NULL,                     18,   6),

    ('2017-03-21', 'K00.6',   '11',  NULL,                     13,   6),
    ('2017-09-19', 'K00.6',   '21',  NULL,                     16,   6),

    ('2018-03-13', 'K02.0',   '16',  NULL,                     17,   6),
    ('2018-09-18', 'K05.1',   NULL,  N'Gingiva',               15,   6),

    ('2019-03-12', 'K02.1',   '26',  NULL,                     14,   6),
    ('2019-09-17', 'K05.1',   NULL,  N'Gingiva',               17,   6),

    ('2020-05-26', 'K02.0',   '36',  NULL,                     16,   6),
    ('2020-11-24', 'K05.1',   NULL,  N'Gingiva',               17,   8),

    ('2021-05-18', 'K02.1',   '46',  NULL,                     18,   8),
    ('2021-11-23', 'K04.0',   '46',  NULL,                     20,   6),

    ('2022-05-17', 'K05.1',   NULL,  N'Gingiva',               15,   8),
    ('2022-11-22', 'K02.0',   '15',  NULL,                     16,   8),

    ('2023-05-16', 'K02.1',   '25',  NULL,                     18,   8),
    ('2023-11-21', 'K05.1',   NULL,  N'Gingiva',               17,   8),

    ('2024-05-21', 'K02.0',   '37',  NULL,                     15,   8),
    ('2024-11-19', 'K05.1',   NULL,  N'Gingiva',               18,   8),

    ('2025-05-20', 'K02.1',   '47',  NULL,                     16,   8),
    ('2025-11-18', 'K04.0',   '47',  NULL,                     19,   6),

    ('2026-05-19', 'K05.1',   NULL,  N'Gingiva',               17,   8)

) AS v
(
    Besuchsdatum,
    ICD10CODE,
    ZahnCODE,
    Lokalisation,
    MinutenNachAnkunft,
    MitarbeiterID
)

INNER JOIN dbo.Praxisbesuch AS pb
    ON pb.PatientID = 10
    AND CAST(pb.Ankunft AS DATE) = CAST(v.Besuchsdatum AS DATE)

INNER JOIN dbo.Diagnose AS d
    ON d.ICD10CODE = v.ICD10CODE

LEFT JOIN dbo.Zahn AS z
    ON z.ZahnCODE = v.ZahnCODE

LEFT JOIN dbo.Lokalisation AS l
    ON l.Lokalisation_name = v.Lokalisation;