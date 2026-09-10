EXECUTE AS USER = 'Chef';

INSERT INTO dbo.Diagnose
(
    ICD10CODE,
    Diagnose_name
)
VALUES
(
    'K99.9',
    N'Testdiagnose'
);

REVERT;