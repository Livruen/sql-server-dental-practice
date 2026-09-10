USE Zahnarztpraxis;
GO
-- Tabellenwertfunktion zählt wie viele besuche patinten hatten
-- und zeigt die > 1 an
CREATE OR ALTER FUNCTION dbo.tvf_PatientenMitMehrerenBesuchen()
RETURNS TABLE
AS
RETURN
(
    SELECT
        pat.PatientID,
        per.Vorname,
        per.Nachname,
        per.GebDat,
        dbo.AlterBerechnen(per.GebDat) AS Lebensalter,
        COUNT(pb.PraxisbesuchID) AS AnzahlPraxisbesuche

    FROM dbo.Patient AS pat

    INNER JOIN dbo.Person AS per
        ON pat.PersonID = per.PersonID

    INNER JOIN dbo.Praxisbesuch AS pb
        ON pat.PatientID = pb.PatientID

    GROUP BY
        pat.PatientID,
        per.Vorname,
        per.Nachname,
        per.GebDat

    HAVING COUNT(pb.PraxisbesuchID) > 1
);
GO