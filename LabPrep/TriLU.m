function M = TriLU(A)

M=A;
n=size(A,1);
for i=1:n-1
    M(i+1,i)=M(i+1,i)/M(i,i)
    M(i+1,i+1)=M(i+1,i+1)-M(i+1,i)*M(i,i+1)
end