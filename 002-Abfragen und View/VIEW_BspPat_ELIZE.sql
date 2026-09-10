USE [Zahnarztpraxis]
GO

/****** Objekt:  View [dbo].[View_ELIZE]    Skriptdatum: 27.08.2026 15:03:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[View_ELIZE]
AS
SELECT TOP (100) PERCENT pePatient.Vorname, pePatient.Nachname, pePatient.GebDat, pb.Ankunft, pb.Verlassen, d.ICD10CODE, d.Diagnose_name, z.ZahnCODE, z.Zahn_name, dbo.Zahnflaeche.Flaechen_name, l.Lokalisation_name, phd.ErfasstAm, peMitarbeiter.Vorname AS ErfasstVon_Vorname, 
              peMitarbeiter.Nachname AS ErfasstVon_Nachname
FROM    dbo.ZahnHatFlaeche INNER JOIN
              dbo.Zahn AS z ON dbo.ZahnHatFlaeche.ZahnID = z.ZahnID INNER JOIN
              dbo.Zahnflaeche ON dbo.ZahnHatFlaeche.ZahnflaechenID = dbo.Zahnflaeche.ZahnfalecheID RIGHT OUTER JOIN
              dbo.Praxisbesuch AS pb INNER JOIN
              dbo.Patient AS pat ON pb.PatientID = pat.PatientID INNER JOIN
              dbo.Person AS pePatient ON pat.PersonID = pePatient.PersonID LEFT OUTER JOIN
              dbo.PatientHatDiagnose AS phd ON pb.PraxisbesuchID = phd.PraxisbesuchID LEFT OUTER JOIN
              dbo.Diagnose AS d ON phd.DiagnoseID = d.DiagnoseID ON z.ZahnID = phd.ZahnID LEFT OUTER JOIN
              dbo.Lokalisation AS l ON phd.LokalisationID = l.LokalisationID LEFT OUTER JOIN
              dbo.Mitarbeiter AS m ON phd.ErfasstVomMitarbeiter = m.MitarbeiterID LEFT OUTER JOIN
              dbo.Person AS peMitarbeiter ON m.PersonenID = peMitarbeiter.PersonID
WHERE  (pePatient.Vorname = N'Elize') AND (pePatient.Nachname = N'Rasmus')
ORDER BY pb.Ankunft DESC, phd.ErfasstAm
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[32] 2[14] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ZahnHatFlaeche"
            Begin Extent = 
               Top = 39
               Left = 1024
               Bottom = 211
               Right = 1360
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "z"
            Begin Extent = 
               Top = 196
               Left = 750
               Bottom = 383
               Right = 980
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Zahnflaeche"
            Begin Extent = 
               Top = 0
               Left = 1475
               Bottom = 172
               Right = 1710
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pb"
            Begin Extent = 
               Top = 448
               Left = 692
               Bottom = 647
               Right = 925
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pat"
            Begin Extent = 
               Top = 9
               Left = 430
               Bottom = 154
               Right = 660
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pePatient"
            Begin Extent = 
               Top = 9
               Left = 61
               Bottom = 299
               Right = 369
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "phd"
            Begin Extent = 
               Top = 286
               Left = 1087
               Bottom = 600
               Right = 1380
            End
            DisplayFlags = 280
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_ELIZE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 307
               Left = 1603
               Bottom = 490
               Right = 1841
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "l"
            Begin Extent = 
               Top = 545
               Left = 1604
               Bottom = 690
               Right = 1864
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "m"
            Begin Extent = 
               Top = 317
               Left = 61
               Bottom = 489
               Right = 291
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "peMitarbeiter"
            Begin Extent = 
               Top = 317
               Left = 352
               Bottom = 516
               Right = 660
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 15
         Width = 284
         Width = 673
         Width = 1496
         Width = 1496
         Width = 1767
         Width = 1833
         Width = 1234
         Width = 1973
         Width = 1496
         Width = 1496
         Width = 2693
         Width = 1496
         Width = 1496
         Width = 1496
         Width = 1496
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 898
         Table = 1973
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1346
         SortOrder = 1412
         GroupBy = 1350
         Filter = 1346
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_ELIZE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_ELIZE'
GO

