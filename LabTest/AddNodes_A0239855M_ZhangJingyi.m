function ddp = AddNodes_A0239855M_ZhangJingyi(x, dd, xp, yp)

n=length(x);
m=length(xp);

x=[xp;x];
ddp = [yp;dd];
if n>0
    for i=1:n
        ddp(i+1:m+i)=(ddp(i+1:m+i)-ddp(i:m+i-1))./((x(i+1:m+i)-x(1:m)));
    end
end
for j=(n+1):(n+m-1)
    ddp(j+1:end)=(ddp(j+1:end)-ddp(j:end-1))./((x(j+1:end)-x(1:end-j)));
end
