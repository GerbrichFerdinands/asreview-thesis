#!/usr/bin/env python
# coding: utf-8
import json
import numpy as np
from asreviewcontrib.statistics import StateStatistics

import argparse
import os

def parse_arguments():
  parser = argparse.ArgumentParser(description="testing argparser")
  parser.add_argument("-path", type=dir_path)
  parser.add_argument("-output", type=dir_path)
  return parser.parse_args()

def dir_path(path):
     if os.path.isdir(path):
         return path
     else:
         raise argparse.ArgumentTypeError(f"readable_dir:{path} is not a valid path")

args=parse_arguments()

#print(dir_path(args.path))

# state
state_dict = StateStatistics.from_path(args.path, wss_vals=[95], rrf_vals=[10]).to_dict()

# settings
state_dict["settings"] = vars(state_dict["settings"])

# define function to convert numpy int64 to integers
def convert_int64(mydict):
    for key, value in mydict.items():
        if isinstance(value, np.int64):
            #print(key, value)
            mydict[key] = int(value)
        elif isinstance(value, dict):
            convert_int64(value)

convert_int64(state_dict)

# save as json file
with open(args.output, "w") as f:
    json.dump(state_dict, f)
