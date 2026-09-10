# ============================================================
# ZAHNARZTPRAXIS - SHINY FRONTEND
# ============================================================

library(shiny)
library(DBI)
library(odbc)


# ============================================================
# 1. SQL-SERVER-VERBINDUNG
# ============================================================

con <- dbConnect(
  odbc::odbc(),
  
  Driver = "ODBC Driver 18 for SQL Server",
  
  # HIER DEINEN FUNKTIONIERENDEN SERVERNAMEN EINTRAGEN
  Server = "localhost",
  
  Database = "Zahnarztpraxis",
  
  Trusted_Connection = "Yes",
  
  TrustServerCertificate = "Yes"
)


# ============================================================
# 2. USER INTERFACE
# ============================================================

ui <- fluidPage(
  
  titlePanel("Zahnarztpraxis"),
  
  tabsetPanel(
    
    
    # ========================================================
    # TAB 1 - REZEPTION
    # ========================================================
    
    tabPanel(
      
      "Rezeption",
      
      br(),
      
      h2("Patient auswählen"),
      
      selectInput(
        "patient_id",
        "Patient:",
        choices = NULL,
        width = "500px"
      ),
      
      actionButton(
        "ankommen",
        "Patient kommt an"
      ),
      
      actionButton(
        "geht",
        "Patient geht"
      ),
      
      actionButton(
        "refresh",
        "Aktualisieren"
      ),
      
      br(),
      br(),
      
      h2("Aktuell in der Praxis"),
      
      h4(
        textOutput("anzahl_patienten")
      ),
      
      tableOutput(
        "patienten_aktuell"
      ),
      
      br(),
      br(),
      
      h2("Alle aktiven Patienten"),
      
      tableOutput(
        "patienten_liste_rezeption"
      )
      
    ),
    
    
    # ========================================================
    # TAB 2 - NEUER PATIENT
    # ========================================================
    
    tabPanel(
      
      "Neuer Patient",
      
      br(),
      
      h2("Neuen Patienten aufnehmen"),
      
      fluidRow(
        
        column(
          
          4,
          
          textInput(
            "vorname",
            "Vorname"
          ),
          
          textInput(
            "nachname",
            "Nachname"
          ),
          
          dateInput(
            "gebdat",
            "Geburtsdatum",
            format = "dd.mm.yyyy"
          ),
          
          numericInput(
            "gender_id",
            "GenderID",
            value = 1,
            min = 1
          ),
          
          textInput(
            "telefon",
            "Telefonnummer",
            value = "+491234567890"
          )
          
        ),
        
        column(
          
          4,
          
          numericInput(
            "titel_id",
            "TitelID (0 = kein Titel)",
            value = 0,
            min = 0
          ),
          
          textInput(
            "strasse",
            "Straße"
          ),
          
          textInput(
            "hausnummer",
            "Hausnummer"
          ),
          
          textInput(
            "plz",
            "PLZ"
          ),
          
          numericInput(
            "stadt_id",
            "StadtID",
            value = 1,
            min = 1
          )
          
        )
        
      ),
      
      actionButton(
        "patient_anlegen",
        "Patient aufnehmen"
      ),
      
      br(),
      br(),
      
      h2("Patientenliste"),
      
      tableOutput(
        "patienten_liste"
      )
      
    ),
    
    
    # ========================================================
    # TAB 3 - PATIENTENAKTE
    # ========================================================
    
    tabPanel(
      
      "Patientenakte",
      
      br(),
      
      h2("Patient auswählen"),
      
      selectInput(
        "akte_patient_id",
        "Patient:",
        choices = NULL,
        width = "500px"
      ),
      
      br(),
      
      h2("Stammdaten"),
      
      tableOutput(
        "akte_stammdaten"
      ),
      
      br(),
      br(),
      
      h2("Praxisbesuche und Diagnosen"),
      
      tableOutput(
        "akte_verlauf"
      )
      
    ),
    
    
    # ========================================================
    # TAB 4 - DIAGNOSE
    # ========================================================
    
    tabPanel(
      
      "Diagnose",
      
      br(),
      
      h2("Diagnose dokumentieren"),
      
      selectInput(
        "diagnose_patient_id",
        "Patient:",
        choices = NULL,
        width = "500px"
      ),
      
      selectInput(
        "icd_code",
        "ICD-10-Diagnose:",
        choices = NULL,
        width = "500px"
      ),
      
      textInput(
        "zahn_code",
        "Zahn:",
        value = "16"
      ),
      
      numericInput(
        "mitarbeiter_id",
        "MitarbeiterID:",
        value = 6,
        min = 1
      ),
      
      actionButton(
        "diagnose_speichern",
        "Diagnose speichern"
      ),
      
      br(),
      br(),
      
      h2("Diagnosehistorie"),
      
      tableOutput(
        "diagnose_historie"
      ),
      
      br(),
      br(),
      
      h2("Zahnflächen-Stammdaten"),
      
      p(
        "Die Zahnflächen sind als eigene Stammdaten normalisiert."
      ),
      
      tableOutput(
        "zahnflaechen_liste"
      )
      
    )
    
  )
  
)


