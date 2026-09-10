USE Zahnarztpraxis;
GO


/* ============================================================
   TEST 1
   PROCEDURE: proc_PatientKommtAn
   PatientID 10 = Elize Rasmus

   Erwartung:
   - Wenn sie nicht in der Praxis ist:
     neuer Praxisbesuch wird angelegt.
   - Wenn sie bereits eingecheckt ist:
     entsprechende Meldung.
   ============================================================ */

DECLARE @Meldung NVARCHAR(200);

EXEC dbo.proc_PatientKommtAn
    @PatientID = 10,
    @Meldung = @Meldung OUTPUT;

SELECT @Meldung AS Ergebnis_PatientKommtAn;

-- Kontrolle
SELECT TOP 1
    PraxisbesuchID,
    PatientID,
    Ankunft,
    Verlassen
FROM dbo.Praxisbesuch
WHERE PatientID = 10
ORDER BY Ankunft DESC;
GO



/* ============================================================
   TEST 2
   PROCEDURE: proc_PatientGeht

   Erwartung:
   Der aktuell offene Praxisbesuch von Patient 10
   bekommt eine Verlassen-Zeit.
   ============================================================ */

EXEC dbo.proc_PatientGeht
    @PatientID = 10;

-- Kontrolle
SELECT TOP 1
    PraxisbesuchID,
    PatientID,
    Ankunft,
    Verlassen
FROM dbo.Praxisbesuch
WHERE PatientID = 10
ORDER BY Ankunft DESC;
GO



/* ============================================================
   TEST 3
   PROCEDURE: proc_NeuenPatientAufnehmen

   Testpatient wird über Parameter übergeben.
   ============================================================ */

--DECLARE @Vorname       NVARCHAR(50)  = N'Max';
--DECLARE @Nachname      NVARCHAR(50)  = N'ProcedureTest';
--DECLARE @GebDat        DATE          = '1990-05-20';
--DECLARE @GenderID      INT           = 2;
--DECLARE @Telefonnummer NVARCHAR(20)  = N'+491234567891';
--DECLARE @TitelID       INT           = NULL;
--DECLARE @Strasse       NVARCHAR(100) = N'Testweg';
--DECLARE @Hausnummer    NVARCHAR(20)  = N'5';
--DECLARE @PLZ           NVARCHAR(10)  = N'10115';
--DECLARE @StadtID       INT           = 1;


--EXEC dbo.proc_NeuenPatientAufnehmen
--    @Vorname       = @Vorname,
--    @Nachname      = @Nachname,
--    @GebDat        = @GebDat,
--    @GenderID      = @GenderID,
--    @Telefonnummer = @Telefonnummer,
--    @TitelID       = @TitelID,
--    @Strasse       = @Strasse,
--    @Hausnummer    = @Hausnummer,
--    @PLZ           = @PLZ,
--    @StadtID       = @StadtID;


---- Kontrolle:
---- Wurde Person + Patient korrekt angelegt?
--SELECT
--    pat.PatientID,
--    per.PersonID,
--    per.Vorname,
--    per.Nachname,
--    per.GebDat,
--    per.Telefonnummer
--FROM dbo.Patient AS pat

--INNER JOIN dbo.Person AS per
--    ON pat.PersonID = per.PersonID

--WHERE per.Vorname = @Vorname
--  AND per.Nachname = @Nachname
--  AND per.GebDat = @GebDat;
--GO



/* ============================================================
   TEST 4
   FEHLERTEST: proc_NeuenPatientAufnehmen

   Derselbe Patient wird erneut angelegt.
   Erwartung:
   Duplicate-Prüfung soll ihn ablehnen.
   ============================================================ */
   --ACHTUNG MUSS AUSKOIMENTIERT SEIN
--EXEC dbo.proc_NeuenPatientAufnehmen
--    @Vorname       = N'Max',
--    @Nachname      = N'ProcedureTest',
--    @GebDat        = '1990-05-20',
--    @GenderID      = 2,
--    @Telefonnummer = N'+491234567891',
--    @TitelID       = NULL,
--    @Strasse       = N'Testweg',
--    @Hausnummer    = N'5',
--    @PLZ           = N'10115',
--    @StadtID       = 1;
--GO



/* ============================================================
   TEST 5
   FEHLERTEST: proc_PatientKommtAn

   Nicht existierende PatientID.
   Erwartung:
   Meldung "Patient existiert nicht"
   ============================================================ */

DECLARE @FehlerMeldung NVARCHAR(200);

EXEC dbo.proc_PatientKommtAn
    @PatientID = 999999,
    @Meldung = @FehlerMeldung OUTPUT;

SELECT @FehlerMeldung AS ErwarteterFehler;
GO



/* ============================================================
   TEST 6
   PROCEDURE: BackupZahnarztPraxis

   Achtung:
   Dieser Test erzeugt tatsächlich ein Backup.
   ============================================================ */

EXEC dbo.BackupZahnarztPraxis;
GO