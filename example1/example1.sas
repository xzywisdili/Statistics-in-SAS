data Water;
  infile "F:\D-codes\SAS\SAS_Statistics\Statistics-in-SAS\example1\WATER.dat";
  input flag $ 1 Town $ 2-18 Mortal 19-22 Hardness 25-27;
  if flag eq "*" then location = "North";
  else location = "South";
run;

title "Water Dateset";
proc print data=Water noobs;
run;

proc univariate data=Water normal;
  var mortal hardness;
  histogram mortal hardness / normal;
  probplot mortal hardness;
run;

title "Relations between Mortal and Hardness"; 
proc sgplot data=Water;
  scatter y=mortal x=hardness;
run;

proc corr data=Water pearson spearman;
  var mortal hardness;
run;

title "Relations between Mortal and Hardness";
title2 "in Different Locations";
proc sgplot data=Water;
  scatter y=mortal x=hardness / group = location;
run;

proc sort data=Water;
  by location;
proc corr data=Water pearson spearman;
  var mortal hardness;
  by location;
run;

proc kde data=Water;
  bivar mortal hardness / plots=surface;
run;

data Water;
  set Water;
  lhardness = log(hardness);
proc ttest;
  class location;
  var mortal hardness lhardness;
proc npar1way wilcoxon;
  class location;
  var hardness;
run;

proc boxplot data=Water;
  plot (mortal hardness)*location; 
run;