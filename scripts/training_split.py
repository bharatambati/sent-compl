'''
Created on 26 May 2014

@author: siva
'''

import sys
import json
import random

random.seed(1)

infile = open(sys.argv[1], "r")
train_file = open(sys.argv[1] + ".train.txt", "w")
devel_file = open(sys.argv[1] + ".devel.txt", "w")
test_file = open(sys.argv[1] + ".test.txt", "w")

sys.stderr.write("Creating train dev and test splits\n");
data=[]
sent=""

for line in infile:
	if line.startswith("**********"):
		data.append(sent.strip())
		sent=""
	else:
		sent=sent+line.strip()+"\t"

random.shuffle(data)
random.shuffle(data)
random.shuffle(data)
random.shuffle(data)
random.shuffle(data)
random.shuffle(data)
random.shuffle(data)

split_data_size = 20 * len(data) / 100

for line in data[:3*split_data_size]:
    train_file.write(line.replace("\t","\n"))
    train_file.write("\n**********\n")
train_file.close()

for line in data[3*split_data_size:4*split_data_size]:
    devel_file.write(line.replace("\t","\n"))
    devel_file.write("\n**********\n")
devel_file.close()

for line in data[4*split_data_size:]:
    test_file.write(line.replace("\t","\n"))
    test_file.write("\n**********\n")
test_file.close()
