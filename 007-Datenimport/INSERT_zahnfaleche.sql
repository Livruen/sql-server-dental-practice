USE Zahnarztpraxis
GO
INSERT INTO dbo.Zahnflaeche

    (FlaechenCode, Flaechen_name)
VALUES
('M', N'mesial'),
('D', N'distal'),
('O', N'okklusal'),
('I', N'inzisal'),
('B', N'bukkal'),
('V', N'vestibulär'),
('L', N'lingual');