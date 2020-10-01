#!/usr/bin/env python3
import sys
import json
import os
if len(sys.argv) != 2:
    exit("Invalid arguments")

with open(sys.argv[-1], "r") as f:
    data = json.loads(f.read())
formula = data[list(data.keys())[0]]["formula"]["path"]
data[list(data.keys())[0]]["formula"]["path"]=os.path.split(formula)[-1]
print(data)
