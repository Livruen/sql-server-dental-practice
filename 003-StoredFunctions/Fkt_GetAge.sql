USE Zahnarztpraxis
GO
/****** Objekt:  UserDefinedFunction [dbo].[sf_GetAge]    Skriptdatum: 27.08.2026 12:00:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Lev A. Brodski
-- Create date: 14.08.2026
-- Description:	diese Funktion berechnet Alter
-- =============================================
CREATE OR ALTER   FUNCTION dbo.AlterBerechnen
(
	@GebDat date
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Age int;
	DECLARE @Heute date;
	SET @Heute = GETDATE();
		
	IF (MONTH(@GebDat) > MONTH(@Heute)) -- Geburtsmonat erst später
		SET @Age = DATEDIFF(YEAR, @GebDat, @Heute) - 1; -- ist noch nich so alt
	ELSE IF (MONTH(@GebDat) = MONTH(@Heute) AND DAY(@GebDat) > DAY(@Heute)) -- Geburtstad ist Morgen bis Monatsende
		SET @Age = DATEDIFF(YEAR, @GebDat, @Heute) - 1; -- ist noch nich so alt
	ELSE SET @Age = DATEDIFF(YEAR, @GebDat, @Heute);	

	-- Return the result of the function
	RETURN @Age;

END
