USE Zahnarztpraxis;
GO

-- darf Diagnosekatalog lesen
GRANT SELECT
ON dbo.Diagnose
TO Praxispersonal;
GO

-- darf die beiden Prozesse ausführen
GRANT EXECUTE
ON dbo.proc_PatientKommtAn
TO Praxispersonal;
GO

GRANT EXECUTE
ON [dbo].[proc_PatientGeht]
TO Praxispersonal;
GO