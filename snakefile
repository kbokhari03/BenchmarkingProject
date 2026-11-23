
SAMPLES, = glob_wildcards("Input_Data/{sample}.fasta")

ALIGNERS = ["omega", "muscle", "kalign", "mafft"]

rule all:
    input:
        expand("output_data/{sample}_{aligner}.fa", sample = SAMPLES, aligner = ALIGNERS)

rule clean:
    shell:
        "rm -rf output_data/ benchmarks/"

rule run_omega_alignments:
    input:
        "Input_Data/{sample}.fasta"
    output:
        "output_data/{sample}_omega.fa"
    benchmark:
        "benchmarks/{sample}_omega.tsv"
    shell:
        "clustalo -i {input} -o {output}"

rule run_muscle_alignments:
    input:
        "Input_Data/{sample}.fasta"
    output:
        "output_data/{sample}_muscle.fa"
    benchmark:
        "benchmarks/{sample}_muscle.tsv"
    shell:
        "muscle -align {input} -output {output}"

rule run_kalign_alignments:
    input:
        "Input_Data/{sample}.fasta"
    output:
        "output_data/{sample}_kalign.fa"
    benchmark:
        "benchmarks/{sample}_kalign.tsv"
    shell:
        "kalign -i {input} -o {output}"

rule run_MAAFT_alignments:
    input:
        "Input_Data/{sample}.fasta"
    output:
        "output_data/{sample}_mafft.fa"
    benchmark:
        "benchmarks/{sample}_mafft.tsv"
    shell:
        "mafft {input} > {output}"
