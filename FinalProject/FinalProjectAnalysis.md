# Using deconvolution to dissect human liver and heart endocrine communication
#### Author: Cassandra Van
#### Date: December 9, 2022

## Introduction
In the body, no organ functions in isolation; instead, there is a constant symphony of organs playing inside the body where each organ is comprised of a variety of coordinated but highly diverse cell types. It follows that organs are reciprocally listening to and exerting some influence over the activation and direction of the others in order to remain in harmony, so how can we learn more about those influences? Many tissues have been sequenced for their mRNA expression as bulk datasets, providing depth into overall gene expression by using sheer numbers, and many have also been sequenced as single-cell datasets, providing specificity for each cell at decreased depth. These two modalities can be leveraged to gain further insight into the crosstalk, that is, putative endocrine communication, between cell types, tissues, and organs. Understanding this crosstalk both in more depth and from a broader view, will improve our ability to track, affect, and learn from the robust systems in the body.

## Methods
#### Datasets 
Human single-cell RNA sequencing data for each tissue was obtained from Tabula Sapiens as direct downloads. These datasets include cell type annotations from literature and from histology counts.
Bulk RNA sequencing data was obtained from GTEx Portal and formatted by Dr. Marcus Seldin, then shared with the lab as an RData workspace. It contains 1,833,286 genes measured across 452 individuals.
GO terms were obtained from Uniprot annotations and also formatted by Dr. Marcus Seldin and shared with the lab as an RData workspace.
#### Packages installed: 
Seurat, SeuratDisk, ADAPTS, DeconRNASeq, WGCNA, mclust
#### Workflow 
(`code/scripts/FinalProject_fullscript`)
Single-cell datasets were first converted to Seurat (`code/scripts/h5adtoh5seurat`) using the package `SeuratDisk` and the metadata explored using the `Seurat` package and the RStudio interface. Two categories were identified as containing cell type annotations: `SeuratObject@meta.data$free_annotation` (histology counts) and `SeuratObject@meta.data$cell_ontology_class` (literature). I decided that `SeuratObject@meta.data$free_annotation` would be more reliable in concept, but will compare to results from `SeuratObject@meta.data$cell_ontology_class` in future. I collected the annotations for future comparison using `code/scripts/h5seuratCellAnnots`, then used `code/scripts/scProcessing` to collect the normalized counts matrices, summing and averaging them by cell type so that each cell type has an expression vector.
I ran the 30 most-top-ranked genes that should define each cell type through EnrichR (`EnrichrCheck`), and most cell types turned out as expected or near to that.
Bulk datasets were filtered for the tissue of interest, then only individuals with expression values over zero were used, resulting in 206 individuals for both heart and liver, with 37413 non-duplicated genes in heart and 34591 non-duplicated genes in liver (`bulkProcessing`).
Then both the single-cell and bulk datasets for a given tissue, were used as inputs to various deconvolution algorithms, applied through the `ADAPTS` package (`code/scripts/ADAPTSmethods`). After reviewing the cell types estimated by the various methods, and comparing to published tissue compositions, I ended up choosing the estimates from DeconRNASeq, for both tissues as it turns out, as the most likely to be physiologically relevant. 
Those deconvoluted estimates were then used to ask more biologically relevant questions, like how cell types might correlate with a given gene of interest (`code/scripts/localGOI`) and how the cell types from one tissue might correlate with the signaling in another tissue, as evidenced by GO pathway enrichment terms (`crossTissueGO`).
## Results
From previous work in the lab, I identified a few genes that might potentially function as endocrine communication molecules. One of these genes is CRLF2, a cytokine receptor, also called TSLPR as its ligand is TSLP, which plays a major role in acute lymphoblastic leukemia and is implicated in the development of the hematopoietic system. From our screen, though, CRLF2 originating from the liver seemed to be correlated with changes in heart function pathways, like core contractile function and hypertrophy. This held up during in vitro and in vivo work, so the question now is, by what mechanism does CRLF2 effect change in heart function? 
Deconvoluting bulk RNA sequencing can give us the power to more reliably correlate changes in signaling with cell types and between tissues. But we must still understand that we produce only estimates that must be validated more broadly. Looking at CRLF2 within the liver, it seems that hepatocytes are negatively correlated with CRLF2, along with a number of immune cell types, but not some others. Within the heart, the cell types are not as well defined, but while I’m not sure why hepatocytes are a cell type identified in the heart single-cell dataset, the negative correlation with them is very strong. In comparison, the macrophages have a slight positive correlation, but fibroblasts seem to be the only cell type more consistently positively correlated. This may point to more subtle variance in the dataset getting amplified by the transformations of the algorithms, so requires further study and comparison.
I also tried looking at how cell types might correlate across tissues in functional pathways. While the more meaningful biological interpretation might need to wait for more technical troubleshooting of the cell type deconvolution, I think there could be much nuance gained in comparing cell types of one tissue to the expression patterns in another.
## Discussion
I used only normalized values for both my single-cell and bulk datasets, but I intend to go back through and systematically test the effect of scaling on the various possible combinations, though that also has biological implications. In my case, I mostly want to observe the effects of the ratios of the cell types, and less the specific identification of the quantities of cell types, so perhaps a relative difference of cell types is more meaningful. So perhaps more than scaling any particular dataset, applying these methods to multiple single-cell datasets might increase my power more reliably.
Overall, there are many more genes and tissues that can be queried, individually and in combination, expanding the possibility of endocrine connection between tissues. 
## References
## Supplementary
EnrichR comparisons
Metadata annotations


