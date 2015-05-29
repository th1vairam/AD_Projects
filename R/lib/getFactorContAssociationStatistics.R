# Find Inter Class Correlation between factor and continuous covariates
# Inspired from http://stats.stackexchange.com/questions/108007/correlations-with-categorical-variables
getFactorContAssociationStatistics <- function(factorContNames,COVARIATES, na.action='remove', 
                                               alpha = 0.05){
  if (na.action == "remove")
    COVARIATES = na.omit(COVARIATES[,factorContNames])
  
  COVARIATES[,factorContNames] <- lapply(COVARIATES[,factorContNames],function(cols){
    if(is.character(cols)){
      cols <- as.numeric(unclass(as.factor(cols)))
    }
    return(cols)
  })
  
  stats = ICC(COVARIATES[,factorContNames], alpha = alpha)
  
  Pval = summary(aov(COVARIATES[,factorContNames[1]]~COVARIATES[,factorContNames[2]]))[[1]][["Pr(>F)"]][1]
  
  
  return(c(Estimate = stats$results['Single_raters_absolute','ICC'],
           Pval = Pval))
}
