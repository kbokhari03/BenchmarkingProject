
SAMPLES, = glob_wildcards("Input_Data/{sample}.fasta")

rule all:
    input:
        expand("output_data/{sample}.fa", sample=SAMPLES),
        expand("output_data/{sample}_muscle.fasta", sample=SAMPLES)

rule run_omega_alignments:
    input:
        "Input_Data/{sample}.fasta"
    output:
        "output_data/{sample}.fa"
    benchmark:
        "benchmarks/{sample}.tsv"
    shell:
        "clustalo -i {input} -o {output}.fa"

rule run_muscle_alignments:
    input:
        "Input_Data/{sample}.fasta"
    output:
        "output_data/{sample}_muscle.fasta"
    benchmark:
        "benchmarks/{sample}_musclebenchmark.tsv"
    shell:
        "muscle -align {input} -output {output}_muscle.fasta"

rule run_kalign_alignments:
    input:
        "Input_Data/{sample}.fasta"
    output:
        "output_data/{sample}_kalign.fa"
    benchmark:
        "benchmarks/{sample}_kalignbenchmark.tsv"
    shell:
        "kalign -i {input} -o {output}"

rule run_MAAFT_alignments:
    input:
        "Input_Data/{sample}.fasta"
    output:
        "output_data/{sample}_maaft.fa"
    benchmark:
        "benchmarks/{sample}_maaft.tsv"
    shell:
        "maaft {input} > {output}"