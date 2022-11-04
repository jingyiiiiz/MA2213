function X = SolveLU(M,b)

n=size(M,1);
X=zeros(n,1);
for j=2:n
    for i=1:j-1
        b(j)=b(j)-M(j,i)*b(i)
    end
end

X(n)=b(n)/M(n,n);
for i=n-1:-1:1
    X(i)=b(i);
    for j=i+1:n
        X(i)=X(i)-M(i,j)*X(j)
    end
    X(i)=X(i)/M(i,i);
end
