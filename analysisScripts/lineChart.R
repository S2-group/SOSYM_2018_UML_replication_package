# Line chart

# one element for each possible year
yearsInt <- c(1999:2015)#c("2006","2007","2008","2009","2010", "2011","2012","2013","2014", "2015")
years <- as.factor(yearsInt)

# name of the X and Y axis labels
xLabel <- ""
yLabel <- ""

# name of the column of interest
columnName <- "Year"

#############################################################################

# twin array of possibleValue storing the values of each possible element
counts <- vector("integer", length(years))
for (i in 1:length(years)) {
  counts[i] <- 0
}

# the labels to be used in the line chart
labels <- ""

# counting the elements for each possible value
for (el in extractedData[[columnName]]) {
  for (i in 1:length(years)) {
    if(grepl(years[i], el)) {
      counts[i] <- as.integer(counts[i]) + 1
    }
  }
}

# lastYear = counts[length(counts)]
# lastYearPercentage = round(lastYear/sum(counts) * 100, 2)

# compute the factor to which elements values must be scaled
pct <- round(counts/sum(counts) * 100, 1)
pct[length(pct)] <- pct[length(pct)] + 0.1
# we add the percentages to the labels
#labels <- paste(counts, "\n", pct, "%", sep="") # add percents to labels 
labels <- counts
#labels <- sub("0\n0%", "", labels)

# load the library ggplot2
library(ggplot2)

xSize <- 8
ySize <- 3

marginLeft <- 0
marginBottom <- 0
marginTop <- 0
marginRight <- 0

fileName <- "../../../journal_paper/figures/years.pdf"

cairo_pdf(fileName, width=xSize, height=ySize)
par(mar=c(marginBottom, marginLeft, marginTop, marginRight))
par(mfrow=c(1, 1))
par(las=1)

# create the dataframe
df.papers <- data.frame(years,counts)

# in p now we have the final plot
ggplot(data=df.papers, aes(x=years, y=counts, group=1)) +
  geom_text(data=df.papers,aes(x=years,y=counts,label=labels),size=4, alpha=1, lineheight=1, vjust=-0.7,hjust=.5) + 
  labs(x=xLabel, y=yLabel) +
  theme_classic() +
  theme(axis.text.x = element_text(size=10), axis.text.y = element_text(size=10),
        axis.title.x = element_text(size=10), axis.title.y = element_text(size=10)) +
        geom_point(size=3) + ylim(0, max(counts) + 5) + coord_fixed(ratio=.3) + geom_line(data=subset(df.papers, years != "2015")) + geom_line(linetype="dashed", data=subset(df.papers, years = "2015"))

#print(p)
dev.off()
