#!/bin/csh -fx
#**************************************************************************************
# Purpose: Prepare N Deposition files for SWAT
# Inputs: ${SHAREDIR}/dailyWETH
#
# Developed by: UNC Institute for the Environment
#
# Date: 10/30/2017
#
#***************************************************************************************
#
# Set up runtime environment
#
setenv    EPIC_DIR /proj/ie/apps/longleaf/sallocator/festc1.4/epic #/common_data/EPIC_model
setenv    COMM_DIR   ${EPIC_DIR}/common_data

# met yearly file location
setenv    NDEP_TYPE    dailyNDep_2004
setenv    NDEP_FILE  ${COMM_DIR}/EPIC_model/ndep_5yrAver_20040101_to_20041231.nc

setenv OUTDIR  ${COMM_DIR}/EPIC_model/$NDEP_TYPE/
if ( ! -e $OUTDIR ) mkdir -p $OUTDIR

echo $NDEP_FILE
echo "Transfer netcdf input file to daily txt format: " $NDEP_TYPE

R CMD BATCH   transfer_dailNdep_nc2txt_2004.R
