function M = LUFrac(A)
    n = size(A,1);
    M = A;
    for i=1:n-1
        M(i+1,i) = M(i+1,i) / M(i,i);
        M(i+1,i+1) = M(i+1,i+1) - M(i+1,i) * M(i,i+1);
        if i~=n-1
            M(i+1,n) = M(i+1,n) - M(i+1,i) * M(i,n);
            M(n,i) = M(n,i) / M(i,i);
            M(n,i+1) = M(n,i+1) - M(n,i) * M(i,i+1);
            M(n,n) = M(n,n) - M(n,i) * M(i,n);
        end
    end
end