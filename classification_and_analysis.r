library(randomForest)
library(dplyr)

#loading pathway embeddings
pathwayEmbeddings.Control <- read.csv("pathwayEmbeddingsControls.csv")
pathwayEmbeddings.Control <- subset(pathwayEmbeddings.Control,select = -c(id))
pathwayEmbeddings.Control$type <- as.factor(rep("Control",nrow(pathwayEmbeddings.Control)))

pathwayEmbeddings.LumA.1 <- read.csv("pathwayEmbeddingsTumorLumA113-1.csv")
pathwayEmbeddings.LumA.1 <- subset(pathwayEmbeddings.LumA.1,select = -c(id))
pathwayEmbeddings.LumA.1$type <- as.factor(rep("LumA",nrow(pathwayEmbeddings.LumA.1)))

pathwayEmbeddings.LumA.2 <- read.csv("pathwayEmbeddingsTumorLumA113-2.csv")
pathwayEmbeddings.LumA.2 <- subset(pathwayEmbeddings.LumA.2,select = -c(id))
pathwayEmbeddings.LumA.2$type <- as.factor(rep("LumA",nrow(pathwayEmbeddings.LumA.2)))

pathwayEmbeddings.LumA.3 <- read.csv("pathwayEmbeddingsTumorLumA113-3.csv")
pathwayEmbeddings.LumA.3 <- subset(pathwayEmbeddings.LumA.3,select = -c(id))
pathwayEmbeddings.LumA.3$type <- as.factor(rep("LumA",nrow(pathwayEmbeddings.LumA.3)))

pathwayEmbeddings.LumA.4 <- read.csv("pathwayEmbeddingsTumorLumA113-4.csv")
pathwayEmbeddings.LumA.4 <- subset(pathwayEmbeddings.LumA.4,select = -c(id))
pathwayEmbeddings.LumA.4$type <- as.factor(rep("LumA",nrow(pathwayEmbeddings.LumA.4)))

pathwayEmbeddings.LumB <- read.csv("pathwayEmbeddingsTumorLumB113New.csv")
pathwayEmbeddings.LumB <- subset(pathwayEmbeddings.LumB,select = -c(id))
pathwayEmbeddings.LumB$type <- as.factor(rep("LumB",nrow(pathwayEmbeddings.LumB)))

pathwayEmbeddings.Basal <- read.csv("pathwayEmbeddingsTumorBasal113New.csv")
pathwayEmbeddings.Basal <- subset(pathwayEmbeddings.Basal,select = -c(id))
pathwayEmbeddings.Basal$type <- as.factor(rep("Basal",nrow(pathwayEmbeddings.Basal)))


new_df <- bind_rows(pathwayEmbeddings.Control, pathwayEmbeddings.Basal, pathwayEmbeddings.LumB, pathwayEmbeddings.LumA.1, pathwayEmbeddings.LumA.2, pathwayEmbeddings.LumA.3, pathwayEmbeddings.LumA.4)



split = sample(c(TRUE, FALSE), nrow(new_df), replace=TRUE, prob=c(0.75, 0.25))

training = new_df[split, ]
testing = new_df[!split, ]
colnames(testing)[which(names(testing) == "type")] <- "true_type"


classifier.rf <- randomForest(type ~ ., data = training,importance=TRUE, proximity=TRUE)

classifier.rf

predictedType <- predict(classifier.rf,testing)
table(predictedType,testing$true_type)
