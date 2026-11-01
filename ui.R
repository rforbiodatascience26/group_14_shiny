library("shiny")
library("bslib")

ui <- page_fluid(
  layout_columns(
    col_widths = 12,
    card(
      titlePanel("Virtual Central Dogma"),
      style = "background-color: #f0f0f0; padding: 15px;"
    )
  ),
  
  layout_columns(
    col_widths = 12,
    card(
      titlePanel("About"),
      helpText(
        "Generate DNA, transcribe it into RNA, and translate the RNA into protein."
      )
    )
  ),
  
  layout_columns(
    col_widths = 12,
    card(
      card_header("1. Virtual Gene Generator"),
      
      sliderInput(
        inputId = "n_bases",
        label = "Number of bases:",
        min = 3,
        max = 60,
        value = 30,
        step = 3,
        width = "100%"
      ),
      
      layout_columns(
        col_widths = c(3, 3, 3, 3),
        
        numericInput(
          inputId = "prob_A",
          label = "Probability of A",
          value = 0.25,
          min = 0,
          max = 1,
          step = 0.1
        ),
        
        numericInput(
          inputId = "prob_T",
          label = "Probability of T",
          value = 0.25,
          min = 0,
          max = 1,
          step = 0.1
        ),
        
        numericInput(
          inputId = "prob_C",
          label = "Probability of C",
          value = 0.25,
          min = 0,
          max = 1,
          step = 0.1
        ),
        
        numericInput(
          inputId = "prob_G",
          label = "Probability of G",
          value = 0.25,
          min = 0,
          max = 1,
          step = 0.1
        )
      ),
      
      verbatimTextOutput(outputId = "dna")
    )
  ),
  
  layout_columns(
    col_widths = 12,
    card(
      card_header("2. Transcription"),
      textInput(
        inputId = "dna_input",
        label = "Paste DNA sequence:",
        value = ""
      ),
      verbatimTextOutput(outputId = "rna")
    )
  ),
  
  layout_columns(
    col_widths = 12,
    card(
      card_header("3. Translation"),
      textInput(
        inputId = "rna_input",
        label = "Paste RNA sequence:",
        value = ""
      ),
      verbatimTextOutput(outputId = "protein")
    )
  )
)
