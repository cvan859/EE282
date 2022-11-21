#!/usr/bin/env bash
conda activate ee282

cd data/raw
curl 'https://ftp.flybase.net/releases/FB2022_05/dmel_r6.48/fasta/dmel-all-chromosome-r6.48.fasta.gz'
curl 'https://ftp.flybase.net/releases/FB2022_05/dmel_r6.48/fasta/md5sum.txt' -o data/FB_r6-48_md5sum.txt

#checksum
md5sum -c -ignore-missing FB_r6-48_md5sum.txt

faSize -detailed dmel-all-chromosome-r6.48.fasta.gz > FB_r6-48_chr.faSize.txt
cut -f 2 FB_r6-48_chr.sorted.txt > FB_r6-48_chr.sorted.sizes.txt

#number of nucleotides
head -n +7 data/processed/FB_r6-48_chr.sorted.sizes.txt | awk '{s+=$1} END {print s}'

#number of Ns
faSplitByN data/raw/dmel-all-chromosome-r6.48.fasta.gz FB_r6-48_byN.fasta 10
gzip data/raw/FB_r6-48_byN.fasta.gz
faSize -detailed FB_r6-48_byN.fasta.gz > FB_r6-48_byN.faSize.txt
grep -P "^[\d][L,R]_ctg*" data/processed/FB_r6-48_byN.faSize.txt >> data/processed/NCount.txt
grep -P "^[4,X,Y]_ctg*" data/processed/FB_r6-48_byN.faSize.txt >> data/processed/NCount.txt
awk '{s+=$1-1} END {print s}' data/processed/NCountNum.txt

#number of sequences
wc -l data/processed/FB_r6-48_chr.faSize.txt
#equivalent to:
zgrep "^>" data/raw/dmel-all-chromosome-r6.48.fasta.gz | wc -l

