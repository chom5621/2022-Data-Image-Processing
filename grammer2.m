%% 9. Simple Function Example
y=my_sum(1,2); % 1+2=3

%% 10. Function Handle
% 1) 내장함수 사용
x=[0 2 4 6];
y=sin(x);
figure; plot(x,y,'o');

% 2) @ function handle creation
f=@(x) x^3+x^2;
f(1) % 1^3+1^2=2

[x,y]=meshgrid(0:5, 0:5);
ff=@(x,y) x.^2+y.^2;
ff(2,3) % 2^2+3^2=13

%% 11. for문
% 1부터 10까지의 합
sum=0;
for i=1:10
    sum=sum+i;
end    

% 1부터 10까지의 곱
mu1=1;
for i=1:10
    mu1=mu1*i;
end

%% 12. if문
% 1부터 10까지의 짝수들의 합
sum=0;
for i=1:10
    if mod(i,2)==0
        sum=sum+i;
%    else
%        sum=sum;
    end
end

% for문, if문으로 matrix 다루기
A=zeros(5,5);
for i=1:5
    for j=1:5
        if i>j
            A(i,j)=i*j;
        elseif i<j
            A(i,j)=i*j;
        else
            A(i,j)=0;
        end
    end
end

%% 13. IMAGE(영상)
X0=double(imread('peppers.png'));
figure; imagesc(uint8(X0)); axis equal; axis off;
figure; imshow(uint8(X0)) % 원래의 image 크기대로 show & 정형화된 크기에 맞춰 나타냄

% color image를 grayscale image로 바꾸기
X0=(X0(:,:,1)+X0(:,:,2)+X0(:,:,3))/3;
figure; imshow(X0, [0,255]);

figure; imagesc(uint8(X0)); axis equal; axis off; title('original image'); % imagesc는 완전한 색을 이용하여 회색조로 나타나지 않음
figure; mesh(X0); % image의 값의 크기 그래프화/ 돌려보면 위 그래프 확인 가능
