USE Zahnarztpraxis
GO

ALTER TABLE dbo.Person
ADD CONSTRAINT CNSTR_valid_GebDATE
CHECK (GebDat <= getDate())
