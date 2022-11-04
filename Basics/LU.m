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