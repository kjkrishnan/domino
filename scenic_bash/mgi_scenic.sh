#!/bin/bash
# This script is for data sets with MGI symbols.
# Define number of threads to use
THREADS=32

# Get the path to the docker scratch folder
DOCKER_LINK=~/docker_scratch

docker run -it --rm \
    -v ${DOCKER_LINK}:/scenicdata \
    aertslab/pyscenic:0.10.0 pyscenic grn \
    --num_workers $THREADS \
    -o /scenicdata/adjacencies.tsv \
    /scenicdata/counts.tsv \
    /scenicdata/mm_mgi_tfs.txt

docker run -it --rm \
    -v ${DOCKER_LINK}:/scenicdata \
    aertslab/pyscenic:0.10.0 pyscenic ctx \
    /scenicdata/adjacencies.tsv \
    /scenicdata/mm9-500bp-upstream-10species.mc9nr.feather \
    /scenicdata/mm9-500bp-upstream-7species.mc9nr.feather \
    /scenicdata/mm9-tss-centered-10kb-10species.mc9nr.feather \
    /scenicdata/mm9-tss-centered-10kb-7species.mc9nr.feather \
    /scenicdata/mm9-tss-centered-5kb-10species.mc9nr.feather \
    /scenicdata/mm9-tss-centered-5kb-7species.mc9nr.feather \
    --annotations_fname /scenicdata/motifs-v9-mgi.tbl \
    --expression_mtx_fname /scenicdata/counts.tsv \
    --mode "dask_multiprocessing" \
    --output /scenicdata/regulons.csv \
    --num_workers $THREADS

docker run -it --rm \
    -v ${DOCKER_LINK}:/scenicdata \
    aertslab/pyscenic:0.10.0 pyscenic aucell \
    /scenicdata/counts.tsv \
    /scenicdata/regulons.csv \
    -o /scenicdata/auc_mtx.csv \
    --num_workers $THREADS
