CREATE OR ALTER TRIGGER dbo.trg_Zahnflaeche_Sperren
ON dbo.Zahnflaeche
INSTEAD OF INSERT, UPDATE, DELETE
AS
BEGIN
    THROW 51002,
          'Die Lookup-Tabelle Zahnflaeche darf nicht verändert werden.',
          1;
END;
GO