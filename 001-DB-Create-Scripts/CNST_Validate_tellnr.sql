USE Zahnarztpraxis
GO
-- https://stackoverflow.com/questions/65313573/how-to-insert-check-constraint-for-phone-number-in-mysql
ALTER TABLE dbo.Person
ADD CONSTRAINT valid_telnr
CHECK ((REGEXP_LIKE(Telefonnummer, '^[+][0-9]{12}$')))