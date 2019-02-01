# @Author: juan
# @Date:   2019-01-31T16:52:02+09:00
# @Last modified by:   juan
# @Last modified time: 2019-01-31T16:52:08+09:00

import pandas as pd
import click
import ghcnpy as gp

def main():
    ## get metadata file file (ghcnd-stations.txt)
    click.secho('>>> Get metadata file (ghcnd-stations.txt)',fg = 'green')
    gp.get_ghcnd_stations()
    ## get inventory file (ghcnd-inventory.txt)
    click.secho('>>> Get inventory file (ghcnd-inventory.txt)',fg = 'green')
    gp.get_ghcnd_inventory()
    ## find stations
    click.secho('>>> Find stations... Example: "NEW ORLEANS"',fg='green')
    gp.find_station("NEW ORLEANS")
    ## download
    click.secho('>>> Download data in csv format after finding the target station ID... Example: "NEW ORLEANS LAKEFRONT AP" ', fg = 'green')
    gp.output_to_csv("USW00053917")
    ## read data
    click.secho('>>> Read data... Example: "NEW ORLEANS LAKEFRONT AP"',fg='green')
    data = pd.read_csv('USW00053917.csv')
    print(data.head())
    print(data.tail())

    # return
    return None


if __name__ == '__main__':
    main()
