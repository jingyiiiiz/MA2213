function m = D2CubicSpline(x, y)

% generate matrix A
n=size(x,1);
A=zero(n-1,n-1);

% i=1 case
A(1,1)=2;
A(1,2)=(x(2)-x(1))/(x(2)-x(1));

% i=2 to n-2 cases
for i=2:n-2
    A(i,i)=2;
    A(i,i-1)=(x(i)-x(i-1))/(x(i+1)-x(i-1));
    A(i,i+1)=(x(i+1)-x(i))/(x(i+1)-x(i-1));
end

% i=n-1 case
A(n-1,n-1)=2;
A(n-1,n-2)=(x(n-1)-x(n-2))/(x(n)-x(n-2));

% generate vector B
B=zero(n-1,1);
