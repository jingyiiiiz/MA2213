function x=CombineLU(A, b)

M=LU(A);
x=SolveLU(M,b);

function M = LU(A)

M=A;
n=size(A,1);
for i=1:n-1
    for j=i+1:n
        M(j,i)=M(j,i)/M(i,i);
        for k=i+1:n
            M(j,k)=M(j,k)-M(j,i)*M(i,k);
        end
    end
end

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