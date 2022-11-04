lambda = x(2:end-1) - x(1:end-2) ./  (x(3:end) - x(1:end-2));
A = diag(2 * ones(1,length(x)-2)) + diag(1-lambda(1:end-1),1) + ...
    diag(lambda(2:end), -1);

dd_1st = (y(2:end) - y(1:end-1)) ./ (x(2:end) - x(1:end-1));
dd_2nd = (dd_1st(2:end) - dd_1st(1:end-1)) ./ (x(3:end) - x(1:end-2));

d2S = A \ (6 * dd_2nd); 
d2S = [0; d2S; 0];

alpha = (d2S(2:end) - d2S(1:end-1)) ./ (x(2:end) - x(1:end-1)) / 6;
beta = (d2S(2:end) .* (x(2:end) - 2 * x(1:end-1)) - ...
    d2S(1:end-1) .* (x(1:end-1) - 2 * x(2:end))) ./ (x(2:end) - x(1:end-1)) / 6;

for i=1:length(x)-1
    disp([num2str(y(i)) ' + ' num2str(dd_1st(i)) '(x-' num2str(x(i)) ...
        ') + (x-' num2str(x(i)) ')(x-' num2str(x(i+1)) ')(' ...
        num2str(alpha(i)) 'x+' num2str(beta(i)) ')']);
end

hold on;

for i=1:length(x)-1
    fplot(@(t) y(i) + dd_1st(i)*(t-x(i)) + ...
        (t-x(i)).*(t-x(i+1)).*(alpha(i)*t+beta(i)), [x(i), x(i+1)]);
end
hold off;