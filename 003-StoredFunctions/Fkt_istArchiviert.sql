USE Zahnarztpraxis;
GO

CREATE OR ALTER FUNCTION dbo.istArchiviert
(
    @PatientID INT
)
RETURNS BIT
AS
BEGIN

    DECLARE @Archiviert BIT;

    SELECT @Archiviert = per.Archiviert
    FROM dbo.Patient AS pat
    INNER JOIN dbo.Person AS per
        ON pat.PersonID = per.PersonID
    WHERE pat.PatientID = @PatientID;

    RETURN @Archiviert;

END;
GO