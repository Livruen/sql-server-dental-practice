USE [Zahnarztpraxis]
GO

/****** Objekt:  Table [dbo].[Person]    Skriptdatum: 27.08.2026 14:57:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Person](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[TitelID] [int] NULL,
	[Vorname] [nvarchar](50) NOT NULL,
	[Nachname] [nvarchar](50) NOT NULL,
	[GebDat] [date] NOT NULL,
	[AdresseID] [int] NULL,
	[Telefonnummer] [nvarchar](50) NULL,
	[GenderID] [int] NULL,
	[Archiviert] [bit] NOT NULL,
	[Grund_der_archivierung] [nvarchar](50) NULL,
	[Notizen] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Person] ADD  CONSTRAINT [DF_Person_Archiviert]  DEFAULT ((0)) FOR [Archiviert]
GO

ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Adressbuch] FOREIGN KEY([AdresseID])
REFERENCES [dbo].[Adressbuch] ([AdressenID])
GO

ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_Adressbuch]
GO

ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Gender] FOREIGN KEY([GenderID])
REFERENCES [dbo].[Gender] ([GenderID])
GO

ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_Gender]
GO

ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Titel] FOREIGN KEY([TitelID])
REFERENCES [dbo].[Titel] ([TitelID])
GO

ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_Titel]
GO

ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [CNSTR_valid_GebDATE] CHECK  (([GebDat]<=getdate()))
GO

ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [CNSTR_valid_GebDATE]
GO

ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [valid_telnr] CHECK  ((regexp_like([Telefonnummer],'^[+][0-9]{12}$')))
GO

ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [valid_telnr]
GO

