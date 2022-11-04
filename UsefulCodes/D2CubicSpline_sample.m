function sec_diff = D2CubicSpline(x, y)
    n = length(x);
    d1 = (y(2:n) - y(1:n-1)) ./ (x(2:n) - x(1:n-1));
    d2 = (d1(2:n-1) - d1(1:n-2)) ./ (x(3:n) - x(1:n-2));
    lambda = (x(3:n) - x(2:n-1)) ./ (x(3:n) - x(1:n-2));
    mu = (x(2:n-1) - x(1:n-2)) ./ (x(3:n) - x(1:n-2));
    A = diag(2*ones(1,n-2)) + diag(lambda(1:n-3),1) + diag(mu(2:n-2),-1);
    sec_diff = A \ (6 * d2);
end