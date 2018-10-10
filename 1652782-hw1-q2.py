import sys
import time
import subprocess
def record(n):
	p=0
	while(p<=n):
		p+=1
		now=subprocess.check_output("uptime")
		#logging.info('%s', now[:-1].decode('utf-8'))
		print("%s" % (now[:-1].decode('utf-8')), file = f)
		time.sleep(10)


if __name__ == "__main__":
	if len(sys.argv) == 2:
		n=int(sys.argv[1])
	else:
		n=100
	f = open("1652782-hw1-q2.log", "w")
	#logging.basicConfig(filename='1652782-hw1-q2.log', level=logging.INFO)
	record(n)
	f.close()