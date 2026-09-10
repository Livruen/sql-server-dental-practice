-- Seitenzähne: Prämolaren + Molaren
INSERT INTO dbo.ZahnHatFlaeche
    (ZahnID, ZahnflaechenID)
SELECT
    z.ZahnID,
    f.ZahnfalecheID
FROM dbo.Zahn AS z
CROSS JOIN dbo.Zahnflaeche AS f
WHERE RIGHT(z.ZahnCODE, 1) IN ('4', '5', '6', '7', '8')
  AND f.FlaechenCODE IN ('M', 'D', 'O', 'B', 'L');