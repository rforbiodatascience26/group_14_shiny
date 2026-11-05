# Virtual gene
gene_dna <- function(
    length,
    base_probs = c(0.25, 0.25, 0.25, 0.25)
) {
  if (length %% 3 != 0) {
    stop("The number of bases must be divisible by 3.")
  }
  
  if (!isTRUE(all.equal(sum(base_probs), 1))) {
    stop("The base probabilities must sum to 1.")
  }
  
  dna_vector <- sample(
    x = c("A", "T", "C", "G"),
    size = length,
    replace = TRUE,
    prob = base_probs
  )
  
  dna_string <- paste0(
    x = dna_vector,
    collapse = ""
  )
  
  return(dna_string)
}


# Virtual RNA polymerase
transcribe_dna <- function(dna) {
  if (is.null(dna) || length(dna) != 1 || is.na(dna)) {
    stop("Please provide one DNA sequence.")
  }
  
  dna <- toupper(trimws(dna))
  
  if (!grepl("^[ATCG]*$", dna)) {
    stop("Invalid DNA sequence. Only A, T, C and G are allowed.")
  }
  
  rna <- gsub(
    pattern = "T",
    replacement = "U",
    x = dna
  )
  
  return(rna)
}


# Virtual Ribosome
# Virtual Ribosome
translate_rna <- function(rna) {
  
  # Check that an RNA sequence is provided
  if (is.null(rna) || length(rna) != 1 || is.na(rna) || rna == "") {
    return("")
  }
  
  # Standardize RNA sequence
  rna <- toupper(trimws(rna))
  
  # Check that only valid RNA bases are present
  if (!grepl("^[AUCG]+$", rna)) {
    stop("Invalid RNA sequence. Only A, U, C and G are allowed.")
  }
  
  # Check that the sequence length is divisible by 3
  if (nchar(rna) %% 3 != 0) {
    stop("RNA sequence length must be divisible by 3.")
  }
  
  # Calculate sequence length
  l <- nchar(rna)
  
  # Define codon positions
  firsts <- seq(
    from = 1,
    to = l,
    by = 3
  )
  
  lasts <- seq(
    from = 3,
    to = l,
    by = 3
  )
  
  # Split RNA sequence into codons
  codons <- substring(
    text = rna,
    first = firsts,
    last = lasts
  )
  
  # Define the genetic code
  codon_table <- c(
    "UUU" = "F", "UCU" = "S", "UAU" = "Y", "UGU" = "C",
    "UUC" = "F", "UCC" = "S", "UAC" = "Y", "UGC" = "C",
    "UUA" = "L", "UCA" = "S", "UAA" = "_", "UGA" = "_",
    "UUG" = "L", "UCG" = "S", "UAG" = "_", "UGG" = "W",
    "CUU" = "L", "CCU" = "P", "CAU" = "H", "CGU" = "R",
    "CUC" = "L", "CCC" = "P", "CAC" = "H", "CGC" = "R",
    "CUA" = "L", "CCA" = "P", "CAA" = "Q", "CGA" = "R",
    "CUG" = "L", "CCG" = "P", "CAG" = "Q", "CGG" = "R",
    "AUU" = "I", "ACU" = "T", "AAU" = "N", "AGU" = "S",
    "AUC" = "I", "ACC" = "T", "AAC" = "N", "AGC" = "S",
    "AUA" = "I", "ACA" = "T", "AAA" = "K", "AGA" = "R",
    "AUG" = "M", "ACG" = "T", "AAG" = "K", "AGG" = "R",
    "GUU" = "V", "GCU" = "A", "GAU" = "D", "GGU" = "G",
    "GUC" = "V", "GCC" = "A", "GAC" = "D", "GGC" = "G",
    "GUA" = "V", "GCA" = "A", "GAA" = "E", "GGA" = "G",
    "GUG" = "V", "GCG" = "A", "GAG" = "E", "GGG" = "G"
  )
  
  # Translate codons into amino acids
  protein <- paste0(
    x = codon_table[codons],
    collapse = ""
  )
  
  return(protein)
}