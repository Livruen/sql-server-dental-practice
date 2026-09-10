USE Zahnarztpraxis;
GO

CREATE OR ALTER FUNCTION dbo.tvf_MitarbeiterUebersicht()
RETURNS TABLE
AS
RETURN
(
    SELECT
        ISNULL(t.Titel_name, '') AS Titel,
        p.Vorname,
        p.Nachname,

        CASE
            WHEN m.Extern = 1 THEN 'Ja'
            ELSE ''
        END AS Externe,

        COUNT(mhb.BerufID) AS AnzahlBerufe,

        STRING_AGG(b.Beruf_name, ', ') AS Berufe

    FROM dbo.Person AS p

    INNER JOIN dbo.Mitarbeiter AS m
        ON p.PersonID = m.PersonenID

    INNER JOIN dbo.MitarbeiterHatBeruf AS mhb
        ON m.MitarbeiterID = mhb.MitarbeiterID

    INNER JOIN dbo.Beruf AS b
        ON mhb.BerufID = b.BerufID

    LEFT JOIN dbo.Titel AS t
        ON p.TitelID = t.TitelID

    GROUP BY
        t.Titel_name,
        p.Vorname,
        p.Nachname,
        m.Extern
);
GO