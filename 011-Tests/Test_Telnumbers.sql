SELECT tabelle.Telnummer,
       [dbo].[Test_validateTelnummer](tabelle.Telnummer) AS gueltig

FROM (
VALUES
(N'Test'),
(N'+15750742415'),
(N'+2545875455'),
(N'+11111111111'),
(N'i358kjshysdsfs'),
(N'qewrwrwrwrw')

)
AS tabelle(Telnummer)