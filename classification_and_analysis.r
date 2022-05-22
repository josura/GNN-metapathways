library(randomForest)
library(dplyr)

#loading pathway embeddings
pathwayEmbeddings.Control <- read.csv("pathwayEmbeddingsControls.csv")
pathwayEmbeddings.Control <- subset(pathwayEmbeddings.Control,select = -c(id))
pathwayEmbeddings.Control$type <- as.factor(rep("Control",nrow(pathwayEmbeddings.Control)))

drop <- c("pathway_id","type","X")
patientsEmbeddings.control <- as.data.frame(t(as.matrix(pathwayEmbeddings.Control[,!(names(pathwayEmbeddings.Control) %in% drop)])))
colnames(patientsEmbeddings.control) <- gsub(":", ".",pathwayEmbeddings.Control$pathway_id)
patientsEmbeddings.control$type <- as.factor(rep("Control",nrow(patientsEmbeddings.control)))

pathwayEmbeddings.LumA.1 <- read.csv("pathwayEmbeddingsTumorLumA113-1.csv")
pathwayEmbeddings.LumA.1 <- subset(pathwayEmbeddings.LumA.1,select = -c(id))
pathwayEmbeddings.LumA.1$type <- as.factor(rep("LumA",nrow(pathwayEmbeddings.LumA.1)))

drop <- c("pathway_id","type","X")
patientsEmbeddings.LumA.1 <- as.data.frame(t(as.matrix(pathwayEmbeddings.LumA.1[,!(names(pathwayEmbeddings.LumA.1) %in% drop)])))
colnames(patientsEmbeddings.LumA.1) <- gsub(":", ".",pathwayEmbeddings.LumA.1$pathway_id)
patientsEmbeddings.LumA.1$type <- as.factor(rep("LumA",nrow(patientsEmbeddings.LumA.1)))

pathwayEmbeddings.LumA.2 <- read.csv("pathwayEmbeddingsTumorLumA113-2.csv")
pathwayEmbeddings.LumA.2 <- subset(pathwayEmbeddings.LumA.2,select = -c(id))
pathwayEmbeddings.LumA.2$type <- as.factor(rep("LumA",nrow(pathwayEmbeddings.LumA.2)))

drop <- c("pathway_id","type","X")
patientsEmbeddings.LumA.2 <- as.data.frame(t(as.matrix(pathwayEmbeddings.LumA.2[,!(names(pathwayEmbeddings.LumA.2) %in% drop)])))
colnames(patientsEmbeddings.LumA.2) <- gsub(":", ".",pathwayEmbeddings.LumA.2$pathway_id)
patientsEmbeddings.LumA.2$type <- as.factor(rep("LumA",nrow(patientsEmbeddings.LumA.2)))

pathwayEmbeddings.LumA.3 <- read.csv("pathwayEmbeddingsTumorLumA113-3.csv")
pathwayEmbeddings.LumA.3 <- subset(pathwayEmbeddings.LumA.3,select = -c(id))
pathwayEmbeddings.LumA.3$type <- as.factor(rep("LumA",nrow(pathwayEmbeddings.LumA.3)))

drop <- c("pathway_id","type","X")
patientsEmbeddings.LumA.3 <- as.data.frame(t(as.matrix(pathwayEmbeddings.LumA.3[,!(names(pathwayEmbeddings.LumA.3) %in% drop)])))
colnames(patientsEmbeddings.LumA.3) <- gsub(":", ".",pathwayEmbeddings.LumA.3$pathway_id)
patientsEmbeddings.LumA.3$type <- as.factor(rep("LumA",nrow(patientsEmbeddings.LumA.3)))

pathwayEmbeddings.LumA.4 <- read.csv("pathwayEmbeddingsTumorLumA113-4.csv")
pathwayEmbeddings.LumA.4 <- subset(pathwayEmbeddings.LumA.4,select = -c(id))
pathwayEmbeddings.LumA.4$type <- as.factor(rep("LumA",nrow(pathwayEmbeddings.LumA.4)))

