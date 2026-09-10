USE Zahnarztpraxis;
GO

/* =====================================================
   TEST 1: existPatient
   ===================================================== */

-- existierender Patient
SELECT dbo.existPatient(10) AS PatientExistiert;

-- nicht existierender Patient
SELECT dbo.existPatient(99999) AS PatientExistiert;
GO


/* =====================================================
   TEST 2: istArchiviert
   ===================================================== */

-- PatientID 3 = archivierter Patient
SELECT dbo.istArchiviert(3) AS IstArchiviert;

-- PatientID 10 = aktiver Patient
SELECT dbo.istArchiviert(10) AS IstArchiviert;
GO


/* =====================================================
   TEST 3: AlterBerechnen
   ===================================================== */

SELECT
    dbo.AlterBerechnen('2000-01-01') AS Alter;
GO


/* =====================================================
   TEST 4: personExist
   Vorname + Nachname + Geburtsdatum
   ===================================================== */

SELECT
    dbo.personExist
    (
        N'Elize',
        N'Rasmus',
        '2010-11-01'
    ) AS PersonExistiert;
GO


/* =====================================================
   TEST 5: Telefonnummer validieren
   falls Funktion noch vorhanden
   ===================================================== */

SELECT
    N'+491575074241' AS Telefonnummer,
    dbo.Test_validateTelnummer(N'+491575074241')
        AS IstGueltig;

SELECT
    N'Hallo' AS Telefonnummer,
    dbo.Test_validateTelnummer(N'Hallo')
        AS IstGueltig;
GO


/* =====================================================
   TEST 6: Tabellenwertfunktion Patienten
   ===================================================== */

SELECT *
FROM dbo.tvf_PatientenMitMehrerenBesuchen()
ORDER BY AnzahlPraxisbesuche DESC;
GO


/* =====================================================
   TEST 7: Tabellenwertfunktion Mitarbeiter
   ===================================================== */

SELECT *
FROM dbo.tvf_MitarbeiterUebersicht();
GO