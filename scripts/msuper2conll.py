import sys,os

input=sys.stdin
counter=1

for line in input:
	parts=line.split("\t")
	if len(parts)<2:
		counter=1
		print
		continue
	scount=parts[2]
	stag=""
	for i in xrange(3,len(parts),2):
		stag=stag+parts[i]+"||"
	out=str(counter)+"\t"+parts[0]+"\t_\t"+parts[1]+"\t"+parts[1]+"\t_\t0\troot\t"+stag[:-2]+"\n"
	print out,
	counter=counter+1
