#Takes a character vector with one entry per document and its metadata
textProcessor <- function(documents, metadata=NULL, 
                          lowercase=TRUE, removestopwords=TRUE, removenumbers=TRUE, removepunctuation=TRUE, stem=TRUE, 
                          sparselevel=.99, language="en",
                          verbose=TRUE, tfidf=FALSE) {
  if(!require(tm,quietly=TRUE)) stop("Please install tm package to use this function. You will also need SnowballC if stemming.")
  if(stem) {
    if(!require(SnowballC, quietly=TRUE)) stop("Please install SnowballC to use stemming.")
  }
  documents <- as.character(documents)
  if(verbose) cat("Building corpus... \n")
  txt <- Corpus(VectorSource(documents), readerControl=list(language= language))
  #Apply filters
  txt <- tm_map(txt, stripWhitespace)
  
  if(lowercase){
    if(verbose) cat("Converting to Lower Case... \n")
    txt <- tm_map(txt, tolower) #Convert to Lower case
  }
  if(removestopwords){
    if(verbose) cat("Removing stopwords... \n")
    txt <- tm_map(txt, removeWords, stopwords(language)) #Remove stopwords
  }
  if(removenumbers){
    if(verbose) cat("Removing numbers... \n")
    txt <- tm_map(txt, removeNumbers) #Remove numbers
  }
  if(removepunctuation){
    if(verbose) cat("Removing punctuation... \n")
    txt <- tm_map(txt, removePunctuation) #Remove punctuation
  }
  if(stem){
    if(verbose) cat("Stemming... \n")
    txt <- tm_map(txt, stemDocument, language=language)
  }
  
  if(!is.null(metadata)) {
    for(i in 1:ncol(metadata)) {
      meta(txt, colnames(metadata)[i]) <- metadata[,i]
    }
  }
  
  #Make a matrix
  if(verbose) cat("Creating Output... \n")
 
    if(tfidf) dtm <- DocumentTermMatrix(txt, control = list(weighting = function(x) weightTfIdf(x, normalize = TRUE),  stopwords = TRUE))
    if(tfidf) dtm$v <- as.integer(round(dtm$v*1000))
 
  if(!tfidf) dtm <- DocumentTermMatrix(txt)
 
  dtm <- removeSparseTerms(dtm, sparselevel) #remove terms that are sparse
  
  #If there is metadata we need to remove some documents
  if(!is.null(metadata)) {
    docindex <- unique(dtm$i)
    metadata <- meta(txt)[docindex,]
  }
  out <- read.slam(dtm) #using the read.slam() function in stm to convert
  vocab <- as.character(out$vocab)
  return(list(documents=out$documents, vocab=vocab, meta=metadata))
}
