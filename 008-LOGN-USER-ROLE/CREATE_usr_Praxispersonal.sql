USE Zahnarztpraxis;
GO

CREATE ROLE Praxispersonal;
GO

-- Diagnosekatalog darf gelesen werden
GRANT SELECT
ON dbo.Diagnose
TO Praxispersonal;
GO

-- Testbenutzer
CREATE USER Mitarbeiter WITHOUT LOGIN;
GO

ALTER ROLE Praxispersonal
ADD MEMBER Mitarbeiter;
GO