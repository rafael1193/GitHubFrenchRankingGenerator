#!/usr/bin/python

import os
import sys
import datetime
from githubcity.ghregion import *
from argparse import ArgumentParser

def read_arguments():
    """Parse the command-line arguments."""
    parser = ArgumentParser(description="Run regions")
    parser.add_argument("-c", "--city", action='append',
                        help="add city")
    parser.add_argument("-r", "--region",
                        help="name of the region")
    parser.add_argument("-o", "--output",
                        help="output")
    return parser

def main():
    args = read_arguments()
    parsedArgs = args.parse_args()

    region = GitHubRegion()
    extraData = {
        "date": datetime.datetime.now().strftime("%d/%m/%Y"),
        "city": parsedArgs.region
    }


    for c in parsedArgs.city:
        region.addCity(c)

    region.export(os.path.abspath("templates/template_json"),os.path.abspath(parsedArgs.output+".json"), "public", data=extraData, limit=100)
    region.export(os.path.abspath("templates/template_md"),os.path.abspath(parsedArgs.output+".md"), "public", data=extraData, limit=100)


if __name__ == "__main__":
   main()
