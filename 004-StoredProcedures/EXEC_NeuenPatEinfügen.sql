USE Zahnarztpraxis;
GO

DECLARE @Vorname       NVARCHAR(50) = N'Hans';
DECLARE @Nachname      NVARCHAR(50) = N'Peter';
DECLARE @GebDat        DATE = '1975-06-15';
DECLARE @GenderID      INT = 1;
DECLARE @Telefonnummer NVARCHAR(20) = N'+491884567890';
DECLARE @TitelID       INT = NULL;
DECLARE @Strasse       NVARCHAR(100) = N'Teststraße';
DECLARE @Hausnummer    NVARCHAR(20) = N'11';
DECLARE @PLZ           NVARCHAR(10) = N'10115';
DECLARE @StadtID       INT = 1;


EXEC dbo.proc_NeuenPatientAufnehmen
    @Vorname       = @Vorname,
    @Nachname      = @Nachname,
    @GebDat        = @GebDat,
    @GenderID      = @GenderID,
    @Telefonnummer = @Telefonnummer,
    @TitelID       = @TitelID,
    @Strasse       = @Strasse,
    @Hausnummer    = @Hausnummer,
    @PLZ           = @PLZ,
    @StadtID       = @StadtID;


SELECT
    pat.PatientID,
    per.PersonID,
    per.Vorname,
    per.Nachname,
    per.GebDat,
    per.Telefonnummer
FROM dbo.Patient AS pat
INNER JOIN dbo.Person AS per
    ON pat.PersonID = per.PersonID
WHERE per.Vorname = @Vorname
  AND per.Nachname = @Nachname;