#!/usr/bin/bash

# To run the program type:
# sh motif_finder.sh input_file_name motif
# E.g. sh motif_finder.sh short_seq.fasta AA..CC

# Create variables
INPUT_FILE=$1
MY_MOTIF=$2
OUTPUT_FILE=$3.fasta

grep --no-group-separator -B 1 $MY_MOTIF $INPUT_FILE > $OUTPUT_FILE  

echo Done!

