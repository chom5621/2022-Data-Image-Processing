clear all; clc; close all;

ii=1;
Fourier_x(ii)

function Fourier_x(iter)

ax = 3*pi;  % b
n = 100;
T = 2*pi;   % 주기

x = linspace(-T/2, T/2, n);
f = @(x) sin(x).*sin(x);
y = f(x(1:end-1));

y0 = [y y y];
x0 = linspace(-ax, ax, length(y0));

% fourier series form
S = 1/2;      % a0
%for k = 1:iter
S = S - 1/2*cos(2*x0);
%end

figure; plot(x0, y0, 'r', x0, S, 'b')

end