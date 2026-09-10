-- funktion zeitstempel 

USE Zahnarztpraxis
GO
/****** Objekt:  UserDefinedFunction [dbo].[sf_Zeitstempel]    Skriptdatum: 26.08.2026 09:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	Die Funktion generiert so was: 20210105-105151150
-- =============================================
CREATE OR ALTER   FUNCTION [dbo].[sf_Zeitstempel] 
(
)
RETURNS char(18)
AS
BEGIN
	
	RETURN FORMAT(GETDATE(), 'yyyyMMdd-HHmmssfff');

END
