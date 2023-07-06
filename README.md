# Build a graph from runcmd-data files

Plotte Programmlaufzeiten eines Programms aus den Files welche runcmd schreibt.

* Sourcefiles: $HOME/runcmd_logging_rzomstp/runcmd*.csv

## Step-by-step

~~~~
git clone git@lvgom01.sozvers.at:repos/bin_runtime_runcmd.git
cd bin_runtime_runcmd
bundle
scp <user>@<machine>:~/runcmd_logging_rzomstp/runcmd*2023*.csv data/
bash rohdaten.sh ldbprtds
ruby charting.rb ldbprtds_14_Pr
~~~~


