import sys
import datetime
def prime(n):
	flag = [1]*(n+2)
	ans=0
	p=2
	while(p<=n):
		ans+=len(lens[p-1])-2
		for i in range(2*p,n+1)[::p]:
			flag[i] = 0
		while 1:
			p += 1
			if(flag[p]==1):
				break
	print("%d" % (ans), file = out)

if __name__ == "__main__":
	if len(sys.argv) == 2:
		n=sys.argv[1]
	else:
		n="1652782-hw1-q2.log"

	with open(n, "r") as f:
		out = open("1652782-hw1-q3.log", "w")
		#for line in f.readlines():
			#print(line)
		lens=f.readlines()
		print("%d" % (len(lens)), file = out)
		#for line in f.readlines()
		# i=1
		# while(i<len(lens)):
		# 	i+=1
		# 	print(len(lens[i]))
		datetime1=datetime.datetime.strptime(lens[0][1:9], "%H:%M:%S")
		datetime2=datetime.datetime.strptime(lens[len(lens)-1][1:9], "%H:%M:%S")
		# print(datetime1)
		# print(datetime2)
		timedelta=(datetime2-datetime1).total_seconds()
		timed=int(timedelta)
		print(timed, file = out)
		#datetime2 = datetime1 - timedelta
		i=0
		ans=0.0000
		while(i<(len(lens))):
			# print(lens[i][50:55])
			ans+=float(lens[i][50:55])
			# print(ans)
			i+=1
		# print("%.4f"%ans)
		ans/=len(lens)
		print("%.4f" % ans, file = out)
		prime(len(lens))

