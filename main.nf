nextflow.enable.dsl=2
params.publish_dir = './results'

params.str = 'Hello world!'

workflow {
process smallish {
    container "quay.io/nextflow/bash"
    publishDir "${params.publish_dir}/", mode: 'copy'
    label 'process_low'

    output:
    path "./smallish.txt", emit: smallish_file

    """
    free -h > smallish.txt
    """
}

process largerish {
    container "quay.io/nextflow/bash"
    publishDir "${params.publish_dir}/", mode: 'copy'
    label 'process_high'

    output:
    path "./largerish.txt", emit: largerish_file

    """
    free -h > largerish.txt
    """
}

    smallish | view
    largerish | view
}
