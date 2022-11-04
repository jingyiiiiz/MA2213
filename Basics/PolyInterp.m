function f = PolyInterp(x,y)

m=length(x);
for j=1:m-1
    y(j+1:m)=(y(j+1:m)-y(j:m-1))./(x(j+1:m)-x(1:m-j));
end

f=@(t) sub(x,y,t)

function P=sub(x,b,t)

m=length(x);
P=b(m);
for k=m-1:-1:1
    P=b(k)+(t-x(k))*P
end