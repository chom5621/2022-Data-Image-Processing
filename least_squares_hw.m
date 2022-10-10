% x와 y의 데이터 값, 구하고자 하는 polynomial의 degree 세팅
x = [0 1 3 4 5];
y = [0 8 8 20 20];
y = y(:); % vectorize
deg = 2;

% 데이터 값의 길이와 deg에 따라 바뀌는 E 일반적으로 코딩
E = ones(deg+1,length(x));
for i=1:deg
    E(i+1,:)=x.^i;
end

% polynomial coefficient와 그에 따른 py값 계산
coeff = inv(E*E')*E*y;
py = coeff'*E;

% plotting
figure; plot(x,y,'o',x,py);