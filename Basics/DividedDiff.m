function b = DividedDiff(f, x)

n=length(x);
b=zeros(n,1);

for k=1:n
    b(k)=f(k);
end
for j=2:n
    for k=n:-1:j
        b(k)=(b(k)-b(k-1))/(x(k)-x(k-j+1));
    end
end