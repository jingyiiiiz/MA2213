function bas_val=LagBasis_update(interp_node, x)

b=x-interp_node;
m=length(interp_node);
bas_val=ones(1,m);
for k=1:m
    for j=1:m
        if j~=k
            bas_val(k)=bas_val(k)*b(j)/(interp_node(k)-interp_node(j));
        end
    end
end