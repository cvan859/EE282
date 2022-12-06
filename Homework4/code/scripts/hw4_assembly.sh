#!/usr/bin/env bash

conda install -c bioconda minimap2
conda install -c bioconda miniasm
conda install -c bioconda fastqc
conda install -c bioconda busco

cp /pub/jje/ee282/iso1_onp_a2_1kb.fastq /pub/cassandv/myrepos/ee282/Homework4/data/raw

fastqc -o data/processed -d tmp data/raw/iso1_onp_a2_1kb.fastq -t 16

n50 () {
  bioawk -c fastx ' { print length($seq); n=n+length($seq); } END { print n; } ' $1 \
  | sort -rn \
  | gawk ' NR == 1 { n = $1 }; NR > 1 { ni = $1 + ni; } ni/n > 0.5 { print $1; exit; } '
}
minimap2 -x ava-ont -t 16 data/raw/iso1_onp_a2_1kb.fastq data/raw/iso1_onp_a2_1kb.fastq | gzip -1 > data/processed/overlap.paf.gz
miniasm -f data/processed/iso1_onp_a2_1kb.fastq data/processed/overlap.paf.gz > assembly.gfa
awk ' $0 ~/^S/ { print ">" $2" \n" $3 } ' data/processed/assembly.gfa \
| tee >(n50 /dev/stdin > output/reports/n50.txt) \
| fold -w 60 \
> data/processed/unitigs.fa

# rerun with minimap because miniasm could not parse minimap2 format for some reason.
minimap -t 16 -Sw5 -L100 -m0 raw/iso1_onp_a2_1kb.fastq raw/iso1_onp_a2_1kb.fastq > processed/overlapPBminimap.paf
miniasm -f data/processed/iso1_onp_a2_1kb.fastq data/processed/overlap.paf > unitigs.gfa
awk ' $0 ~/^S/ { print ">" $2" \n" $3 } ' data/processed/unitigs.gfa \
| tee >(n50 /dev/stdin > output/reports/n50.txt) \
| fold -w 60 \
> data/processed/unitigs.fa

mkdir data/busco
busco -i contigs.fasta -l diptera_odb10 -o contigs.busco -m geno --out_path data/busco
busco -i data/raw/dmel-all-chromosome-r6.48.fasta -l diptera_odb10 -o scaffold.busco -m geno --out_path data/busco
busco -i data/processed/unitigs.fa -l diptera_odb10 -o unitigs.busco -m geno --out_path data/busco


