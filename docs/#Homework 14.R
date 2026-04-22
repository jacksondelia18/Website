#Homework 14

# multivariate analysis

# For reproducible results
set.seed(1)

install.packages("psych")
install.packages("randomForest")

# Packages used today
library(ggplot2)
library(tidyverse)
library(psych)        # Bartlett's test
library(randomForest) # Random forest

# Data
plant <- read_csv("plant_data_fix.csv")

head(plant)


microbes <- plant[, 7:10]
moisture <- plant$`Moisture treatment`

round(cor(microbes), 2)

bart <- cortest.bartlett(cor(microbes), n = nrow(microbes))
bart





pca <- prcomp(microbes, center = TRUE, scale. = FALSE)
summary(pca)




eig <- pca$sdev^2
pve <- eig / sum(eig)

pca_var_table <- data.frame(
  PC = paste0("PC", 1:length(eig)),
  Eigenvalue = round(eig, 3),
  PVE = round(pve, 3),
  CumPVE = round(cumsum(pve), 3)
)
pca_var_table




plot(eig, type = "b", pch = 19,
     xlab = "Principal component",
     ylab = "Eigenvalue",
     main = "Scree plot (plant PCA)")



# test
broken_stick <- function(p) sapply(1:p, function(k) sum(1/(k:p)) / p)
bs <- broken_stick(ncol(microbes))

retain <- data.frame(
  PC = paste0("PC", 1:length(pve)),
  ObservedPVE = round(pve, 3),
  BrokenStick = round(bs, 3),
  Keep = pve > bs
)
retain


head(pca$x)

pca$rotation


scores <- as.data.frame(pca$x)
scores$Treatment <- plant$Moisture_treatment


plt <- ggplot(scores, aes(PC1, PC2, color = Treatment)) +
  geom_point(size = 2.6, alpha = 0.85) +
  theme_minimal() +
  labs(title = "PCA on plant", subtitle = "PCA is unsupervised; treatment used only for coloring")

plt + stat_ellipse() # 95% CI




plant_new <- read.csv("plant_data_new.csv")


set.seed(42)
id_train <- sample(seq_len(nrow(plant_new)), size = 0.7 * nrow(plant_new))
train <- plant_new[id_train, ]
test  <- plant_new[-id_train, ]


set.seed(42)
rf <- randomForest(
   Soil_moisture ~ ., data = train,
  ntree = 500,
  mtry = 2,
  importance = TRUE
)
rf


pred <- predict(rf, newdata = test)
conf <- table(Observed = test$Soil_moisture, Predicted = pred)
conf

acc <- mean(pred == test$Soil_moisture)
acc


plot(rf, main = "Random forest OOB error vs number of trees")

importance(rf)

varImpPlot(rf)
