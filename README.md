# Projektbeschreibung – Zahnarztpraxis
## Abschlussprojekt SQL – alfatraining Bildungszentrum GmbH 
### Projekt: Relationale Datenbank für eine Zahnarztpraxis 
### Author: Natasza Szczypien
### Stand: August 2026

# Businesslogik:
• Die Datenbank bildet die grundlegenden Geschäftsprozesse einer Zahnarztpraxis ab. Personen werden zentral in der Tabelle Person gespeichert und können anschließend als Patient und/oder Mitarbeiter geführt werden. Dadurch kann beispielsweise eine Person gleichzeitig langjährige Patientin und Mitarbeiterin der Praxis sein.
• Zu einer Person werden unter anderem Name, Geburtsdatum, Telefonnummer, Geschlecht, Titel und Adresse gespeichert. Adressen sind über Stadt und Land normalisiert. Patienten können archiviert werden, ohne ihre historischen Daten zu löschen.
• Mitarbeiter können einen oder mehrere Berufe bzw. Fachbereiche besitzen. Die Zuordnung erfolgt über eine m:n-Beziehung zwischen Mitarbeiter und Beruf.
• Ein Patient kann die Praxis mehrmals besuchen. Für jeden Praxisbesuch werden Ankunfts- und Verlassenszeit gespeichert. Mehrere Besuche am selben Tag sind möglich, ein Patient darf jedoch nicht gleichzeitig mehrere offene Praxisbesuche besitzen.
• Beim Check-in wird geprüft, ob der Patient existiert und nicht archiviert ist. Über gespeicherte Prozeduren werden die Geschäftsprozesse „Patient kommt an“ und „Patient verlässt die Praxis“ umgesetzt.
• Diagnosen werden einem konkreten Praxisbesuch zugeordnet. Dabei werden ICD-10-Code, Diagnose, Zahn bzw. Lokalisation, Erfassungszeitpunkt und erfassender Mitarbeiter gespeichert. Dadurch bleibt nachvollziehbar, bei welchem Besuch eine Diagnose dokumentiert wurde.
• Für zahnbezogene Daten werden Lookup-Tabellen für Zähne nach FDI-Schema, Zahnflächen und Lokalisationen verwendet. Feste Lookup-Daten werden durch Trigger vor unbeabsichtigten Änderungen geschützt.

# Technische Umsetzung
• Die Datenbank wurde relational modelliert und durch Primärschlüssel, Fremdschlüssel, UNIQUE- und CHECK-Constraints gegen inkonsistente Daten abgesichert.
• Ein NONCLUSTERED INDEX unterstützt die Suche und verhindert gleichzeitig mehrere offene Praxisbesuche für denselben Patienten.
• Mehrere Views stellen Daten für unterschiedliche Anwendungsfälle bereit, darunter Patienten- und Mitarbeiterübersichten sowie historische Praxisbesuche. Verwendet werden INNER JOIN, LEFT OUTER JOIN, GROUP BY, COUNT und HAVING.
• Eigene Skalarwertfunktionen übernehmen wiederverwendbare Prüfungen und Berechnungen, beispielsweise die Altersberechnung. Zusätzlich werden Tabellenwertfunktionen für komplexere Ergebnismengen verwendet.
• Stored Procedures bilden Geschäftsprozesse wie Patientenaufnahme, Check-in und Check-out ab und verwenden eigene Funktionen, Parameter, Transaktionen und Fehlerbehandlung.
• DML-Trigger schützen fest definierte Lookup-Tabellen.
• Über die Rollen Praxispersonal und Praxisleitung werden unterschiedliche Berechtigungen vergeben. Beispielsweise darf der Diagnosekatalog nur durch die Praxisleitung verändert werden.
• Die Datenbank wird durch ein Backup gesichert; sämtliche Datenbankobjekte, Tests und Berechtigungsskripte werden als SQL-Skripte dokumentiert.
