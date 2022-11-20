clear all; clc; close all;

ii=1;
Fourier_x2(ii)

function Fourier_x2(iter)

ax = 2*pi;      % b
n = 100;
T = pi;         % 주기

x = linspace(0, T, n);
f1 = @(x) x;    % f(x)=x,
f2 = @(x) pi-x; % or pi-x
y = [f1(x(1:n/2)), f2(x(n/2:end))];

y0 = [y y y y];
x0 = linspace(-ax, ax, length(y0));

% fourier series form
S = pi/4;       % a0
for k = 1:iter
    if mod(k,4)==2
        S = S + (-2/pi)*(2/k)^2 * cos(k*x0); % ak=4/pi*integral(f*cos(k*x),pi/2,0)
    end
end

figure; plot(x0, y0, 'r', x0, S, 'b')

end