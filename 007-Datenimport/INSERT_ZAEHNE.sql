USE Zahnarztpraxis
GO
INSERT INTO dbo.Zahn (ZahnCODE, Zahn_name)
VALUES
-- Bleibende Zähne: Oberkiefer rechts
('11', N'OK rechts zentraler Schneidezahn'),
('12', N'OK rechts seitlicher Schneidezahn'),
('13', N'OK rechts Eckzahn'),
('14', N'OK rechts 1. Prämolar'),
('15', N'OK rechts 2. Prämolar'),
('16', N'OK rechts 1. Molar'),
('17', N'OK rechts 2. Molar'),
('18', N'OK rechts 3. Molar / Weisheitszahn'),

-- Bleibende Zähne: Oberkiefer links
('21', N'OK links zentraler Schneidezahn'),
('22', N'OK links seitlicher Schneidezahn'),
('23', N'OK links Eckzahn'),
('24', N'OK links 1. Prämolar'),
('25', N'OK links 2. Prämolar'),
('26', N'OK links 1. Molar'),
('27', N'OK links 2. Molar'),
('28', N'OK links 3. Molar / Weisheitszahn'),

-- Bleibende Zähne: Unterkiefer links
('31', N'UK links zentraler Schneidezahn'),
('32', N'UK links seitlicher Schneidezahn'),
('33', N'UK links Eckzahn'),
('34', N'UK links 1. Prämolar'),
('35', N'UK links 2. Prämolar'),
('36', N'UK links 1. Molar'),
('37', N'UK links 2. Molar'),
('38', N'UK links 3. Molar / Weisheitszahn'),

-- Bleibende Zähne: Unterkiefer rechts
('41', N'UK rechts zentraler Schneidezahn'),
('42', N'UK rechts seitlicher Schneidezahn'),
('43', N'UK rechts Eckzahn'),
('44', N'UK rechts 1. Prämolar'),
('45', N'UK rechts 2. Prämolar'),
('46', N'UK rechts 1. Molar'),
('47', N'UK rechts 2. Molar'),
('48', N'UK rechts 3. Molar / Weisheitszahn'),

-- Milchzähne: Oberkiefer rechts
('51', N'OK rechts zentraler Milchschneidezahn'),
('52', N'OK rechts seitlicher Milchschneidezahn'),
('53', N'OK rechts Milcheckzahn'),
('54', N'OK rechts 1. Milchmolar'),
('55', N'OK rechts 2. Milchmolar'),

-- Milchzähne: Oberkiefer links
('61', N'OK links zentraler Milchschneidezahn'),
('62', N'OK links seitlicher Milchschneidezahn'),
('63', N'OK links Milcheckzahn'),
('64', N'OK links 1. Milchmolar'),
('65', N'OK links 2. Milchmolar'),

-- Milchzähne: Unterkiefer links
('71', N'UK links zentraler Milchschneidezahn'),
('72', N'UK links seitlicher Milchschneidezahn'),
('73', N'UK links Milcheckzahn'),
('74', N'UK links 1. Milchmolar'),
('75', N'UK links 2. Milchmolar'),

-- Milchzähne: Unterkiefer rechts
('81', N'UK rechts zentraler Milchschneidezahn'),
('82', N'UK rechts seitlicher Milchschneidezahn'),
('83', N'UK rechts Milcheckzahn'),
('84', N'UK rechts 1. Milchmolar'),
('85', N'UK rechts 2. Milchmolar');