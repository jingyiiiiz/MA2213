function P = ComputePolynomial(a, x)

m=length(a);
P=a(m);
for k=m-1:-1:1
    P=a(k)+x*P;
end