-- Patient darf die Praxis nicht vor seiner Ankunft verlassen
ALTER TABLE dbo.Praxisbesuch
ADD CONSTRAINT CNST_Praxisbesuch_validieren_der_abmeldung
CHECK
(
    Verlassen IS NULL
    OR Verlassen >= Ankunft
);
GO