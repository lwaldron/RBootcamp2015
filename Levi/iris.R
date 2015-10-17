## ---- eval=FALSE---------------------------------------------------------
## install.packages(c("broom", "xtable", "gee", "RColorBrewer", "gplots"))

## ------------------------------------------------------------------------
data(iris)
dim(iris)
class(iris)
summary(iris)
head(iris)
sapply(iris, class)

## ------------------------------------------------------------------------
plot(iris$Sepal.Length)

## ------------------------------------------------------------------------
plot(iris$Sepal.Length, iris$Sepal.Width)

## ---- eval=FALSE---------------------------------------------------------
## plot(iris$Sepal.Width ~ iris$Sepal.Length)

## ---- eval=FALSE---------------------------------------------------------
## pdf("iris1.pdf")
## plot(Sepal.Width ~ Sepal.Length, data=iris)
## dev.off()

## ------------------------------------------------------------------------
plot(1:20, pch=1:20)
plot(1:20, pch=c(".", "a", "dog"))

## ------------------------------------------------------------------------
library(RColorBrewer)
display.brewer.all(n=3)
brewer.pal(3, "Set2")

## ------------------------------------------------------------------------
plot(1:10, col=colorRampPalette(c("red", "lightgrey", "black"))(10), pch=15, cex=3)

## ------------------------------------------------------------------------
plot(Sepal.Width ~ Sepal.Length, data=iris, 
     col=brewer.pal(3, "Set2")[iris$Species])
legend(x=6.5, y=4.5, legend=levels(iris$Species), 
       col=brewer.pal(3, "Set2"), pch=1)

## ------------------------------------------------------------------------
x <- hist(iris$Sepal.Length)
segments(x0=x$mids-0.25, x1=x$mids+0.25, y0=x$counts, y1=x$counts, lw=4, col="red")

## ------------------------------------------------------------------------
layout(mat = matrix(c(1,2), 2, 1, byrow=TRUE),  height = c(1,3))
par(mar=c(2, 2, 0.5, 1))
boxplot(iris$Sepal.Length, horizontal=TRUE,  outline=TRUE,ylim=c(4,8), frame=FALSE, col = "green1")
hist(iris$Sepal.Length,xlim=c(4,8), col = "pink", freq = FALSE)
lines(density(iris$Sepal.Length))

## ------------------------------------------------------------------------
boxplot(Sepal.Width ~ Species, data=iris, boxwex=0.25, col="grey")

## ---- fig.scap="Heatmap of iris dimensions.", message=FALSE, warning=FALSE----
library(gplots)
heatmap.2(t(iris[, 1:4]), trace="none", scale="row", 
          key=TRUE, mar=c(2, 8), cexRow=1, 
          ColSideColors=c("grey", "black", "yellow")[iris$Species])

## ------------------------------------------------------------------------
pairs(iris)

## ------------------------------------------------------------------------
data(iris)
plot(Petal.Width ~ Petal.Length, col=c("black", "red", "blue")[Species], pch=(15:17)[Species], data=iris)
legend("topleft", legend=levels(iris$Species), col=c("black", "red", "blue"), pch=15:17)

## ------------------------------------------------------------------------
if(!file.exists("GSE12945.csv"))
  download.file("https://www.dropbox.com/sh/pukanjaahmonmcp/AADWX-vKk70CuGgYWBqqxWjfa/datasets/GSE12945.csv", destfile="GSE12945.csv", method="wget")
gse <- read.csv("GSE12945.csv")

## ------------------------------------------------------------------------
data(iris)
fit <- lm(Petal.Width ~ Petal.Length, data=iris)
class(fit)
methods(class=class(fit))
summary(fit) # show results

## ---- results='hide'-----------------------------------------------------
coefficients(fit) # model coefficients
predict(fit) # fitted predictions
predict(fit, newdata=data.frame(Petal.Length=seq(1, 2, by=0.1)))
confint(fit, level=0.95) # CIs for model parameters 
fitted(fit) # predicted values
residuals(fit) # residuals
anova(fit) # anova table 
influence(fit) # regression diagnostics

