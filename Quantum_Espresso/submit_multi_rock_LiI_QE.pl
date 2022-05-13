#!/usr/bin/perl

use POSIX qw/floor/;

######################
$QE_ver=0;
$hours0=3;
$mins0=00;

@l1i=(0,1);
@l1a=(2.00,2.10,2.20,2.30,2.40,2.50,2.60,2.70,2.80,2.90,3.00,3.10,3.20,3.30,3.40,3.50,3.60,3.70,3.80,3.90,4.00,4.10,4.20,4.30,4.40,4.50,4.60,4.70,4.80,4.90,5.00,5.10,5.20,5.30,5.40,5.50,5.60,5.70,5.80,5.90,6.00,6.10,6.20,6.30,6.40,6.50,6.60,6.70,6.80,6.90,7.00,7.10,7.20,7.30,7.40,7.50,7.60,7.70,7.80,7.90,8.00);

$l1l='ALAT';

$nMols_per_Task=-1; # -1 to fix the number of cores
$nCores=32;
$nTasks_per_Node=32;


$workDir=`pwd`;
chomp($workDir);

foreach $l1 (@l1i) {

 $l1s=sprintf("%.6f",$l1a[$l1]);
 $l1d="${l1l}_${l1s}";

 # create/change dir
 if (!(-d $l1d)) {
  mkdir($l1d);
 }
 chdir("$workDir/$l1d");

 if ($nMols_per_Task < 0) {
  $nTasks=$nCores;
  $hours_calc=$hours0;
  $mins_calc=$mins0;
  #$mins_calc=floor(((2**$l1)**$scaling)*($hours0*60+$mins0));
 } else {
  $nTasks=$l1a[$l1]/$nMols_per_Task;
  $hours_calc=$hours0;
  $mins_calc=$mins0;
 }

 $ids="$l1d";
 $sTasks=sprintf("%05d",$nTasks);

 $path = "$workDir";
 $path =~ s/\//\\\//g;

 system "sed -e \'s/##$l1l##/$l1s/g\' $workDir/LiI_rock.template > input.$l1s.inp";

 # Args[default]: queue[-1] cores cores/node[-1] node-type[-1] mem/core[-1] hours mins name inp out #links exe
 system "submit_QE.pl -1 $nTasks $nTasks_per_Node -1 -1 $hours_calc $mins_calc LiI-R-$l1s-$nCores input.$l1s.inp output.$l1s.out 1 $QE_ver";
  
 chdir("$workDir");

} #level1

