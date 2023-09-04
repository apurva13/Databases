import math

t=0.00
R = 6.0/10000
r = 1.0/10000
a = 8.0/10000
with open("output_generated_points.txt", 'w') as f:
    while t < 16*math.pi:
        x=(R + r) * math.cos((r / R) * t) - a * math.cos((1 + r / R) * t) -118.28547254287551
        y = (R + r) * math.sin((r / R) * t) - a * math.sin((1 + r / R) * t) + 34.02057587404623
        res=""
        res+=str(x)+ ',' +str(y)+ ",0.\n"
        f.write(res)
        #f.write("\n")
        t=t+0.01