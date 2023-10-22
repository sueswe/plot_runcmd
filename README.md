
**This is for testing only**

---

# Build a graph from runcmd-data files

Plot data (from runcmd) with ruby.

* Sourcefiles: $HOME/runcmd_logging_rzomstp/runcmd*.csv


## Step-by-step

~~~
git clone git@github.com/sueswe/plot_runcmd.git
cd plot_runcmd
bundle
~~~

* get source files:

~~~
scp <user>@<machine>:~/runcmd_logging_rzomstp/runcmd*2023*.csv data/
~~~

* generate plot:

~~~
ruby charting.rb -t plot-title  -p program_name
~~~

.
