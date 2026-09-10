USE Zahnarztpraxis;
GO

/* ===============================================
   TEST 1: Existiert Patient?
   =============================================== */

SELECT
    dbo.existPatient(10) AS ExistierenderPatient,
    dbo.existPatient(999999) AS NichtExistierenderPatient;


/* ===============================================
   TEST 2: Ist Patient archiviert?
   PatientID 3 = Hedwig Weinberg, archiviert
   PatientID 10 = Elize Rasmus, aktiv
   =============================================== */

SELECT
    dbo.istArchiviert(3) AS ArchivierterPatient,
    dbo.istArchiviert(10) AS AktiverPatient;


/* ===============================================
   TEST 3: Alter berechnen
   =============================================== */

SELECT
    [dbo].[AlterBerechnen]('2000-01-01') AS BerechnetesAlter;


/* ===============================================
   TEST 4: Existiert Person?
   =============================================== */

SELECT
    [dbo].[existPerson](
        N'Elize',
        N'Rasmus',
        '2010-11-01',
        1
    ) AS PersonExistiert


/* ===============================================
   TEST 5: Tabellenwertfunktion Patienten
   =============================================== */

SELECT *
FROM dbo.tvf_PatientenMitMehrerenBesuchen()
ORDER BY AnzahlPraxisbesuche DESC;


/* ===============================================
   TEST 6: Tabellenwertfunktion Mitarbeiter
   =============================================== */

SELECT *
FROM dbo.tvf_MitarbeiterUebersicht();