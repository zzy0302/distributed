import sys
def prime(n):
    flag = [1]*(n+2)
    ans=0
    p=2
    while(p<=n):
        ans+=p
        for i in range(2*p,n+1)[::p]:
            flag[i] = 0
        while 1:
            p += 1
            if(flag[p]==1):
                break
    #print(ans)
    #logging.info('%s',ans)
    print("%d" % (ans), file = f)
# test
if __name__ == "__main__":
    if len(sys.argv) == 2:
        n=int(sys.argv[1])
    else:
        n=100
    f = open("1652782-hw1-q1.log", "w")
    #logging.basicConfig(filename='1652782-hw1-q1.log', level=logging.INFO)
    prime(n)
    f.close()
