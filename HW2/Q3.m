function f=Q3(m)
x = size(1,m);
y = size(1,m);

for i=1:m
    x(i)=(cos((i-1+1/2)*pi/m)+1)*pi;
    y(i)=sin(x(i));
end

for j=1:m
    y(j+1:m)=(y(j+1:m)-y(j:m-1))./(x(j+1:m)-x(1:m-j));
end

f=@(t) sub(x,y,t)

function P=sub(x,y,t)

n=length(y);

P=y(n);
for k=n-1:-1:1
    P=y(k)+(t-x(k))*P;
end