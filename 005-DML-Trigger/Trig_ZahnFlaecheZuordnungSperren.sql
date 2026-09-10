CREATE OR ALTER TRIGGER dbo.trg_ZahnHatFlaeche_Sperren
ON dbo.ZahnHatFlaeche
INSTEAD OF INSERT, UPDATE, DELETE
AS
BEGIN
    THROW 51003,
          'Die Zuordnung ZahnHatFlaeche darf nicht verändert werden.',
          1;
END;
GO