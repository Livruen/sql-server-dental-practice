UPDATE phd
SET phd.PraxisbesuchID = pb.PraxisbesuchID
FROM dbo.PatientHatDiagnose AS phd

INNER JOIN
(
    VALUES
        (1,  1),
        (2,  2),
        (3,  2),
        (4,  3),
        (5,  4),
        (6,  5),
        (7,  5),
        (8,  6),
        (9,  6),
        (10, 7),
        (11, 8),
        (12, 9),
        (13, 10),
        (14, 11),
        (15, 12),
        (16, 13),
        (17, 14),
        (18, 15),
        (19, 15),
        (20, 16),
        (21, 16),
        (22, 17),
        (23, 18),
        (24, 18)
) AS Zuordnung(PatientDiagnoseID, PatientID)
    ON phd.PatientDiagnoseID = Zuordnung.PatientDiagnoseID

INNER JOIN dbo.Praxisbesuch AS pb
    ON pb.PatientID = Zuordnung.PatientID
    AND phd.ErfasstAm >= pb.Ankunft
    AND phd.ErfasstAm <= pb.Verlassen;