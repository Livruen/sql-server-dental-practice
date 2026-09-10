USE Zahnarztpraxis;
GO

CREATE OR ALTER TRIGGER dbo.trg_Zahn_Sperren
ON dbo.Zahn
INSTEAD OF INSERT, UPDATE, DELETE
AS
BEGIN
    THROW 51001,
          'Die Lookup-Tabelle Zahn darf nicht verändert werden.',
          1;
END;
GO