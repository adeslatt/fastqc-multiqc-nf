# Fastqc-multiqc-nf

This is a [Nextflow](https://nextflow.io) workflow built as part of the [Kids-First-Elements-of-Style-Workflow-Creation-Maintenance](https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/README.md) class given remotely August 22-26, 2022

It demonstrates several simple concepts for the [Nextflow Introduction](https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/classes/Building-A-Nextflow-Script/README.md#session-1-nextflow)

Including:
* [Pipeline Parameters](https://www.nextflow.io/docs/latest/getstarted.html?highlight=parameters#pipeline-parameters)
* [Processes](https://www.nextflow.io/docs/latest/process.html)
* [Channels](https://www.nextflow.io/docs/latest/channel.html)
* [Operators](https://www.nextflow.io/docs/latest/operator.html)
* [Configuration](https://www.nextflow.io/docs/latest/config.html)

This file uses two processes using the [Anaconda](anaconda.org) packaging from the [bioconda channel](https://anaconda.org/bioconda):
* [fastqc](https://anaconda.org/bioconda/fastqc)
* [multiqc](https://anaconda.org/bioconda/multiqc)

The containers used as noted in the *`nextflow.config`* file are retrieved from the CAVATICA registry and were constructed from Dockerfiles:
* [fastqc-docker](https://github.com/adeslatt/fastqc-docker)
* [multiqc-docker](https://github.com/adeslatt/multiqc-docker)
