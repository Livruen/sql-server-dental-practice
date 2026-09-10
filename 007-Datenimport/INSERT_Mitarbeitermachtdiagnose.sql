USE Zahnarztpraxis
GO
UPDATE dbo.PatientHatDiagnose
SET ErfasstVomMitarbeiter =
    CASE PatientDiagnoseID

        -- Nadia
        WHEN 1  THEN 8

        -- Natasza
        WHEN 2  THEN 6
        WHEN 3  THEN 8

        -- Hedwig
        WHEN 4  THEN 6

        -- Arnold
        WHEN 5  THEN 8

        -- Maria
        WHEN 6  THEN 6
        WHEN 7  THEN 6

        -- Hans Curie
        WHEN 8  THEN 10
        WHEN 9  THEN 10

        -- Katja
        WHEN 10 THEN 6

        -- Helene
        WHEN 11 THEN 8

        -- Felix Rasmus
        WHEN 12 THEN 6

        -- Elize Rasmus
        WHEN 13 THEN 6

        -- Thomas Rasmus
        WHEN 14 THEN 10

        -- Frauke
        WHEN 15 THEN 8

        -- Karl
        WHEN 16 THEN 10

        -- Manfred
        WHEN 17 THEN 6

        -- Hannelore
        WHEN 18 THEN 8
        WHEN 19 THEN 8

        -- Anemarie
        WHEN 20 THEN 6
        WHEN 21 THEN 6

        -- Otto
        WHEN 22 THEN 10

        -- Felix Hans Schwert
        WHEN 23 THEN 8
        WHEN 24 THEN 8

        ELSE ErfasstVomMitarbeiter
    END
WHERE PatientDiagnoseID BETWEEN 1 AND 24;