## ------------------------------------------------------------------------
library(broom)
tidy(fit)

## ------------------------------------------------------------------------
par(mfrow=c(2,2))
plot(fit)

## ------------------------------------------------------------------------
fit2 <- lm(Petal.Width ~ Petal.Length + Sepal.Length + Sepal.Width, data=iris)
summary(fit2) # show results
anova(fit, fit2)

## ------------------------------------------------------------------------
fit2int <- lm(Petal.Width ~ Petal.Length + Sepal.Length + Sepal.Width + Petal.Length:Sepal.Length, data=iris)
anova(fit2, fit2int)

## ------------------------------------------------------------------------
tail(model.matrix(~ Species, data=iris))
tail(iris)

## ------------------------------------------------------------------------
fit3 <- lm(Petal.Width ~ Petal.Length + Sepal.Length + Sepal.Width + Species, data=iris)
summary(fit3)
anova(fit2, fit3)

## ---- results='asis'-----------------------------------------------------
library(xtable)
print(xtable(fit3), type="html")
print(xtable(anova(fit3)), type="html")

## ------------------------------------------------------------------------
iris2 <- iris
iris2$virginica <- iris$Species == "virginica"
fit4 <- glm(virginica ~ Petal.Width + Petal.Length + Sepal.Length + Sepal.Width, data=iris2, family=binomial)
plot(fit4)

## ------------------------------------------------------------------------
fit5 <- glm(round(Petal.Width) ~ Petal.Length + Sepal.Length + Sepal.Width, data=iris2, family=poisson)
plot(fit5)
summary(fit5)

## ---- eval=FALSE---------------------------------------------------------
## library(gee)
## gee(formula, id, data, ...)

## ------------------------------------------------------------------------
plot(Petal.Width ~ Petal.Length, col=c("black", "red", "blue")[Species], pch=(15:17)[Species], xlab="Petal Length (cm)", ylab="Petal Width (cm)", data=iris)
newx <- data.frame(Petal.Length=seq(min(iris$Petal.Length), max(iris$Petal.Length), length.out=100))
conf.interval <- predict(fit, newdata=newx, interval="confidence")
pred.interval <- predict(fit, newdata=newx, interval="prediction")
lines(conf.interval[, "fit"] ~ newx[, 1], lty=1, lw=3)
lines(conf.interval[, "lwr"] ~ newx[, 1], lty=2)
lines(conf.interval[, "upr"] ~ newx[, 1], lty=2)
lines(pred.interval[, "lwr"] ~ newx[, 1], lty=3)
lines(pred.interval[, "upr"] ~ newx[, 1], lty=3)
legend("topleft", legend=c(levels(iris$Species), "CI", "PI"), col=c("black", "red", "blue", "black", "black"), pch=c(15:17, -1, -1), lty=c(-1, -1, -1, 2, 3))

## ------------------------------------------------------------------------
download.file("https://www.dropbox.com/sh/pukanjaahmonmcp/AADWX-vKk70CuGgYWBqqxWjfa/datasets/GSE12945.csv", destfile="GSE12945.csv", method="wget")
gse <- read.csv("GSE12945.csv", row.names=1)  #note that row.names is needed in this case to make the first column row names.
sapply(gse, class) #make sure classes are appropriate

## ------------------------------------------------------------------------
gse$G <- factor(gse$G, ordered=TRUE)
gse$T <- factor(gse$T, ordered=TRUE)
gse$N <- factor(gse$N, ordered=TRUE)
gse$M <- factor(gse$M, ordered=TRUE)

## ------------------------------------------------------------------------
(vars.to.test <- colnames(gse)[!colnames(gse) %in% "WIPF1"])

## ------------------------------------------------------------------------
all.lm <- lapply(vars.to.test, function(x){
  lm(as.formula(paste("WIPF1 ~", x)), data=gse)
})
names(all.lm) <- vars.to.test
all.p <- sapply(all.lm, function(mylm){
  fstat <- summary(mylm)$fstatistic
  1-pf(fstat[1], fstat[2], fstat[3])
})
t(all.p)
hist(all.p)

