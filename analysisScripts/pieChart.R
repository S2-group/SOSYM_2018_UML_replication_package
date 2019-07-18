# Pie chart

xSize <- 4.6
ySize <- 3

marginLeft <- 10
marginBottom <- 3
marginTop <- 3
marginRight <- 5.5

fileName <- "../../../journal_paper/figures/pubTypes.pdf"

cairo_pdf(fileName, width=xSize, height=ySize)
par(mar=c(marginBottom, marginLeft, marginTop, marginRight))
par(mfrow=c(1, 1))
par(las=1)

# one element for each possible value of the variable
possibleValues <- c("J",
                    "C",
                    "W"
                    )

# name of the X axis label
xLabel <- ""

# name of the column of interest
columnName <- "Publication.type"

#############################################################################

# twin array of possibleValue storing the values of each possible element
counts <- vector("integer", length(possibleValues))
for (i in 1:length(possibleValues)) {
  counts[i] <- 0
}

# the labels to be used in the pie chart
labels <- c("Journal",
            "Conference",
            "Workshop"
)

# counting the elements for each possible value
for (el in extractedData[[columnName]]) {
  for (i in 1:length(possibleValues)) {
    if(grepl(possibleValues[i], el)) {
      counts[i] <- as.integer(counts[i]) + 1
    }
  }
}

# compute the factor to which elements values must be scaled
#pct <- round(counts/sum(counts) * 100, 2)
# we add the percentages to the labels
labels <- paste(labels, " (", counts, ")", sep="") # add percents to labels 

# create the pie chart
p <- pie(counts, labels = rep("", 3), col=gray.colors(length(labels), alpha = 1), radius = 1, cex = 1, main="")
text(x=c(1.4,-1.8,1.9), y=c(1,-0.6,-0.4),labels=labels, xpd=TRUE)

dev.off()
