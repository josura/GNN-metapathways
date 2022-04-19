#loading pathway embeddings
pathwayEmbeddings.LumA.1 <- read.csv("pathwayEmbeddingsTumorLumA113-1.csv")
subset(pathwayEmbeddings.LumA.1,select = -c(id,pathway_id))

pathwayEmbeddings.LumA.2 <- read.csv("pathwayEmbeddingsTumorLumA113-2.csv")
subset(pathwayEmbeddings.LumA.1,select = -c(id,pathway_id))

pathwayEmbeddings.LumA.3 <- read.csv("pathwayEmbeddingsTumorLumA113-3.csv")
subset(pathwayEmbeddings.LumA.1,select = -c(id,pathway_id))

pathwayEmbeddings.LumA.4 <- read.csv("pathwayEmbeddingsTumorLumA113-4.csv")
subset(pathwayEmbeddings.LumA.1,select = -c(id,pathway_id))