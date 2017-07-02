︠40c46991-161d-434f-a843-e9390cae1031︠
#Euler 11 So the answer is 70600674
f = open('euler11.txt')
S=f.read().split(' ');
w=20;l=20;
T=[[0 for x in range(w)] for y in range(l)]

for i in range(20):
    for j in range(20):
        T[i][j]=int(S[i*20+j])
up=max([T[i][j]*T[i-1][j]*T[i-2][j]*T[i-3][j] for i in range(3,20) for j in range(0,19)])
down=max([T[i][j]*T[i+1][j]*T[i+2][j]*T[i+3][j] for i in range(0,17) for j in range(0,19)])
right=max([T[i][j]*T[i][j+1]*T[i][j+2]*T[i][j+3] for j in range(0,17) for i in range(0,19)])
left=max([T[i][j]*T[i][j-1]*T[i][j-2]*T[i][j-3] for j in range(3,20) for i in range(0,19)])
downdiag=max([T[i][j]*T[i+1][j+1]*T[i+2][j+2]*T[i+3][j+3] for j in range(0,17) for i in range(0,17)])
updiag=max([T[i][j]*T[i-1][j-1]*T[i-2][j-2]*T[i-3][j-3] for j in range(3,20) for i in range(3,20)])
leftdiag=max([T[i][j]*T[i+1][j-1]*T[i+2][j-2]*T[i+3][j-3] for j in range(3,20) for i in range(0,17)])
rightdiag=max([T[i][j]*T[i-1][j+1]*T[i-2][j+2]*T[i-3][j+3] for j in range(0,17) for i in range(3,19)])
print max(up,down,left,right,downdiag,updiag,leftdiag,rightdiag)
︡5f531ea9-8a66-440c-9fbf-e9e2fbf5c20d︡{"stdout":"70600674\n"}︡{"done":true}︡
︠e07905b4-73af-4c50-b82a-57b8f738c4b8︠
#Euler 12 so ans is 76576500. Note the dictionary is really useful in speeding up computations but make sure it has priority over direct computation
dict2={}
def divlookup(n):
    if n in dict2:
        return dict2[n]
    else:
        dict2[n]=len(divisors(n))
        return dict2[n]
I=0
i=2
while I<501:
    i+=1
    I=prod(divlookup(A[0]^A[1]) for A in factor((i*(i+1)/2)))
print i*(i+1)/2,I
︡6aa1b0a1-ce01-443b-ac5c-4fbd495918b7︡{"stdout":"76576500 576\n"}︡{"done":true}︡
︠47de1526-c90f-4e9f-9582-a71fd9738b29︠
#Euler 15 so ans is 137846528820. Note The dictionary is really useful in speeding up computations but make sure it has priority over direct computation
dict1={}   
def numpaths(m,n):
    if n==1 and m!=1:
        return m+1
    elif m==1 and n!=1:
        return n+1
    elif (m,n)==(1,1):
        return 2
    elif (m,n) in dict1:
        return dict1[(m,n)]
    elif (n,m) in dict1:
        return dict1[(n,m)]    
    else:
        dict1[(m,n-1)]= numpaths(m,n-1)
        dict1[(m-1,n)]= numpaths(m-1,n)
        return dict1[(m,n-1)] + dict1[(m-1,n)]
    
numpaths1(20,20)
︡19f7b850-ecee-4b6c-8600-d9d82c84f161︡{"stdout":"137846528820\n"}︡{"done":true}︡
︠6072a781-4f78-4fc9-9dfd-e9b529d74e47︠
#Euler 21 so ans is 31626
def sumdiv(n):
    return sum(p for p in divisors(n) if p <n)
def is_amicable(p,q):
    return sumdiv(p)==q and sumdiv(q)==p
print sum([n for n in range(2,10001) if is_amicable(n,sumdiv(n)) and n!=sumdiv(n)])

︡59bd22ac-15d9-4e5e-96d0-74c47f89c0dc︡{"stdout":"31626"}︡{"stdout":"\n"}︡
︠04579cc0-2ab3-40a0-8a64-f9981f00940cs︠
T='ASDSADAS'
T[3]
sum(dict3[k] for k in T)
︡ff3dcaeb-7bce-4a50-bd9e-95649910373a︡{"stdout":"'S'\n"}︡{"stdout":"68\n"}︡{"done":true}︡
︠9878672f-7f9d-4194-a471-ec73f57e5670s︠
#Euler 22 so ans is 871198282
dict3={'':0,'A':1,'B':2,'C':3,'D':4,'E':5,'F':6,'G':7,'H':8,'I':9,'J':10,'K':11,'L':12,'M':13,'N':14,'O':15,'P':16,'Q':17,'R':18,'S':19,'T':20,'U':21,'V':22,'W':23,'X':24,'Y':25,'Z':26}
f=open('p022_names.txt')
S=f.read().split(',')
S.sort()
T=[A[1:-1] for A in S]
total = sum(sum(dict3[sr] for sr in T[i])*(i+1) for i in range(len(T)));total

