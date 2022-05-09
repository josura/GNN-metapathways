# Graph Neural Networks and Gene metapathways
1. Received the expression matrices
2. Finished the first part of genes embeddings with two different types of models since the data has different features.
3. Finished the implementation and the parameter tuning to reach the objectives, released the documentation
4. Future research

# preliminary steps
After the decompression of the datasets, the column names should be changed to be conform to the ones in brca\_clinical.txt, e.g. for the tumor expression matrices, the \_01 at the end of the column names should be removed

The project contains 3 jupyter notebooks and 1 R code to create the classification model, these are:
- **Inference.ipynb** where the results embeddings are compared and analyzed
- **testGraph.ipynb** where the GNN models are built for the main research
- **AdditionalModels.ipynb** where additional models are built
- **classification\_and\_analysis.r** where the classification model is created from the embeddings