drop <- c("pathway_id","type","X")
patientsEmbeddings.LumA.4 <- as.data.frame(t(as.matrix(pathwayEmbeddings.LumA.4[,!(names(pathwayEmbeddings.LumA.4) %in% drop)])))
colnames(patientsEmbeddings.LumA.4) <- gsub(":", ".",pathwayEmbeddings.LumA.4$pathway_id)
patientsEmbeddings.LumA.4$type <- as.factor(rep("LumA",nrow(patientsEmbeddings.LumA.4)))

pathwayEmbeddings.LumB <- read.csv("pathwayEmbeddingsTumorLumB113New.csv")
pathwayEmbeddings.LumB <- subset(pathwayEmbeddings.LumB,select = -c(id))
pathwayEmbeddings.LumB$type <- as.factor(rep("LumB",nrow(pathwayEmbeddings.LumB)))

drop <- c("pathway_id","type","X")
patientsEmbeddings.LumB <- as.data.frame(t(as.matrix(pathwayEmbeddings.LumB[,!(names(pathwayEmbeddings.LumB) %in% drop)])))
colnames(patientsEmbeddings.LumB) <- gsub(":", ".", pathwayEmbeddings.LumB$pathway_id)
patientsEmbeddings.LumB$type <- as.factor(rep("LumB",nrow(patientsEmbeddings.LumB)))

pathwayEmbeddings.Basal <- read.csv("pathwayEmbeddingsTumorBasal113New.csv")
pathwayEmbeddings.Basal <- subset(pathwayEmbeddings.Basal,select = -c(id))
pathwayEmbeddings.Basal$type <- as.factor(rep("Basal",nrow(pathwayEmbeddings.Basal)))

drop <- c("pathway_id","type","X")
patientsEmbeddings.Basal <- as.data.frame(t(as.matrix(pathwayEmbeddings.Basal[,!(names(pathwayEmbeddings.Basal) %in% drop)])))
colnames(patientsEmbeddings.Basal) <- gsub(":", ".",pathwayEmbeddings.Basal$pathway_id)
patientsEmbeddings.Basal$type <- as.factor(rep("Basal",nrow(patientsEmbeddings.Basal)))


new_df <- bind_rows(pathwayEmbeddings.Control, pathwayEmbeddings.Basal, pathwayEmbeddings.LumB, pathwayEmbeddings.LumA.1, pathwayEmbeddings.LumA.2, pathwayEmbeddings.LumA.3, pathwayEmbeddings.LumA.4)


commonPathways <- intersect(intersect(intersect(names(patientsEmbeddings.LumA.1), names(patientsEmbeddings.Basal)), names(patientsEmbeddings.LumB)) , names(patientsEmbeddings.control))
allPatients <- bind_rows(patientsEmbeddings.control[commonPathways], patientsEmbeddings.Basal[commonPathways], patientsEmbeddings.LumB[commonPathways], patientsEmbeddings.LumA.1[commonPathways], patientsEmbeddings.LumA.2[commonPathways], patientsEmbeddings.LumA.3[commonPathways], patientsEmbeddings.LumA.4[commonPathways])


split = sample(c(TRUE, FALSE), nrow(new_df), replace=TRUE, prob=c(0.75, 0.25))
splitpatients = sample(c(TRUE, FALSE), nrow(allPatients), replace=TRUE, prob=c(0.75, 0.25))

training = new_df[split, ]
testing = new_df[!split, ]
trainingPatients = allPatients[splitpatients, ]
testingPatients = allPatients[!splitpatients, ]
colnames(testing)[which(names(testing) == "type")] <- "true_type"
colnames(testingPatients)[which(names(testingPatients) == "type")] <- "true_type"


classifier.rf <- randomForest(true_type ~ ., data = training,importance=TRUE, proximity=TRUE)
classifier.rf.patients <- randomForest(type ~ ., data = trainingPatients,importance=TRUE, proximity=TRUE)

classifier.rf.patients

predictedType <- predict(classifier.rf,testing)
table(predictedType,testing$true_type)

predictedTypePatients <- predict(classifier.rf.patients,testingPatients)
table(predictedTypePatients,testingPatients$true_type)
