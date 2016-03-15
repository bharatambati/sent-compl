import sys,os

out1=open(sys.argv[1],"r")
out2=open(sys.argv[2],"r")
flag=0
mca=0
mcb=0
mcc=0
mcd=0
total=0
correct1=0
correct2=0

for line1 in out1:
	line2 = out2.readline().strip()
	if "inst#" in line1:
		flag=1
	elif flag==1 and line2!="":
		total=total+1
		parts1=line1.split()
		parts2=line2.split()
		if parts1[1]==parts1[2]:
			correct1=correct1+1
		if parts2[1]==parts2[2]:
			correct2=correct2+1
		if parts1[1]==parts1[2]:
			if parts1[1]==parts2[2]:
				mca=mca+1
			else:
				mcb=mcb+1
		else:
			if parts1[1]==parts2[2]:
				mcc=mcc+1
			else:
				mcd=mcd+1

print mca, mcb, mcc, mcd
print "Accuracy1: ",correct1," / ",total," = ",(1.0*correct1/total)
print "Accuracy2: ",correct2," / ",total," = ",(1.0*correct2/total)
