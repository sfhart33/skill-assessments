# Sam's answers to questions from "Linux for Bioinformatics"

**Q1. What is your home directory?**

/home/ubuntu

**Q2. What is the output of this command?**

hello_world.txt

**Q3. What is the output of each ls command?**

ls my_folder: 
ls my_folder2: hello_world.txt

**Q4. What is the output of each?**

ls my_folder:
ls my_folder2: 
ls my_folder3: hello_world.txt

**Q5. What editor did you use and what was the command to save your file changes?**

nano, using Ctrl-O to say changes

**Q6. What is the error?**

Error: No supported authentication methods available server sent: public key)
Reason: You're not connecting with the appropriate user name for your AMI when you negotiate an SSH session with an EC2 instance.

**Q7. What was the solution?**

Create a key pair for the new user account and add it to the .ssh/authorized_key file: https://aws.amazon.com/premiumsupport/knowledge-center/new-user-accounts-linux-instance/

**Q8. what does the sudo docker run part of the command do? and what does the salmon swim part of the command do?**

The "docker run" part of the command starts a new container to run the foloowing command. The "salmon swim" part of the command in turn is described as "perform super-secret operation", which appears to be to print this logo output

**Q9. What is the output of this command?**

serveruser is not in the sudoers file.  This incident will be reported.

**Q10. What is the output of flask --version?**

Python 3.9.12
Flask 2.1.3
Werkzeug 2.0.3

**Q11. What is the output of mamba -V?**

conda 4.14.0

**Q12. What is the output of which python?**

/home/serveruser/miniconda3/envs/py27/bin/python

**Q13. What is the output of which python now?**

/home/serveruser/miniconda3/bin/python

**Q14. What is the output of salmon -h?**

salmon v1.4.0

Usage:  salmon -h|--help or
        salmon -v|--version or
        salmon -c|--cite or
        salmon [--no-version-check] <COMMAND> [-h | options]

Commands:
     index      : create a salmon index
     quant      : quantify a sample
     alevin     : single cell analysis
     swim       : perform super-secret operation
     quantmerge : merge multiple quantifications into a single file

**Q15. What does the -o athal.fa.gz part of the command do?**

Writes the output to a file named "athal.fa.gz"

**Q16. What is a .gz file?**

This is an archive compressed using gzip

**Q17. What does the zcat command do?**

Uncompresses the transcriptome file and prints to the standard output

**Q18. what does the head command do?**

Prints only the first few lines of the file to output

**Q19. what does the number 100 signify in the command?**

Specifies to print the first 100 lines

**Q20. What is | doing? -- Hint using | in Linux is called "piping"**

The pipe takes the output of the zcat command (full file) and continues on as that as the input of the head command, to only print the first 100 lines.

**Q21. What is a .fa file? What is this file format used for?**

This is short for fasta format, which is used to show nucleotide/peptide sequences, each precided by a > line with information about the following sequence (e.g. transcript name and info, chromosome, etc.)

**Q22. What format are the downloaded sequencing reads in?**

It is in .sra format

**Q23. What is the total size of the disk?**

7.6 Gb

**Q24. How much space is remaining on the disk?**

2.1 Gb

**Q25. What went wrong?**

Ran out of storage

**Q26: What was your solution?**

Compress the output immidiately using pipe and gzip: fastq-dump --stdout SRR074122 | gzip > SRR074122.fastq.gz