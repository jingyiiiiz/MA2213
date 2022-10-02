function x = Q7(A, B)

sz = size(A); n = sz(1);
x = zeros(n, 1);
for i=1:(n-2)
    s = A(i+1, i) / A(i, i);
    t = A(n, i) / A(i, i);
    A(i+1, i+1) = A(i+1, i+1) - s * A(i, i+1);
    A(i+1, n) = A(i+1, n) - s * A(i, n);
    B(i+1) = B(i+1) - s * B(i);
    A(n, i+1) = A(n, i+1) - t * A(i, i+1);
    A(n, n) = A(n, n) - t * A(i, n);
    B(n) = B(n) - t * B(i);
end
u = A(n, n-1) / A(n-1, n-1);
A(n, n) = A(n, n) - u * A(n-1, n);
B(n) = B(n) - u * B(n-1);
x(n) = B(n) / A(n, n);
x(n-1) = (B(n-1) - A(n-1, n) * x(n)) / A(n-1, n-1);
for i=(n-2):-1:1
    x(i) = (B(i) - A(i, i+1) * x(i+1) - A(i, n) * x(n)) / A(i, i);
end