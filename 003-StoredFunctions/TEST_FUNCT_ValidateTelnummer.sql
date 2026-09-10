USE Zahnarztpraxis
GO
CREATE OR ALTER FUNCTION dbo.Test_validateTelnummer ( @Telnummer NVARCHAR(50)) RETURNS BIT

AS
    
    BEGIN
    -- -- https://stackoverflow.com/questions/65313573/how-to-insert-check-constraint-for-phone-number-in-mysql
          IF REGEXP_LIKE(@Telnummer, '^[+][0-9]{11}$') RETURN 1
    RETURN 0
END

