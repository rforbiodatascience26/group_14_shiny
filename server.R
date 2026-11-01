library("shiny")

server <- function(input, output) {
  
  output$dna <- renderText({
    gene_dna(
      length = input$n_bases,
      base_probs = c(
        input$prob_A,
        input$prob_T,
        input$prob_C,
        input$prob_G
      )
    )
  })
  
  output$rna <- renderText({
    transcribe_dna(
      dna = input$dna_input
    )
  })
  
  output$protein <- renderText({
    translate_rna(
      rna = input$rna_input
    )
  })
}