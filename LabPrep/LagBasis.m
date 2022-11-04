function bas_val=LagBasis(interp_node, x)

m=length(interp_node);
bas_val=ones(1,m);
for k=1:m
    for j=1:m
        if j~=k
            bas_val(k)=bas_val(k)*(x-interp_node(j))/(interp_node(k)-interp_node(j));
        end
    end
end