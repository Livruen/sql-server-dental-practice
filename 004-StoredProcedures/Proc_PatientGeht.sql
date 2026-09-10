CREATE OR ALTER PROCEDURE dbo.proc_PatientGeht
    @PatientID INT
AS
BEGIN
    SET NOCOUNT ON;

    IF dbo.existPatient(@PatientID) = 0
    BEGIN
        THROW 50003, 'Patient existiert nicht.', 1
    END

    IF NOT EXISTS
    (
        SELECT 1
        FROM dbo.Praxisbesuch
        WHERE PatientID = @PatientID
          AND Verlassen IS NULL
    )
    BEGIN
        THROW 50004, 'Patient ist aktuell nicht eingecheckt.', 1
    END

    UPDATE dbo.Praxisbesuch
    SET Verlassen = SYSDATETIME()
    WHERE PatientID = @PatientID
      AND Verlassen IS NULL

END
GO