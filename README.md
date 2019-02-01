# README:

Instalation and first steps with the [GHCNpy](https://github.com/jjrennie/GHCNpy) Python tool. GHCNpy pulls in data from the Global Historical Climatology Network - Daily Database from [NOAA](https://www.ncdc.noaa.gov/). Analysis and visualizations are also made.

GHCN-Daily comprises of nearly 100,000 stations globally, and includes over 50 different elements. The CORE elements are as follows:
- TMAX = Daily Maximum Temperature
- TMIN = Daily Maximum Temperature
- TAVG = Daily Average Temperature
- PRCP = Daily Precipitation
- SNOW = Daily Snowfall
- SNWD = Daily Snow Depth


## How to install:

Open a terminal and run the following commands:
```
# install dependencies, create virtual environment and clone the tool to noaa data collection from GitHub
> make install
# activate the virtual environment
> source activate daily
# python path for the current activated environment
> which python
# setup the library (for example, using my Python path)
> cd GHCNpy
> /home/juan/miniconda3/envs/daily/bin/python setup.py install
# test the library
> /home/juan/miniconda3/envs/daily/bin/python test.py
# include the virtual environment into the ipython kernel
> /home/juan/miniconda3/envs/daily/bin/python -m ipykernel install --user --name "daily"
```

## First steps

The first steps are showed in ```scripts/first_steps.py```.




## Clean the folder and uninstall the virtual environment

Open a terminal and run:
```
> make remove
```
