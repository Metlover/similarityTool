similarityToolMostUniqueBB <- function(battedBallVals, numResults){
  if(numResults > nrow(battedBallVals)) {numResults = nrow(battedBallVals) - 1}
  battedBallValsTwo = battedBallVals
  battedBallValsTwo$Name = paste(battedBallVals$Name, as.character(battedBallVals$Season), sep='')
  names = battedBallValsTwo[,"Name"]
  result = data.frame(NULL)
  for (row in 1:nrow(names)) {
    name = names[row,]
    result = rbind(result, similarityToolBB(battedBallVals, substr(toString(name),0,nchar(toString(name))-4), 1, as.double(substr(toString(name),nchar(toString(name))-3,nchar(toString(name))))))
  }
  result$OriginalPlayer = as.data.frame(names)
  names(result)[names(result)=="Name"] <- "Most Similar Player"
  result = result[order(-result$Scores),]
  return(result[1:numResults,])
}
