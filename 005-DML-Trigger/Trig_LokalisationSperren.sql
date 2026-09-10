CREATE OR ALTER TRIGGER dbo.trg_Lokalisation_Sperren
ON dbo.Lokalisation
INSTEAD OF INSERT, UPDATE, DELETE
AS
BEGIN
    THROW 51004,
          'Die Lookup-Tabelle Lokalisation darf nicht verändert werden.',
          1;
END;
GO