%% HW1. practice_fourpt: subdivision 실행 코드 작성하기

clear all; clc; close all;

f = @(x) sin(2*x);
x = -1:1/2^2:1;                         % 처음 데이터 x
y = f(x);

n = 5;
[x_1,y_1] = fourpt(x,y,f);              % 한 번 실행한 결과 x1

for i=1:n-1
    [x_1,y_1] = fourpt(x_1,y_1,f);      % 실행 결과를 받아서, 그 결과를 다시 input data로 사용합니다.
end                                     % n번 실행한 결과 x_n
% x를 넣어서 코드 한 번 실행으로 x_n 나올 수 있도록 하였습니다. 


%% four point scheme
function [nx,ny] = fourpt(x,y,f)

len = length(x);
mask = [-1 9 9 -1]/16;
h = x(2) - x(1);

y1 = [f(x(1)-h) y f(x(end)+h)];         % 양 끝에 padding

nx = linspace(x(1),x(end),2*len-1);     % update new x/ 2배 더 잘게 쪼개줌
ny = zeros(1,2*len-1);                  % initialize new y array

% 인덱스 홀수
for i = 2:len+1               
    ny(2*i-3) = y1(i);                  % 홀수번째는 그대로
end

% 인덱스 짝수
for i = 2:len
    ny(2*i-2) = mask*[y1(i-1); y1(i); y1(i+1); y1(i+2)];
end

figure; plot(x, y, '-bo', nx, ny, '-rx');

end