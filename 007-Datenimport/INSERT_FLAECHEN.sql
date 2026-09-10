USE Zahnarztpraxis
GO

INSERT INTO dbo.ZahnHatFlaeche (ZahnID, ZahnflaechenID)
SELECT 
   z.ZahnID,
   f.ZahnfalecheID
FROM dbo.Zahn AS z
CROSS JOIN dbo.Zahnflaeche AS f
WHERE RIGHT(z.ZahnCODE, 1) IN ('1', '2', '3')
  AND f.FlaechenCODE IN ('M', 'D', 'I', 'V', 'L');