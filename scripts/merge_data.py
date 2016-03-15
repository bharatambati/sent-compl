import sys,os

in1=open(sys.argv[1],"r")
in2=open(sys.argv[2],"r")
out=open(sys.argv[3],"w")

for line1 in in1:
	line1=line1.strip()
	line2=in2.readline().strip()
	if line1!=line2:
		out.write(line1+"\n")
		out.write(line2+"\n")
		out.write("**********\n")
	else:
		print line
out.close()
