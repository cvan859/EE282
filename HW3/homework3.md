# Homework 3: Pipelines

#### Author: Cassandra Van
#### Date: November 7, 2022

I loaded my environment and made initial files using `code/scripts/initialSetup.sh`. I realized after the fact, though, that using `createProject` had confused my Git tracking, so I ended up pushing an inaccessible submodule of my `Homework3` folder at first. After looking around on the Internet, I deleted the internal `.git` file and renamed my `Homework3` folder so Git could recognize it again.

## Genome Assembly
All code used for this section is noted in `code/scripts/hw3_genome_summary.sh.`

md5sum output: `dmel-all-chromosome-r6.48.fasta.gz: OK`

1. There are 137,547,960 total nucleotides, counting all the chromosome arms.
2. There are 268 total Ns. If every chromosome arm is split on an N (using faSplitByN), there should be one less N than the number of contigs reported back for each arm (275 contigs were reported back).
3. There are 1870 sequences contained in the fasta.gz file, including 7 chromosome arms, 25 mapped scaffolds, and 22 unmapped scaffolds, leaving 1816 contigs.

## Annotation File
All code used for this section is noted in `code/scripts/hw3_genome_annotation.sh`.

md5sum output: `dmel-all-r6.48.gtf.gz: OK`

1. There are 16 different features, in order from most common to least common: 
(see `output/tables/annFeatureCount.txt` for results table)
    1. 190050 exon
    2. 163242 CDS
    3.  46802 5UTR
    4.  33738 3UTR
    5.  30885 start_codon
    6.  30825 stop_codon
    7.  30799 mRNA
    8.  17896 gene
    9.   3053 ncRNA
    10.   485 miRNA
    11.   365 pseudogene
    12.   312 tRNA
    13.   300 snoRNA
    14.   262 pre_miRNA
    15.   115 rRNA
    16.    32 snRNA
2. There are the following number of genes per chromosome arm:
(see `output/tables/annGeneCount.txt` for results table)`
    - X:  2708 genes
    - Y:  113 genes
    - 2L: 3515 genes
    - 2R: 3653 genes
    - 3L: 3489 genes
    - 3R: 4227 genes
    - 4:  114 genes

