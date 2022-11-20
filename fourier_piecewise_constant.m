clear all; clc; close all;

ii = 20;
Fourier_xp(ii)

function Fourier_xp(iter)

ax = 2;
n = 100;
T = 1;

x = linspace(0, T, n);
f1 = @(x) 1*x.^0;
f2 = @(x) 0*x.^0;
y = [f1(x(1:n/2)), f2(x(n/2+1:end))];

y0 = [y y y y];
x0 = linspace(-ax, ax, length(y0));

S = 1/2;
for k = 1:iter
    S = S + ((-1)^k+1)/(pi*k)*sin(k*x0*pi);
end

figure; plot(x0, y0, 'r', x0, S, 'b');

end