function P=sub(x,y,t)

n=length(y);

P=y(n);
for k=n:-1:1
    P=y(k)+(t-x(k))*P;
end