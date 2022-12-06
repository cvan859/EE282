#!/usr/bin/env bash

cd data/raw
curl 'https://ftp.flybase.net/releases/FB2022_05/dmel_r6.48/fasta/dmel-all-chromosome-r6.48.fasta.gz' -o dmel-all-chromosome-r6.48.fasta.gz
curl 'https://ftp.flybase.net/releases/FB2022_05/dmel_r6.48/fasta/md5sum.txt' -o FB_r6-48_md5sum.txt

md5sum -c --ignore-missing FB_r6-48_md5sum.txt
#output
dmel-all-chromosome-r6.48.fasta.gz: OK

cd ..
faSize -tab dmel-all-chromosome-r6.48.fasta.gz > FB_r6-48_chr.faSize.txt
faSize -detailed dmel-all-chromosome-r6.48.fasta.gz > FB_r6-48_chr.detailed.txt

## Summaries of Partitions
faFilter -maxSize=100000 raw/dmel-all-chromosome-r6.48.fasta.gz raw/FB_r6-48_chr.small100kb.fasta
faFilter -maxSize=100000 -v raw/dmel-all-chromosome-r6.48.fasta.gz raw/FB_r6-48_chr.large100kb.fasta

faSize -tab raw/FB_r6-48_chr.small100kb.fasta > processed/FB_r6-48_chr.small.faSize.txt
faSize -tab raw/FB_r6-48_chr.large100kb.fasta > processed/FB_r6-48_chr.large.faSize.txt

## Plots
bioawk -cfastx '{print $name,length($seq),gc($seq)}' data/raw/FB_r6-48_chr.small100kb.fasta > output/tables/small.bioawk.txt | sort -rnk 2,2 output/tables/small.bioawksorted.txt

#1. plotHistLen 30 output/tables/small.bioawksorted.txt
#   plotHistLen 10 output/tables/large.bioawksorted.txt
#2. plotHistGC 30 output/tables/small.bioawksorted.txt
#   plotHistGC 10 output/tables/large.bioawksorted.txt
#3. cut -f 2 output/tables/small.bioawksorted.txt > output/tables/small.sizes.txt
#   plotCDF output/tables/small.sizes.txt output/figures/smalllengthdist.png
#   cut -f 2 output/tables/large.bioawksorted.txt > output/tables/large.sizes.txt
#   plotCDF output/tables/large.sizes.txt output/figures/largelengthdist.png



