# BenchmarkingProject
Repo for benchmarking various different MSA programs

Hello! This README will include instruction on installing all the MSA alignment programs and other dependencies necessary for running our project! 

This project will require the user to download various MSA programs. Instructions to installing the various MSA programs are listed as follows:

Conda and BioConda:
We highly recommend installing Conda and Bioconda for our benchmarking repo.  

Conda Installation Instructions:
In your terminal window, run the following commands:
```bash
curl -O https://repo.anaconda.com/archive/Anaconda3-2026.07-1-Linux-x86_64.sh
```
```bash
bash ~/Anaconda3-2026.07-1-Linux-x86_64.sh
```
Note: For this benchmarking project, the full Anaconda Distribution was installed. Miniconda should work  for this as well, however, the instructions are being written with the full Anaconda distribution in mind

Follow the prompts given and accept all the defaults

Once Anaconda is done installing, close and re-open your terminal window

To verify that Conda was successfully installed, run the command conda list. A list of installed packages should appear if installed correctly.

Bioconda:
Before installing Bioconda, verify that Conda is properly installed.

After verifying that Conda is installed, run these shell commands in the terminal.
```bash
conda config --add channels bioconda
conda config --add channels conda-forge
conda config --set channel_priority strict
```

Muscle: 
Note: Due to Muscle 5.3 not working properly with conda, we elected to use version 5.1 of Muscle. These instructions are for Muscle 5.3. 
To install Muscle, run the following shell command in your terminal:
```bash
conda install -c bioconda muscle=5.1
```

MAAFT:
To install MAAFT, run the following shell command in your terminal:
```bash
conda install -c bioconda mafft
```

Clustal Omega:
To install Clustal Omega, run the following shell command in your terminal:
```bash
conda install -c bioconda clustalo
```

Kalign: 
To install Kalign, run the following shell command in your terminal:
```bash
conda install bioconda::kalign2
```
Snakemake:
Our benchmarking project uses Snakemake to run all the alignment tests via one simple Snakemake file. To install Snakemake via conda, run the following command:
```bash
conda create -c conda-forge -c bioconda -c nodefaults -n snakemake snakemake
```
You will have to activate a snakemake environment afterwards to run our snakemake file:
```bash
conda activate snakemake
```
Instructions for Running Programs:
To verify that the various installed programs have been installed correctly, you can run each of the programs on the sample input data we have in our input folder. The various commands for running each MSA is as follows:

MAAFT
To run MAAFT, type in your bash shell:
```bash
maaft --auto input.fasta > output.fasta
```
The auto tag will automatically determine which algorithm will be used to run the MSA on the input data.
input.fasta refers to a fasta file that contains the sequences you want to align
This command will output a fasta file 

Muscle:
To run Muscle, type in your bash shell:
```bash
muscle -align input.fasta -output aligned_output.fa
```
The align tag is the default algorithm that is used for Muscle.
Input.fasta refers to the input fasta file that contains the sequences to be aligned, and aligned_output.fa is the output file which contains the alignments

Clustal Omega:
To run Clustal Omega, type in your bash shell:
```bash
clustalo -i input.fasta -o aligned_output.fasta
````
The -i refers to the input file, the -o refers to the output tag

Kalign: 
To run Kalign, type in your bash shell:
```bash
kalign -i input.fasta -o output.fasta
```
The -i refers to the input file, the -o refers to your output file

Snakefile:
Our snakemake file will call all the MSAs on our balibase unaligned fasta file and output a text file with benchmarking stats for each alignment it performs. NOTE: Snakemake file is still a work in progress and is not completed as of yet. 

To run our snakemake file on any input data you would like to test, move the files into our input file folder, and then enter the following bash commmand:
```bash
snakemake --cores
```