# ============================================================
# 3. SERVER
# ============================================================

server <- function(input, output, session) {
  
  
  # ==========================================================
  # REFRESH
  # ==========================================================
  
  refresh_counter <- reactiveVal(0)
  
  
  refresh_data <- function() {
    
    refresh_counter(
      refresh_counter() + 1
    )
    
  }
  
  
  # ==========================================================
  # PATIENTEN
  # ==========================================================
  
  patienten <- reactive({
    
    refresh_counter()
    
    dbGetQuery(
      
      con,
      
      "
      SELECT
          pat.PatientID,
          per.PersonID,
          per.Vorname,
          per.Nachname,

          FORMAT(
              per.GebDat,
              'dd.MM.yyyy'
          ) AS Geburtsdatum,

          per.Telefonnummer

      FROM dbo.Patient AS pat

      INNER JOIN dbo.Person AS per
          ON pat.PersonID = per.PersonID

      WHERE per.Archiviert = 0

      ORDER BY
          per.Nachname,
          per.Vorname;
      "
      
    )
    
  })
  
  
  # ==========================================================
  # ICD-10-DIAGNOSEN
  # ==========================================================
  
  diagnosen <- reactive({
    
    refresh_counter()
    
    dbGetQuery(
      
      con,
      
      "
      SELECT
          ICD10CODE,
          Diagnose_name

      FROM dbo.Diagnose

      ORDER BY ICD10CODE;
      "
      
    )
    
  })
  
  
  # ==========================================================
  # PATIENTEN-DROPDOWNS
  # ==========================================================
  
  observe({
    
    p <- patienten()
    
    patient_choices <- setNames(
      
      as.character(
        p$PatientID
      ),
      
      paste0(
        p$PatientID,
        " - ",
        p$Vorname,
        " ",
        p$Nachname
      )
      
    )
    
    
    updateSelectInput(
      session,
      "patient_id",
      choices = patient_choices
    )
    
    
    updateSelectInput(
      session,
      "akte_patient_id",
      choices = patient_choices
    )
    
    
    updateSelectInput(
      session,
      "diagnose_patient_id",
      choices = patient_choices
    )
    
  })
  
  
  # ==========================================================
  # ICD-10-DROPDOWN
  # ==========================================================
  
  observe({
    
    d <- diagnosen()
    
    icd_choices <- setNames(
      
      as.character(
        d$ICD10CODE
      ),
      
      paste0(
        d$ICD10CODE,
        " - ",
        d$Diagnose_name
      )
      
    )
    
    
    updateSelectInput(
      session,
      "icd_code",
      choices = icd_choices
    )
    
  })
  
  
  # ==========================================================
  # PATIENT KOMMT AN
  # ==========================================================
  
  observeEvent(input$ankommen, {
    
    req(input$patient_id)
    
    tryCatch({
      
      sql <- "
      DECLARE @Meldung NVARCHAR(200);

      EXEC dbo.proc_PatientKommtAn
          @PatientID = ?,
          @Meldung = @Meldung OUTPUT;

      SELECT @Meldung AS Meldung;
      "
      
      
      result <- dbGetQuery(
        
        con,
        
        sql,
        
        params = list(
          as.integer(input$patient_id)
        )
        
      )
      
      
      if (
        nrow(result) > 0 &&
        !is.na(result$Meldung[1])
      ) {
        
        meldung <- result$Meldung[1]
        
      } else {
        
        meldung <- "Check-in durchgeführt."
        
      }
      
      
      showNotification(
        meldung,
        type = "message",
        duration = 5
      )
      
      
      refresh_data()
      
    },
    
    error = function(e) {
      
      showNotification(
        conditionMessage(e),
        type = "error",
        duration = 10
      )
      
    })
    
  })
  
  
  # ==========================================================
  # PATIENT GEHT
  # ==========================================================
  
  observeEvent(input$geht, {
    
    req(input$patient_id)
    
    tryCatch({
      
      dbExecute(
        
        con,
        
        "
        EXEC dbo.proc_PatientGeht
            @PatientID = ?;
        ",
        
        params = list(
          as.integer(input$patient_id)
        )
        
      )
      
      
      showNotification(
        "Patient wurde erfolgreich ausgecheckt.",
        type = "message",
        duration = 5
      )
      
      
      refresh_data()
      
    },
    
    error = function(e) {
      
      showNotification(
        conditionMessage(e),
        type = "error",
        duration = 10
      )
      
    })
    
  })
  
  
  # ==========================================================
  # AKTUALISIEREN
  # ==========================================================
  
  observeEvent(input$refresh, {
    
    refresh_data()
    
  })
  
  
  # ==========================================================
  # AKTUELL IN DER PRAXIS
  # ==========================================================
  
  aktuell_in_praxis <- reactive({
    
    refresh_counter()
    
    dbGetQuery(
      
      con,
      
      "
      SELECT
          pat.PatientID,

          per.Vorname,

          per.Nachname,

          FORMAT(
              pb.Ankunft,
              'dd.MM.yyyy HH:mm'
          ) AS Ankunft

      FROM dbo.Praxisbesuch AS pb

      INNER JOIN dbo.Patient AS pat
          ON pb.PatientID = pat.PatientID

      INNER JOIN dbo.Person AS per
          ON pat.PersonID = per.PersonID

      WHERE pb.Verlassen IS NULL

      ORDER BY pb.Ankunft;
      "
      
    )
    
  })
  
  
  output$patienten_aktuell <- renderTable({
    
    aktuell_in_praxis()
    
  },
  
  striped = TRUE,
  bordered = TRUE,
  hover = TRUE)
  
  
  output$anzahl_patienten <- renderText({
    
    daten <- aktuell_in_praxis()
    
    paste(
      "Patienten aktuell in der Praxis:",
      nrow(daten)
    )
    
  })
  
  
  # ==========================================================
  # PATIENTENLISTEN
  # ==========================================================
  
  output$patienten_liste_rezeption <- renderTable({
    
    patienten()
    
  },
  
  striped = TRUE,
  bordered = TRUE,
  hover = TRUE)
  
  
  output$patienten_liste <- renderTable({
    
    patienten()
    
  },
  
  striped = TRUE,
  bordered = TRUE,
  hover = TRUE)
  
  
  # ==========================================================
  # NEUEN PATIENTEN AUFNEHMEN
  # ==========================================================
  
  observeEvent(input$patient_anlegen, {
    
    req(
      input$vorname,
      input$nachname,
      input$gebdat,
      input$telefon
    )
    
    
    tryCatch({
      
      titel <- if (
        is.null(input$titel_id) ||
        input$titel_id == 0
      ) {
        
        NA_integer_
        
      } else {
        
        as.integer(input$titel_id)
        
      }
      
      
      dbExecute(
        
        con,
        
        "
        EXEC dbo.proc_NeuenPatientAufnehmen
            @Vorname       = ?,
            @Nachname      = ?,
            @GebDat        = ?,
            @GenderID      = ?,
            @Telefonnummer = ?,
            @TitelID       = ?,
            @Strasse       = ?,
            @Hausnummer    = ?,
            @PLZ           = ?,
            @StadtID       = ?;
        ",
        
        params = list(
          
          input$vorname,
          
          input$nachname,
          
          as.character(input$gebdat),
          
          as.integer(input$gender_id),
          
          input$telefon,
          
          titel,
          
          input$strasse,
          
          input$hausnummer,
          
          input$plz,
          
          as.integer(input$stadt_id)
          
        )
        
      )
      
      
      showNotification(
        "Patient wurde erfolgreich aufgenommen.",
        type = "message",
        duration = 5
      )
      
      
      refresh_data()
      
    },
    
    error = function(e) {
      
      showNotification(
        conditionMessage(e),
        type = "error",
        duration = 10
      )
      
    })
    
  })
  
  
  # ==========================================================
  # PATIENTENAKTE - STAMMDATEN
  # ==========================================================
  
  output$akte_stammdaten <- renderTable({
    
    req(input$akte_patient_id)
    
    refresh_counter()
    
    
    dbGetQuery(
      
      con,
      
      "
      SELECT
          pat.PatientID,

          per.PersonID,

          per.Vorname,

          per.Nachname,

          FORMAT(
              per.GebDat,
              'dd.MM.yyyy'
          ) AS Geburtsdatum,

          dbo.AlterBerechnen(
              per.GebDat
          ) AS Lebensalter,

          per.Telefonnummer,

          CASE
              WHEN per.Archiviert = 1
                  THEN N'Ja'
              ELSE N'Nein'
          END AS Archiviert

      FROM dbo.Patient AS pat

      INNER JOIN dbo.Person AS per
          ON pat.PersonID = per.PersonID

      WHERE pat.PatientID = ?;
      ",
      
      params = list(
        as.integer(input$akte_patient_id)
      )
      
    )
    
  },
  
  striped = TRUE,
  bordered = TRUE)
  
  
  # ==========================================================
  # PATIENTENAKTE - BESUCHE + DIAGNOSEN
  #
  # WICHTIG:
  # KEIN ZahnflaecheID-JOIN MEHR.
  # ==========================================================
  
  output$akte_verlauf <- renderTable({
    
    req(input$akte_patient_id)
    
    refresh_counter()
    
    
    dbGetQuery(
      
      con,
      
      "
      SELECT
          pb.PraxisbesuchID,

          FORMAT(
              pb.Ankunft,
              'dd.MM.yyyy HH:mm'
          ) AS Ankunft,

          CASE
              WHEN pb.Verlassen IS NULL
                  THEN N''
              ELSE FORMAT(
                  pb.Verlassen,
                  'dd.MM.yyyy HH:mm'
              )
          END AS Verlassen,

          CASE
              WHEN pb.Verlassen IS NULL
                  THEN N'In der Praxis'
              ELSE N'Abgeschlossen'
          END AS Besuchsstatus,

          d.ICD10CODE,

          d.Diagnose_name,

          z.ZahnCODE,

          l.Lokalisation_name,

          CASE
              WHEN phd.ErfasstAm IS NULL
                  THEN N''
              ELSE FORMAT(
                  phd.ErfasstAm,
                  'dd.MM.yyyy HH:mm'
              )
          END AS ErfasstAm,

          mitPerson.Vorname
              AS ErfasstVonVorname,

          mitPerson.Nachname
              AS ErfasstVonNachname

      FROM dbo.Praxisbesuch AS pb

      LEFT JOIN dbo.PatientHatDiagnose AS phd
          ON pb.PraxisbesuchID =
             phd.PraxisbesuchID

      LEFT JOIN dbo.Diagnose AS d
          ON phd.DiagnoseID =
             d.DiagnoseID

      LEFT JOIN dbo.Zahn AS z
          ON phd.ZahnID =
             z.ZahnID

      LEFT JOIN dbo.Lokalisation AS l
          ON phd.LokalisationID =
             l.LokalisationID

      LEFT JOIN dbo.Mitarbeiter AS mit
          ON phd.ErfasstVomMitarbeiter =
             mit.MitarbeiterID

      LEFT JOIN dbo.Person AS mitPerson
          ON mit.PersonenID =
             mitPerson.PersonID

      WHERE pb.PatientID = ?

      ORDER BY
          pb.Ankunft DESC,
          phd.ErfasstAm DESC;
      ",
      
      params = list(
        as.integer(input$akte_patient_id)
      )
      
    )
    
  },
  
  striped = TRUE,
  bordered = TRUE,
  hover = TRUE)
  
  
  # ==========================================================
  # DIAGNOSE SPEICHERN
  # ==========================================================
  
  observeEvent(input$diagnose_speichern, {
    
    req(
      input$diagnose_patient_id,
      input$icd_code,
      input$zahn_code,
      input$mitarbeiter_id
    )
    
    
    tryCatch({
      
      dbExecute(
        
        con,
        
        "
        EXEC dbo.proc_DiagnoseHinzufuegen
            @PatientID = ?,
            @ICD10CODE = ?,
            @ZahnCODE = ?,
            @MitarbeiterID = ?;
        ",
        
        params = list(
          
          as.integer(
            input$diagnose_patient_id
          ),
          
          input$icd_code,
          
          input$zahn_code,
          
          as.integer(
            input$mitarbeiter_id
          )
          
        )
        
      )
      
      
      showNotification(
        "Diagnose wurde gespeichert.",
        type = "message",
        duration = 5
      )
      
      
      refresh_data()
      
    },
    
    error = function(e) {
      
      showNotification(
        conditionMessage(e),
        type = "error",
        duration = 10
      )
      
    })
    
  })
  
  
  # ==========================================================
  # DIAGNOSEHISTORIE
  # ==========================================================
  
  output$diagnose_historie <- renderTable({
    
    req(input$diagnose_patient_id)
    
    refresh_counter()
    
    
    dbGetQuery(
      
      con,
      
      "
      SELECT
          pb.PraxisbesuchID,

          FORMAT(
              pb.Ankunft,
              'dd.MM.yyyy HH:mm'
          ) AS Praxisbesuch,

          d.ICD10CODE,

          d.Diagnose_name,

          z.ZahnCODE,

          l.Lokalisation_name,

          FORMAT(
              phd.ErfasstAm,
              'dd.MM.yyyy HH:mm'
          ) AS ErfasstAm,

          pM.Vorname
              AS ErfasstVonVorname,

          pM.Nachname
              AS ErfasstVonNachname

      FROM dbo.PatientHatDiagnose AS phd

      INNER JOIN dbo.Praxisbesuch AS pb
          ON phd.PraxisbesuchID =
             pb.PraxisbesuchID

      INNER JOIN dbo.Diagnose AS d
          ON phd.DiagnoseID =
             d.DiagnoseID

      LEFT JOIN dbo.Zahn AS z
          ON phd.ZahnID =
             z.ZahnID

      LEFT JOIN dbo.Lokalisation AS l
          ON phd.LokalisationID =
             l.LokalisationID

      LEFT JOIN dbo.Mitarbeiter AS m
          ON phd.ErfasstVomMitarbeiter =
             m.MitarbeiterID

      LEFT JOIN dbo.Person AS pM
          ON m.PersonenID =
             pM.PersonID

      WHERE pb.PatientID = ?

      ORDER BY phd.ErfasstAm DESC;
      ",
      
      params = list(
        as.integer(
          input$diagnose_patient_id
        )
      )
      
    )
    
  },
  
  striped = TRUE,
  bordered = TRUE,
  hover = TRUE)
  
  
  # ==========================================================
  # ZAHNFLÄCHEN-STAMMDATEN
  # ==========================================================
  
  output$zahnflaechen_liste <- renderTable({
    
    dbGetQuery(
      
      con,
      
      "
      SELECT
          FlaechenCODE,
          Flaechen_name
      FROM dbo.Zahnflaeche
      ORDER BY FlaechenCODE;
      "
      
    )
    
  },
  
  striped = TRUE,
  bordered = TRUE,
  hover = TRUE)
  
  
  # ==========================================================
  # VERBINDUNG SCHLIESSEN
  # ==========================================================
  
  session$onSessionEnded(function() {
    
    if (DBI::dbIsValid(con)) {
      
      DBI::dbDisconnect(con)
      
    }
    
  })
  
}


# ============================================================
# 4. APP STARTEN
# ============================================================

shinyApp(
  ui = ui,
  server = server
)