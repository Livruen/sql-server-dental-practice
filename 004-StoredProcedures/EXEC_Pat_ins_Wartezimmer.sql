-- Pat kommt in die Praxis wird eingecheckt mit seiner KV-Karte 
-- und ein Button im Forntend lösst diese Procedur aus
-- Pat. ist im Wartezimmer

EXEC dbo.proc_PatientKommtAn
    @PatientID = 1;