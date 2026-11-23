

UNALIGNED_FILE = "Input_Data/{sample}_query.faa"

SAMPLES, = glob_wildcards(UNALIGNED_FILE)

ALIGNERS = ["omega", "muscle", "kalign", "mafft"]

wildcard_constraints:
    aligner = "omega|muscle|kalign|mafft"

rule all:
    input:
        "AlignmentScores.tsv"

rule clean:
    shell:
        "rm -rf output_data/ benchmarks/ scores/ AlignmentScores.tsv"

rule run_omega_alignments:
    input:
        UNALIGNED_FILE
    output:
        "output_data/{sample}_omega.fa"
    benchmark:
        "benchmarks/{sample}_omega.tsv"
    shell:
        "clustalo -i {input} -o {output}"

rule run_muscle_alignments:
    input:
        UNALIGNED_FILE
    output:
        "output_data/{sample}_muscle.fa"
    benchmark:
        "benchmarks/{sample}_muscle.tsv"
    shell:
        "muscle -align {input} -output {output}"

rule run_kalign_alignments:
    input:
        UNALIGNED_FILE
    output:
        "output_data/{sample}_kalign.fa"
    benchmark:
        "benchmarks/{sample}_kalign.tsv"
    shell:
        "kalign -i {input} -o {output}"

rule run_MAAFT_alignments:
    input:
        UNALIGNED_FILE
    output:
        "output_data/{sample}_mafft.fa"
    benchmark:
        "benchmarks/{sample}_mafft.tsv"
    shell:
        "mafft {input} > {output}"

rule score_alignment:
    input:
        aln = "output_data/{sample}_{aligner}.fa",
        ref = "Input_Data/{sample}_reference.faa"
    output:
        "scores/{sample}_{aligner}.tsv"
    shell:
        """
        sop=$(phykit sum_of_pairs_score {input.aln} -r {input.ref})
        cs=$(phykit column_score {input.aln} -r {input.ref})
        echo -e "{wildcards.sample}\t{wildcards.aligner}\t$sop\t$cs" > {output}
        """

rule collect_scores:
    input:
        expand("scores/{sample}_{aligner}.tsv", sample=SAMPLES, aligner=ALIGNERS)
    output:
        "AlignmentScores.tsv"
    shell:
        """
        echo -e "BAliBASE_id\taligner\tsop\tcs" > {output}
        cat {input} >> {output}
        """