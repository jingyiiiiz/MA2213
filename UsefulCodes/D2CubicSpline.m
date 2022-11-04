function m = D2CubicSpline(x,y)

n=length(x);

dd_1st = (y(2:end) - y(1:end-1)) ./ (x(2:end) - x(1:end-1));
dd_2nd = (dd_1st(2:end) - dd_1st(1:end-1)) ./ (x(3:end) - x(1:end-2));

B=(6*dd_2nd);

lambda = (x(3:end-1) - x(2:end-2)) ./ (x(3:end-1) - x(1:end-3));
mu = (x(3:end-1) - x(2:end-2)) ./ (x(4:end) - x(2:end-2));

A = diag(2 * ones(1,length(x)-2)) + diag(lambda,1) + diag(mu, -1);

m = A \ B;