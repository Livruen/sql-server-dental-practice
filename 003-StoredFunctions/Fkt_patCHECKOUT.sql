USE Zahnarztpraxis
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- hat der pat die praxis verlassen?
CREATE OR ALTER FUNCTION patientCHECKOUT(@PatientID int) RETURNS bit
AS
BEGIN
	IF EXISTS (
		SELECT 1
        FROM dbo.Praxisbesuch
        WHERE PatientID = @PatientID
        AND Verlassen IS NULL
	)RETURN 0

	RETURN 1
END