UPDATE dbo.PatientHatDiagnose
SET ErfasstAm =
    CASE PatientDiagnoseID

        -- Nadia Szymanska, geb. 12.04.2023
        WHEN 1  THEN '2026-08-24T09:14:00'

        -- Natasza Szymanska
        WHEN 2  THEN '2026-03-10T10:18:00'
        WHEN 3  THEN '2026-03-10T10:22:00'

        -- Hedwig Weinberg, historische Diagnose vor dem Tod
        WHEN 4  THEN '2018-05-14T11:05:00'

        -- Arnold Berg, historischer Patient
        WHEN 5  THEN '2024-11-03T09:47:00'

        -- Maria Curie, zwei Diagnosen beim selben Termin
        WHEN 6  THEN '2025-09-18T14:11:00'
        WHEN 7  THEN '2025-09-18T14:15:00'

        -- Hans Curie
        WHEN 8  THEN '2025-10-07T08:52:00'
        WHEN 9  THEN '2025-10-07T08:57:00'

        -- Katja Rasmus, damals ca. 4 Jahre alt
        WHEN 10 THEN '2015-08-20T10:12:00'

        -- Helene Rasmus
        WHEN 11 THEN '2026-02-12T15:34:00'

        -- Felix Rasmus, damals ca. 5 Jahre alt
        WHEN 12 THEN '2018-03-10T09:26:00'

        -- Elize Rasmus, damals ca. 4 Jahre alt
        WHEN 13 THEN '2015-09-01T11:03:00'

        -- Thomas Rasmus
        WHEN 14 THEN '2026-04-02T16:17:00'

        -- Frauke Himbeere
        WHEN 15 THEN '2025-11-20T10:41:00'

        -- Karl Himbeere
        WHEN 16 THEN '2024-06-11T13:28:00'

        -- Manfred Otto
        WHEN 17 THEN '2025-05-09T09:38:00'

        -- Hannelore Otto, zwei Befunde an einem Termin
        WHEN 18 THEN '2026-01-17T10:03:00'
        WHEN 19 THEN '2026-01-17T10:08:00'

        -- Anemarie Kail
        WHEN 20 THEN '2025-07-30T14:22:00'
        WHEN 21 THEN '2025-07-30T14:27:00'

        -- Otto Kail
        WHEN 22 THEN '2024-08-21T11:51:00'

        -- Felix Hans Schwert, damals knapp 5 Jahre alt
        WHEN 23 THEN '2021-05-20T09:16:00'
        WHEN 24 THEN '2021-05-20T09:21:00'

        ELSE ErfasstAm
    END;