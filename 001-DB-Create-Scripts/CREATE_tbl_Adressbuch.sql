USE [Zahnarztpraxis]
GO

/****** Objekt:  Table [dbo].[Adressbuch]    Skriptdatum: 27.08.2026 14:58:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Adressbuch](
	[AdressenID] [int] IDENTITY(1,1) NOT NULL,
	[Strasse] [nvarchar](50) NOT NULL,
	[Hausnummer] [int] NULL,
	[PLZ] [int] NOT NULL,
	[StadtID] [int] NOT NULL,
 CONSTRAINT [PK_Adressbuch_1] PRIMARY KEY CLUSTERED 
(
	[AdressenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Adressbuch]  WITH CHECK ADD  CONSTRAINT [FK_Adressbuch_Stadt] FOREIGN KEY([StadtID])
REFERENCES [dbo].[Stadt] ([StadtID])
GO

ALTER TABLE [dbo].[Adressbuch] CHECK CONSTRAINT [FK_Adressbuch_Stadt]
GO

