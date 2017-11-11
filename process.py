#!/usr/bin/python

import os
import sys
import datetime
import locale
from githubcity.ghcity import *

def main(argv):
    locale.setlocale(locale.LC_ALL, 'fr_FR')
    idGH = os.environ.get('GH_ID')
    secretGH = os.environ.get('GH_SECRET')
    ciudad = GitHubCity(idGH, secretGH)
    ciudad.readConfigFromJSON(argv[0])
    extraData = {
        "date": datetime.datetime.now().strftime(locale.nl_langinfo(locale.D_FMT)),
        "city": ciudad.city
    }
    ciudad.calculateBestIntervals()
    ciudad.addFilter("repos", ">1")
    ciudad.addFilter("followers", ">1")
    ciudad.getCityUsers()

    ciudad.export(os.path.abspath("templates/template_json"),os.path.abspath(argv[1]+".json"), "public", data=extraData)
    ciudad.export(os.path.abspath("templates/template_md"),os.path.abspath(argv[1]+".md"), "public", data=extraData)
    ciudad.configToJson(os.path.abspath(argv[0]))

if __name__ == "__main__":
   main(sys.argv[1:])
