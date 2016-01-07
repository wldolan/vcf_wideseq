# vcf_wideseq
SNP calling using bcftools, written for analyzing wideseq data

Used for comparing wideseq (MiSeq) reads to Arabidopsis reference genome. 

Workflow:
input: bam file, reference genome
1. align reads using bowtie2
2. sort sam file
3. convert sam to bam
4. sort and index bam file
5. create vcf file with samtools
6. perform variant calling with bcftools
output: vcf file (can be view with IGV)
