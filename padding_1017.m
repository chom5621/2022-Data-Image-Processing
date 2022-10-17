clear all; clc; close all;

f = @(x) sin(2*x);
x = -1:1/2:1;
y = f(x);

[sx,sy] = fourpt(x,y,f);


function [nx,ny] = fourpt(x,y,f)

mask = [-1 9 9 -1]/16;
n = length(x);
h = x(2)-x(1);

nx = linspace(x(1), x(end), 2*n-1);
ny = zeros(1,2*n-1);

y1 = [f(x(1)-h) y f(x(end)+h)];

% 인덱스 홀수
for i = 2:n+1
    ny(2*i-3) = y1(i);
end

% 인덱스 짝수
for i = 2:n
    ny(2*i-2) = mask*[y1(i-1); y1(i); y1(i+1); y1(i+2)];
end

figure; plot(x,y,'-bo', nx,ny,'-rx')

end