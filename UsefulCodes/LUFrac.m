function M = LUFrac(A)

M=A;
n=size(A,1);
for i=1:n-2
    M(i+1,i)=M(i+1,i)/M(i,i);
    M(i+1,i+1)=M(i+1,i+1)-M(i+1,i)*M(i,i+1);
    M(i+1,n)=M(i+1,n)-M(i+1,i)*M(i,n);
    M(n,i)=M(n,i)/M(i,i);
    M(n,i+1)=M(n,i+1)-M(n,i)*M(i,i+1);
    M(n,n)=M(n,n)-M(n,i)*M(i,n);
end
M(n,n-1)=M(n,n-1)/M(n-1,n-1);
M(n,n)=M(n,n)-M(n,n-1)*M(n-1,n);