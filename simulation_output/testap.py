#!/usr/bin/env python
import argparse
import os

def parse_arguments():
  parser = argparse.ArgumentParser(description="testing argparser")
  parser.add_argument("-path", type=dir_path)
  #parser.add_argument("--output", type=dir_path)
  return parser.parse_args()

def dir_path(path):
    if os.path.isdir(path):
        return path
    else:
        raise argparse.ArgumentTypeError(f"readable_dir:{path} is not a valid path")

args=parse_arguments()

print(dir_path(args.path))
