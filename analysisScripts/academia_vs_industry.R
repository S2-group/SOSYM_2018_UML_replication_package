list <- c('Execution.strategy',
          'Simulation',
          'Intended.benefits',
          'Process',
          'Extensible',
          'Readiness.level',
          'Partial.models',
          'UML.diagrams',
          'UML.diagram.types',
          'Action.languages',
          'Implicit.UML.profile',
          'Explicit.UML.profiles.required',
          'Modeling.tool',
          'fUML',
          'MDA.levels.covered',
          'Non.functional.properties',
          'Production.system',
          'Execution.tools.and.technologies',
          'Model.level.debugging' ,
          'Formal.specification.languages',
          'Intermediate.artifacts',
          'Software.platform',
          'Translation.targets',
          'Translation.steps',
          'Traceability.links.support',
          'Interpretation.engine',
          'Target.platforms',
          'Compiler')

attribute2 <- list[1]

fileName <- paste("../results/academia_vs_industry/ac_vs_ind_", attribute2, ".pdf")

numIndustry <- 18
numAcademia <- 52

attribute1 <- 'Type'

library(ggplot2)
library(reshape2)
library(splitstackshape)
library(plyr)

pdf(fileName, width=20, height=10)
par(mar=c(8, 8, 8, 8))
par(mfrow=c(1, 1))
par(las=1)

#topScale <- nrow(dataSource)
topScale <- 1

# here we select which data frame is containing all the data
dataSource <- extractedData

# separator used in categorical variables with multiple values
separator <- '#'

df <- dataSource

dt2 <- cSplit(df, splitCols=names(df), sep=separator, direction="long")
dt2 <- dt2[!duplicated(dt2), ]

ind <- apply(dt2, 1, function(x) all(is.na(x)))
dt2 <- dt2[ !ind, ]

index = 1
for(i in 1:nrow(dt2)) {
  row <- dt2[i,]
  if(is.na(row$ID)) {
    dt2[[i,1]] <- dt2[[i-1,1]]
  } else {
    index <- i
  }
}

tbl2 <- table(as.factor(dt2[[attribute1]]), as.factor(dt2[[attribute2]]))
#resultDf <- as.data.frame.matrix(tbl)
tbl <- table(as.factor(dt2[[attribute1]]), as.factor(dt2[[attribute2]]))

for(i in 1:nrow(tbl)) {
  row <- tbl[i,]
  for(j in 1:length(row)) {
    #tbl[i,j] <- 1
    if(names(tbl[,j])[i] == 'T') {
      tbl[[i,j]] <- round(tbl[[i,j]] / numIndustry, 2)
    } else {
      tbl[[i,j]] <- round(tbl[[i,j]] / numAcademia, 2)
    }
#     if(row.names) {
#       dt2[[i,1]] <- dt2[[i-1,1]]
#     } else {
#       index <- i
#     }
  }

}

ggplot(melt(as.factor(tbl)), aes(as.factor(Var2), as.factor(Var1))) +
  geom_tile(data=melt(tbl), aes(fill=value), color="grey") +
  geom_text(data=melt(tbl2), aes(label=paste(value, " (", round(melt(tbl)$value, 2) * 100, "%)")), size=4, color="grey") +
  theme_bw() + 
  scale_fill_gradient2(low="blue", high="red", mid="white",name="Frequency", limit=c(0,topScale)) +
  theme(axis.text.x = element_text(angle=45, vjust=1, size=11, hjust=1)) +
  coord_equal() + labs(x=attribute2, y=attribute1)

dev.off()

