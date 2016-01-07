#!/bin/bash

#$1=='read1'
#$2=='read2'
#$3=='prefix'


cd ~/Documents/FOSsequencing/set2/

### align reads using bowtie2
bowtie2 -p 2 -x ../TAIR10ref/TAIR10 -1  $1 -2 $2 > $3.sam

##sort sam file
samtools sort -o $3sorted.sam -T $3sortemp.prefix $3.sam


##convert sam to bam
samtools view -bh -o $3.bam $3sorted.sam


##sort and index bam file
samtools sort -o $3sort.bam -T $3sortemp.prefix $3.bam

samtools index $3sort.bam


##create vcf file with samtools

samtools mpileup -D -v -f TAIR10.fa $3sort.bam -o $3.vcf


##perform variant calling with bcftools
bcftools call -c -v -o $3bcf.vcf $3.vcf
