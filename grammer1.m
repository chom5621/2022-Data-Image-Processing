%% Digital Image Processing

% 주석처리: ctrl+R
% 주석해제: ctrl+T
% 세미콜론(;) 안쓰면 결과 명령창에 출력됨
% 모르는 명령어 나오면 help

%% 0. clear all; clc; close all;
clc; % clean screen
clear a; % 작업공간 안의 변수 a를 지움
clear all; % 작업공간 안의 모든 변수를 지움
close all; % 멀리 있는 모든 figure를 닫음

%% 1. Data Type
a=1;
class(a) % 'double'=실수
b=int64(32);
class(b) % 'int64'=8바이트(64비트)의 부호 있는 정수
c='matlab';
class(c) % 'char'=문자

%% 2. Variables
a=pi; % 3.1416
b=4;
a+b; % 7.1416
a-b; % -0.8584
a^2; % 9.8696
a*b; % 12.5664
a/b; % 0.7854

%% 3. List
a1=1:5;
a2=1:0.5:10; % start:step:end
a2(1) % 1
a2(19) % 10
a2(end) % 10

b1=linspace(1,5,5); % a1과 같음
b2=linspace(1,5,19);  % 1부터 5까지 19로 쪼개기

[x,y]=meshgrid(0:5, 0:5); % 2차원 배열
% x는 0 1 2 3 4 5 이렇게 가로로 1씩 늘어나는 6*6 행렬
% y는 세로 열별로 1씩 늘어나는 6*6 행렬

v=[1 3 5 7 9];
w=v'; % transpose
v(3:end) % 5 7 9
v(1:2:end) % 1 5 9
v(end:-2:1) % 9 5 1
v([1 4 5]) % 1 7 9

%% 4. Plot
figure; plot(a1,b1,'o')

figure;
plot(a2, b2, 'b*'); title('graph'); % length(a2)와 length(b2) 차원이 달라 ERROR

% figure;
% plot(a1, b2) % 위와 마찬가지로 ERROR
length(a1) % 5
length(b2) % 19

%% 5. Matrix
f=[1 2 3; 4 5 6];
size(f) % 2 3
length(f) % 3 = size중 가장 큰 값

A=[1 2 3 4 5; 6:10; 11:15; 16:20; 21:25];
B=zeros(size(A));
C=ones(size(A)+3); % 열과 행 모두 3개 늘어남

AA=A(:); % A를 컬럼별로 주르륵 이어붙인 벡터화
A(17); % 9
A(1:2, :); % 특정 행 불러오기
A(:, 2:2:end); % 짝수열 불러오기
B(1, 4:5)=10; % 특정 원소 바꾸기

%% 6. Matrix Operation
B=eye(5)*100; % identity matrix

A+B;
A*B; % matrix multiplication
A.*B; % componentwise multiplication
A^2; % A*A
A.^2; % componentwise square
A/B; % A*inv(B)
A./B; % A(i, j)/B(i, j)
A\B; % inv(A)*B
A.\B; % B(i, j)/A(i, j)

%% 7. Some Important Standard Arrays
M=5; N=3;

C=magic(M); % colum sun과 row sum이 동일한 M*M 행렬
sum(C) % colum sum, sum(C,1)과 같음
sum(C, 2) % row sum
trace(C);

max(C) % column max
max(C,[],2) % row max
max(C,[],'all') % total max
max(A,B); % 비교해서 max값 포함시켜 반환함 (여기서는 5*5 행렬로)
min(C) % column min

rand(M, N) % (0,1)에서의 난수 M*N 행렬
randn(M, N) % 정규분포

%% 8. Relational Operators
A=[1:3; 4:6; 7:9];
B=[0 2 4; 3 5 6; 3 4 9];
A==B; % 3*3 logical 행렬, 각 원소가 참이면 1/거짓이면 0 반환함
A>=B; % 3*3 logical 행렬
