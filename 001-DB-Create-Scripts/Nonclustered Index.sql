-- Ein Patient darf beliebig viele abgeschlossene Besuche haben, 
-- aber höchstens einen gleichzeitig offenen.
CREATE UNIQUE NONCLUSTERED INDEX
UX_Praxisbesuch_OffenerBesuch
ON dbo.Praxisbesuch(PatientID)
WHERE Verlassen IS NULL;