import sys,os

in1=open(sys.argv[1],"r")
in2=open(sys.argv[2],"r")
out1=open(sys.argv[3],"w")
out2=open(sys.argv[4],"w")

raw_data=[]
exp_data=[]
count=0
pair_count=0

def get_pair(data1, data2):
	global pair_count
	pair_count=pair_count+1
	data1=" ".join(data1.split(" ")[2:])
	data2=" ".join(data2.split(" ")[2:])
	l1="2 qid:"+str(pair_count)+" "+data1
	l2="1 qid:"+str(pair_count)+" "+data2
	return l1+"\n"+l2

for line in in1:
	count=count+1
	if count%4 == 0:
		exp_data.append(in2.readline().strip())
		exp_data.append(in2.readline().strip())
		exp_data.append(in2.readline().strip())
		pairs=[]
		if raw_data[0]!=raw_data[1]:
			data = get_pair(exp_data[0],exp_data[1])
			out1.write(data+"\n")
			out2.write(raw_data[0]+"\n"+raw_data[1]+"\n")
			
			if raw_data[2]!=raw_data[0] and raw_data[2]!=raw_data[1]:
				data = get_pair(exp_data[0],exp_data[2])
				out1.write(data+"\n")
				out2.write(raw_data[0]+"\n"+raw_data[2]+"\n")
				data = get_pair(exp_data[1],exp_data[2])
				out1.write(data+"\n")
				out2.write(raw_data[1]+"\n"+raw_data[2]+"\n")
		else:
			if raw_data[1]!=raw_data[2]:
				data = get_pair(exp_data[1],exp_data[2])
				out1.write(data+"\n")
				out2.write(raw_data[1]+"\n"+raw_data[2]+"\n")
		raw_data=[]
		exp_data=[]
	else:
		raw_data.append(line.strip())

out1.close()
out2.close()
