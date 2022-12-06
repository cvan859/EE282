# Homework 4: Pipelines, Genome Assembly

#### Author: Cassandra Van
#### Date: December 5, 2022

## Partitions of a genome (<=100kb and >100kb)

#### Summaries
##### For <=100kb:
(values found in Homework4/partitions/data/processed/FB_r6-48_chr.small.faSize.txt)
1. Total number of nucleotides = 6178042
2. Total number of Ns = 662563
3. Total number of sequences = 1863
##### For >100kb:
(values found in Homework4/partitions/data/processed/FB_r6-48_chr.large.faSize.txt)
1. Total number of nucleotides = 137547960
2. Total number of Ns = 490385
3. Total number of sequences = 7

#### Plots
##### For <=100kb:
1. Sequence length distribution: Homework4/partitions/output/figures/smalllengthHist.png
2. Sequence GC% distribution: Homework4/partitions/output/figures/smallGCHist.png
3. Cumulative length distribution: Homework4/partitions/output/figures/smalllengthdist.png
###### For >100kb:
1. Sequence length distribution: Homework4/partitions/output/figures/smalllengthHist.png
2. Sequence GC% distribution: Homework4/partitions/output/figures/smallGCHist.png
3. Cumulative length distribution: Homework4/partitions/output/figures/largelengthdist.png

## Genome assembly

#### Assembly with minimap2 and miniasm
I was unable to get minimap2 and miniasm to work together (see minimap2 output HERE); instead I used minimap (see minimap output HERE), where the values calulated seemed the same, but the formatting was something miniasm was able to parse to collect the sequences for assembly.

#### Assembly assessment
1. N50 of my assembly = 4494246. That is, the contigs larger than the contig of size 4,494,246 capture at least 50% of the assembly volume. Compared to the Drosophila community reference of 21,485,538, it falls far short.
2. Contiguity plot comparing the assemblies: Homework4/assembly/output/figures/contiguity.png
3. BUSCO score comparison: Homework4/assembly/output/figures/busco_summaries/busco_figure.png



