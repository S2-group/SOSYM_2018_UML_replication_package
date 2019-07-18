data <- read.delim("../extractedData.txt", header = TRUE, quote = "\"", dec = ".", fill = TRUE, comment.char = "", na.strings = "N/A")

# here we select which indexes must be considered, for the full list run this in the console: names(df)
startIndex <- 13
stopIndex <- 53
blackListIndexes <- c(47, 48, 52)

# here we define the layout of the resulting plots matrix
numColumns <- 3
numRows <- 13

# here we define the size and margins of the pdf being produced
xSize <- 40
ySize <- 70
margin <- 8

# the file name of the pdf being produced
fileName <- "../results/summary.pdf"

# here we select which data frame is containing all the data
dataSource <- data

# separator used in categorical variables with multiple values
separator <- '#'

############# DO NOT CHANGE ANYTHING BELOW THIS LINE ############# 

df <- dataSource
# we remove all the potential columns containing all NAs 
# (this may happen because of some strange things that Excel does 
# when exporting towards tab-delimited textual files)
df <- df[,colSums(is.na(df))<nrow(df)]

library(splitstackshape)
library(plyr)
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

pdf(fileName, width=xSize, height=ySize)
par(mar=c(margin, margin, margin, margin))
par(mfrow=c(numRows, numColumns))
par(las=1)


library(nortest)

indexes <- c(startIndex:stopIndex)
for(i in indexes) {
  var <- names(df)[i]
  if(!all(is.na(dt2[[var]])) && !(i %in% blackListIndexes)) {
    plotTitle <- var
    counts <- count(dt2, var)$freq[1:length(count(dt2, var)$freq)-1]
    if(length(counts) > 2) {
      #if(shapiro.test(counts)$p.value >= 0.05) {
        #plotTitle <- paste(plotTitle, '(normal distribution)')
      #} else {
        #plotTitle <- paste(plotTitle, '(NOT normal Distr.)')
      #}
    }
    plot <- plot(as.factor(dt2[[var]]), main=plotTitle, xlim=c(0, nrow(df)), cex.names=0.7, horiz=TRUE)
    text(x=count(dt2, var)$freq + 1, y = plot, label = counts, cex = 1, col = "red")
    print(paste(plotTitle, " - plotted"))
  } else {
    print(paste(var, " - discarded because it contains only NAs"))
  }
}

dev.off()
