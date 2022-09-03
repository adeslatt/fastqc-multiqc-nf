#!/usr/bin/env nextflow

//fastqc_multiqc_wf.nf

def helpMessage() {
    log.info """
    Usage:
    The typical command for running the pipeline is as follows:
    nextflow run main.nf --bams sample.bam [Options]
    
    Inputs Options:
    --reads               This is where the fq.gz files are entered
    """.stripIndent()
}

params.help = ""

// Show help message
if (params.help) {
  helpMessage()
  exit 0
}

reads = Channel.fromFilePairs(params.reads, size: 2)

process fastqc {

    tag "$name"
    publishDir "results", mode: 'copy'
    container 'pgc-images.sbgenomics.com/deslattesmaysa2/fastqc:v1.0'

    input:
    set val(name), file(reads) from reads

    output:
    file "*_fastqc.{zip,html}" into fastqc_results

    script:
    """
    fastqc $reads
    """
}
process multiqc {

    publishDir "results", mode: 'copy'
    container 'pgc-images.sbgenomics.com/deslattesmaysa2/multiqc:v1.0'

    input:
    file ('fastqc/*') from fastqc_results.collect()

    output:
    file "*multiqc_report.html" into multiqc_report
    file "*_data"

    script:
    """
    multiqc . -m fastqc
    """
}