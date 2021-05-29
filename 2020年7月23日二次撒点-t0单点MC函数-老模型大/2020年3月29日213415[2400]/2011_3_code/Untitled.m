syms  r
a=solve(r^2+1,r)
b=~isreal(a(1))
double(a)
r1_max=max(a)
r1_min=min(a)