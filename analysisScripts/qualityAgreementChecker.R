library(irr)

# quality agreement checker

# remove all the rows with NAs
data <- quality[!(is.na(quality$Q1_Fede)),]

attribute1 <- "Q1_Fede"
attribute2 <- "Q1_Ivano"

tbl1 <- table(as.factor(data[[attribute1]]), as.factor(data[[attribute2]]))
support1 <- data[, c(attribute1, attribute2)]

attribute1 <- "Q2_Fede"
attribute2 <- "Q2_Ivano"

tbl2 <- table(as.factor(data[[attribute1]]), as.factor(data[[attribute2]]))
support2 <- data[, c(attribute1, attribute2)]

attribute1 <- "Q3_Fede"
attribute2 <- "Q3_Ivano"

tbl3 <- table(as.factor(data[[attribute1]]), as.factor(data[[attribute2]]))
support3 <- data[, c(attribute1, attribute2)]

attribute1 <- "Q4_Fede"
attribute2 <- "Q4_Ivano"

tbl4 <- table(as.factor(data[[attribute1]]), as.factor(data[[attribute2]]))
support4 <- data[, c(attribute1, attribute2)]

attribute1 <- "Q5_Fede"
attribute2 <- "Q5_Ivano"

tbl5 <- table(as.factor(data[[attribute1]]), as.factor(data[[attribute2]]))
support5 <- data[, c(attribute1, attribute2)]

attribute1 <- "Q6_Fede"
attribute2 <- "Q6_Ivano"

tbl6 <- table(as.factor(data[[attribute1]]), as.factor(data[[attribute2]]))
support6 <- data[, c(attribute1, attribute2)]

# print(chisq.test(tbl1)$p.value)
# print(kappa2(support1, "unweighted"))
# print(mean(data[[attribute1]]))
# print(mean(data[[attribute2]]))

print(tbl1)

scoresFede <- c()

index = 1
for(i in 1:nrow(data)) {
  row <- data[i,]
  scoresFede <- append(scoresFede,  row$Q1_Fede + row$Q2_Fede + row$Q3_Fede + row$Q4_Fede + row$Q5_Fede + row$Q6_Fede)
  index <- i
}

# Now we plot the quality values

pdf("../../../journal_paper/figures/qualityTotal.pdf", width=10, height=7.5)
par(mar=c(5, 5, 1, 1))
par(mfrow=c(1, 1))
par(las=1)

# Grouped Bar Plot
data2 <- structure(list(
  Q1= c(length(subset(data$Q1, data$Q1==0)), length(subset(data$Q1, data$Q1==0.5)), length(subset(data$Q1, data$Q1==1))), 
  Q2= c(length(subset(data$Q2, data$Q2==0)), length(subset(data$Q2, data$Q2==0.5)), length(subset(data$Q2, data$Q2==1))), 
  Q3= c(length(subset(data$Q3, data$Q3==0)), length(subset(data$Q3, data$Q3==0.5)), length(subset(data$Q3, data$Q3==1))), 
  Q4= c(length(subset(data$Q4, data$Q4==0)), length(subset(data$Q4, data$Q4==0.5)), length(subset(data$Q4, data$Q4==1))), 
  Q5= c(length(subset(data$Q5, data$Q5==0)), length(subset(data$Q5, data$Q5==0.5)), length(subset(data$Q5, data$Q5==1))), 
  Q6= c(length(subset(data$Q6, data$Q6==0)), length(subset(data$Q6, data$Q6==0.5)), length(subset(data$Q6, data$Q6==1)))), .Names = c("Q1", "Q2", "Q3", "Q4", "Q5", "Q6"), class = "data.frame", row.names = c(NA, -3))
colours <- gray.colors(3)#c("grey", "grey", "grey")

# barplot(as.matrix(data2), main="", ylim=c(0,50), ylab = "Quality scores frequency", cex.names = 1, cex.lab = 1, cex.main = 1, beside=TRUE, col=colours)
# legend(21.6,50,c("0","0.5","1"),fill=gray.colors(3))
# qvalue0 <- length(subset(data$Q1, data$Q1==0))
# qvalue05 <- length(subset(data$Q1, data$Q1==0.5))
# qvalue1 <- length(subset(data$Q1, data$Q1==1))
# dist0 <- 1.5
# dist05 <- 2.5
# dist1 <- 3.5
# text(x=c(dist0, dist05, dist1), y = c(qvalue0+1,qvalue05+1,qvalue1+1), label = c(qvalue0,qvalue05,qvalue1), col = "black")
# qvalue0 <- length(subset(data$Q2, data$Q2==0))
# qvalue05 <- length(subset(data$Q2, data$Q2==0.5))
# qvalue1 <- length(subset(data$Q2, data$Q2==1))
# dist0 <- dist0 + 4
# dist05 <- dist05 + 4
# dist1 <- dist1 + 4
# text(x=c(dist0, dist05, dist1), y = c(qvalue0+1,qvalue05+1,qvalue1+1), label = c(qvalue0,qvalue05,qvalue1), col = "black")
# qvalue0 <- length(subset(data$Q3, data$Q3==0))
# qvalue05 <- length(subset(data$Q3, data$Q3==0.5))
# qvalue1 <- length(subset(data$Q3, data$Q3==1))
# dist0 <- dist0 + 4
# dist05 <- dist05 + 4
# dist1 <- dist1 + 4
# text(x=c(dist0, dist05, dist1), y = c(qvalue0+1,qvalue05+1,qvalue1+1), label = c(qvalue0,qvalue05,qvalue1), col = "black")
# qvalue0 <- length(subset(data$Q4, data$Q4==0))
# qvalue05 <- length(subset(data$Q4, data$Q4==0.5))
# qvalue1 <- length(subset(data$Q4, data$Q4==1))
# dist0 <- dist0 + 4
# dist05 <- dist05 + 4
# dist1 <- dist1 + 4
# text(x=c(dist0, dist05, dist1), y = c(qvalue0+1,qvalue05+1,qvalue1+1), label = c(qvalue0,qvalue05,qvalue1), col = "black")
# qvalue0 <- length(subset(data$Q5, data$Q5==0))
# qvalue05 <- length(subset(data$Q5, data$Q5==0.5))
# qvalue1 <- length(subset(data$Q5, data$Q5==1))
# dist0 <- dist0 + 4
# dist05 <- dist05 + 4
# dist1 <- dist1 + 4
# text(x=c(dist0, dist05, dist1), y = c(qvalue0+1,qvalue05+1,qvalue1+1), label = c(qvalue0,qvalue05,qvalue1), col = "black")
# qvalue0 <- length(subset(data$Q6, data$Q6==0))
# qvalue05 <- length(subset(data$Q6, data$Q6==0.5))
# qvalue1 <- length(subset(data$Q6, data$Q6==1))
# dist0 <- dist0 + 4
# dist05 <- dist05 + 4
# dist1 <- dist1 + 4
# text(x=c(dist0, dist05, dist1), y = c(qvalue0+1,qvalue05+1,qvalue1+1), label = c(qvalue0,qvalue05,qvalue1), col = "black")

d <- density(data$TOTAL, bw=0.4) # returns the density data 
d$y <- d$y * length(data$TOTAL)
plot(d, xlim=c(0,6), xlab="Total quality score", ylab="Frequency of total quality score",main="") # plots the results
polygon(d, col="grey", border="black")

dev.off()
