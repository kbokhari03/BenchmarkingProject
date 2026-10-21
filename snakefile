
SAMPLES, = glob_wildcards("Input_Data/{sample}.fasta")

rule all:
    input:
        expand("output_data/{sample}.fa", sample=SAMPLES)

rule run_omega_alignments:
    input:
        "Input_Data/{sample}.fasta"
    output:
        "output_data/{sample}.fa"
    benchmark:
        "benchmarks/{sample}.tsv"
    shell:
        "clustalo -i {input} -o {output}.fa"





