nextflow.enable.dsl=2
params.publish_dir = './results'

params.str = 'Hello world!'

workflow {
process low_proc {
    container "quay.io/nextflow/bash"
    publishDir "${params.publish_dir}/", mode: 'copy'
    label 'process_low'

    output:
    path "./low_proc.txt", emit: low_proc

    """
    free -h > low_proc.txt
    """
}

process high_proc {
    container "quay.io/nextflow/bash"
    publishDir "${params.publish_dir}/", mode: 'copy'
    label 'process_high'

    output:
    path "./high_proc.txt", emit: high_proc

    """
    free -h > high_proc.txt
    """
}

    low_proc | view
    high_proc | view
}
