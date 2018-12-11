data Water;
  infile "F:\D-codes\SAS\SAS_Statistics\Statistics-in-SAS\example1\WATER.dat";
  input flag $ 1 Town $ 2-18 Mortal 19-22 Hardness 25-27;
  if flag eq "*" then location = "North";
  else location = "South";
run;

title "Water Dateset";
proc print data=Water noobs;
run;