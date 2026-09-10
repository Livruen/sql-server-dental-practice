USE Zahnarztpraxis
GO
SELECT t.testdata,
      [dbo].[existPatient](testdata) AS exist
FROM (
    VALUES
       (1),
       (12),
       (200),
       ('2')
) 
AS t(testdata)
