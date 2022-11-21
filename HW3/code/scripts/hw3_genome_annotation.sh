#!/usr/bin/env bash
conda activate ee282

# genome annotation

cd data/raw
curl 'https://ftp.flybase.net/releases/FB2022_05/dmel_r6.48/gtf/dmel-all-r6.48.gtf.gz' 
curl 'https://ftp.flybase.net/releases/FB2022_05/dmel_r6.48/gtf/md5sum.txt' -o FB_r6-48_md5sum.gtf.txt

md5sum -c FB_r6-48_md5sum.gtf.txt
#output
dmel-all-r6.48.gtf.gz: OK

#total number of features of each type
bioawk -c gff '{print $feature}' dmel-all-r6.48.gtf.gz | sort | uniq -c | sort -rn > annFeatureCount.txt
#total number of genes per chromosome arm
bioawk -c gff '{print $seqname,$feature}' dmel-all-r6.48.gtf.gz | grep "\Wgene" | sort | uniq -c |sort -rn | head -n +7 > annGeneCount.txt

