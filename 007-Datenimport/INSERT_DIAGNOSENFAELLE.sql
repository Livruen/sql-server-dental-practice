--- ChatGPT Generated

INSERT INTO dbo.PatientHatDiagnose
(
    PatientID,
    DiagnoseID,
    ZahnID,
    LokalisationID
)
SELECT
    v.PatientID,
    d.DiagnoseID,
    z.ZahnID,
    l.LokalisationID
FROM
(
    VALUES

    -- Nadia, Kleinkind: Karies an einem Milchmolar
    (1,  'K02.0', '54', N'Zahn'),

    -- Natasza
    (2,  'K02.1', '16', N'Zahn'),
    (2,  'K05.1', NULL, N'Gingiva'),

    -- Hedwig
    (3,  'K08.1', NULL, N'Mundhöhle allgemein'),

    -- Arnold
    (4,  'K04.0', '26', N'Zahn'),

    -- Maria
    (5,  'K05.3', NULL, N'Gingiva'),
    (5,  'K08.1', '36', N'Zahn'),

    -- Hans Curie
    (6,  'K05.3', NULL, N'Gingiva'),
    (6,  'K08.1', '46', N'Zahn'),

    -- Katja
    (7,  'K02.0', '36', N'Zahn'),

    -- Helene
    (8,  'K02.1', '46', N'Zahn'),

    -- Felix Rasmus
    (9,  'K00.6', '13', N'Zahn'),

    -- Elize
    (10, 'K02.0', '26', N'Zahn'),

    -- Thomas Rasmus
    (11, 'K04.7', '36', N'Zahn'),

    -- Frauke
    (12, 'K05.3', NULL, N'Gingiva'),

    -- Karl
    (13, 'K04.1', '16', N'Zahn'),

    -- Manfred
    (14, 'K08.1', '46', N'Zahn'),

    -- Hannelore
    (15, 'K02.1', '24', N'Zahn'),
    (15, 'K05.1', NULL, N'Gingiva'),

    -- Anemarie
    (16, 'K05.3', NULL, N'Gingiva'),
    (16, 'K08.1', '37', N'Zahn'),

    -- Otto
    (17, 'K08.1', '47', N'Zahn'),

    -- Felix Hans: Milchzahnkaries
    (18, 'K02.0', '55', N'Zahn'),

    -- und ein Beispiel für Hyperodontie:
    -- kein normaler Zahncode vorhanden, daher ZahnID = NULL
    (18, 'K00.1', NULL, N'Oberkiefer')

) AS v(PatientID, ICD10CODE, ZahnCODE, Lokalisation_name)

INNER JOIN dbo.Diagnose AS d
    ON d.ICD10CODE = v.ICD10CODE

LEFT JOIN dbo.Zahn AS z
    ON z.ZahnCODE = v.ZahnCODE

LEFT JOIN dbo.Lokalisation AS l
    ON l.Lokalisation_name = v.Lokalisation_name;