︡9e3d3e79-5c2b-43e8-a2d2-63a3e99a006d︡{"stdout":"871198282\n"}︡{"done":true}︡
︠ffbf049c-c871-4646-8044-440c51a9ff1c︠

︡f1f6a133-0781-4087-9637-8cab20e6c334︡
︠53fcfa24-6f5f-4b83-b46d-996dbe9f87f8︠
#Euler 31 So answer is 73682

def nways(n,coins):
    coins.sort()
    total=0
    if(len(coins)==1):
        return 0 if(n%coins[0]!=0 and n!=0) else 1
    else:
        for j in range(0,int(n/coins[-1])+1):
            smaller_n = (n-j*coins[-1])
            total= total+1 if smaller_n==0 else total+nways(smaller_n,coins[:-1])
        return total    
nways(200,[1,2,5,10,20,50,100,200])
︡950b01b2-085a-4dd1-9247-aa6b51b80f89︡{"stdout":"73682"}︡{"stdout":"\n"}︡{"done":true}︡
︠c8b48897-7e75-4eff-9226-45b40c211415s︠
#Euler 34 So answer is 40730
def is_curious(n):
    s=str(n)
    return n==sum(factorial(int(s[i])) for i in range(len(s)))

sum(n for n in range(3,2540160) if is_curious(n))

︡c3f28006-ba87-401c-b380-257fef61d781︡{"stdout":"40730"}︡{"stdout":"\n"}︡{"done":true}︡︡︡
︠ffc7d142-d770-49eb-9602-88d0d0d3a505︠
# Euler 37 so answer is 748317
count = -4
sum=0
for p in range(11,1000000):
    if p in Primes():
        if count==15:
            break
        s=str(p)        
        L=[int(s[:i]) for i in range(1,len(s)+1) if int(s[:i]) in Primes()]
        R=[int(s[i:]) for i in range(len(s)) if int(s[i:]) in Primes() ]
        if len(s)==len(R) and len(s)==len(L):
            count+=1
            sum+=p
print sum
︡8b03851c-e9c0-45bf-bc71-2e75fb0c5c36︡{"stdout":"748317\n"}︡{"done":true}︡
︠5af5b92b-f38a-4d8a-89a5-af9311cec5e6︠
# Euler 47 so answer is 134043
for i in range(644,1000000):
    if len(prime_factors(i))==4 and len(prime_factors(i+1))==4 and len(prime_factors(i+2))==4 and len(prime_factors(i+3))==4:
        print i
        break
︡16d584b2-9a0e-4e1f-930e-187704045f6f︡{"stdout":"134043"}︡{"stdout":"\n"}︡{"done":true}︡
︠f6c0309b-3151-4b32-a202-390fbde621ae︠
#Euler 40 so answer is 210
arr=[str(num)[i] for num in range(1,1000000) for i in range(len(str(num))) ]
prod(int(arr[i]) for i in [0,9,99,999,9999,99999,999999])
︡db8fabdb-6458-462a-80fe-f03f6304602e︡{"stdout":"210\n"}︡{"done":true}︡
︠06fe1b7c-cece-476e-b64e-1a2fafe692d6s︠
#Euler 39 NEED TO FIX!!!
def numtriangle(p):
    ans=0
    for i in range(1,p):
        for j in range(1,i+1):
            if i+j<p-j:
                a=[i,j,p-i-j]
                if a[2]^2==a[0]^2+a[1]^2:
                    ans+=1                    
    return ans                    
l=[numtriangle(i) for i in range(1,600)]
max(l)
︡9b8cd52b-51d7-4bbb-99bf-4457eb2a345a︡{"stdout":"5\n"}︡{"done":true}︡
︠ff998cfb-54e3-4f77-bcb9-cf141a551ee8︠
#Euler 42 so answer is 162
f=open('p042_words.txt')
read1 = f.read().split(',')
dict1={'':0,'a':1,'b':2,'c':3,'d':4,'e':5,'f':6,'g':7,'h':8,'i':9,'j':10,'k':11,'l':12,'m':13,'n':14,'o':15,'p':16,'q':17,'r':18,'s':19,'t':20,'u':21,'v':22,'w':23,'x':24,'y':25,'z':26}
def wordtonum(s,dict):
    return sum(dict[s[i].lower()] for i in range(len(s)))
m=max(len(s) for s in read1)
tri=[i*(i+1)/2 for i in range(1,m+3)]
len([s for s in read1 if wordtonum(s[1:-1],dict1) in tri ])
︡595824f1-ce2f-4c35-bcd9-9111f1284cb8︡{"stdout":"162\n"}︡{"done":true}︡
︠fdc4ea92-df8e-47a3-aac5-e167bf8988a5s︠
#Euler 48 so answer is 9110846700
sum((n^n)%10000000000 for n in range(1,1001))%10000000000
︡ea03f714-898f-4f93-9e17-150303e08887︡{"stdout":"9110846700\n"}︡{"done":true}︡
︠056d0395-eb69-472b-a0a8-93e9b5eb0a37︠
#Euler 49
def permprimenum(n):
    sol=0
    









