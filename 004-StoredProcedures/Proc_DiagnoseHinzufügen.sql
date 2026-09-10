CREATE OR ALTER PROCEDURE dbo.proc_DiagnoseHinzufuegen
(
    @PatientID INT,
    @ICD10CODE VARCHAR(10), -- z.b dropdown mit search
    @ZahnCODE VARCHAR(2), -- bilder zum ancklicken
    @MitarbeiterID INT
)
AS
BEGIN

    INSERT INTO dbo.PatientHatDiagnose
    (
        DiagnoseID,
        ZahnID,
        LokalisationID,
        ErfasstAm,
        ErfasstVomMitarbeiter,
        PraxisbesuchID
    )

    SELECT
        d.DiagnoseID,
        z.ZahnID,
        NULL,
        SYSDATETIME(),
        @MitarbeiterID,
        pb.PraxisbesuchID

    FROM dbo.Praxisbesuch AS pb

    INNER JOIN dbo.Diagnose AS d
        ON d.ICD10CODE = @ICD10CODE

    INNER JOIN dbo.Zahn AS z
        ON z.ZahnCODE = @ZahnCODE

    WHERE pb.PatientID = @PatientID
      AND pb.Verlassen IS NULL;

END;
GO