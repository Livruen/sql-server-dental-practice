USE Zahnarztpraxis
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE OR ALTER PROCEDURE dbo.BackupZahnarztPraxis
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @BackupFile NVARCHAR(MAX); -- path + file name	
	SET @BackupFile = 'D:\KURSE\AlfaTraining\SQL-Kurs\Zahnarztpraxis\backup\backupZHN_' 
					  + dbo.sf_Zeitstempel()
					  + '.bak';

   	BACKUP DATABASE Zahnarztpraxis TO DISK = @BackupFile;
    
END
