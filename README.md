# BenchmarkingProject
Repo for benchmarking various different MSA programs
Hello! This README will include instruction on installing all the MSA alignment programs and other dependencies necessary for running our project! 

This project will require the user to download various MSA programs. Instructions to installing the various MSA programs are listed as follows:

Conda and BioConda:
We highly recommend installing Conda and Bioconda for our benchmarking repo.  

Conda Installation Instructions:
In your terminal window, run the following command:
```bash
bash Anaconda-latest-Linux-x86_64.sh
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
To install Muscle, run the following shell command in your terminal:
```bash
conda install -c bioconda muscle
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
To install Kaling, run the following shell command in your terminal:
```bash
conda install bioconda::kalign2
```

