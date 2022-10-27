# Analysis Proposal for Fall 2022 EE282 Final Project

Author: Cassandra Van
Date: October 26, 2022

## Using deconvolution to dissect human liver and heart endocrine communication

I am looking to use single-cell datasets for the heart and liver to determine patterns of gene expression for cell types, then apply those patterns to heart and liver bulk datasets to explore cell type communication within and across these tissues.

My lab already has human bulk sequencing available from the GTEx Project^1^, which I can filter through for heart and liver, and even expand beyond those tissues if time allows. This data is downloaded onto our lab server. For the single-cell datasets, it currently seems that Tabula Sapiens^2^ has the most accessible, curated, and annotated datasets for various tissues, including heart and liver. If time allows, I will find other single-cell datasets through literature search to enhance and confirm the expression patterns I obtain from the single-cell datasets.

I expect that I will do all my analysis in R, as many of the packages and tools I would like to use are implemented in R. I’ll begin my analysis by checking the cell type annotations from Tabula Sapiens through various EnrichR^3^^,^^4^ databases to confirm that they align with literature annotations. EnrichR is a gene set enrichment analysis tool that draws from various published gene-set libraries. The GTEx dataset will also need to be pre-processed for the heart and liver tissues, and so that the resulting subsets match the input structure needed by the ADAPTS^5^ package, which I will use for deconvolution. Deconvolution involves applying signature gene expression patterns, termed signature matrices, obtained from the single-cell dataset, to the bulk dataset, whereupon I will have estimates of cell type abundances in the bulk tissues. There are several algorithms^6^ included in the ADAPTS package that I will have to test on each iteration of signature matrix optimization. I can save plots of my deconvolution results comparing the different deconvolution algorithms, and any optimization testing.

Once I have those abundances, I can look at the cell type enrichment of particular genes within one of the tissues, or how cell types might correlate with functional GO pathways both within and across tissues. I could also compare how the heart-liver crosstalk might differ in both directions to and from each tissue.

### References

1. https://www.gtexportal.org/home/

2. The Tabula Sapiens Consortium, Science 376, eabl4896 (2022)

3. Chen EY, Tan CM, Kou Y, Duan Q, Wang Z, Meirelles GV, Clark NR, Ma'ayan A. Enrichr: interactive and collaborative HTML5 gene list enrichment analysis tool. BMC Bioinformatics. 2013;128(14)

4. Kuleshov MV, Jones MR, Rouillard AD, Fernandez NF, Duan Q, Wang Z, Koplev S, Jenkins SL, Jagodnik KM, Lachmann A, McDermott MG, Monteiro CD, Gundersen GW, Ma'ayan A. Enrichr: a comprehensive gene set enrichment analysis web server 2016 update. Nucleic Acids Research. 2016; gkw377. 

5. https://cran.r-project.org/web/packages/ADAPTS/

6. Avila Cobos, F., Alquicira-Hernandez, J., Powell, J.E. et al. Benchmarking of cell type deconvolution pipelines for transcriptomics data. Nat Commun 11, 5650 (2020). https://doi.org/10.1038/s41467-020-19015-1




