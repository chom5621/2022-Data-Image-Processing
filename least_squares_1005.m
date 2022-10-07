x = [0 1 3 4];
y = [0 8 8 20];

y = [0 8 8 20]'; % transpose
y=y(:); % vectorize

%% deg1; py=ax+b
E = [1 1 1 1;x]; % E = [ones(1,4);x]
coeff = inv(E*E')*E*y; % coeff = [1;4] = [b;a]
py = coeff'*E; % py = coeff(1)*ones(1,4) + coeff(2)*x = [1 5 13 17]

figure; % 창 띄우기
plot(x,y,'o',x,py);

%% deg2; py=ax^2+bx+c
E = [1 1 1 1;x;x.^2]; % E = [ones(1,4);x;x.^2]
coeff = inv(E*E')*E*y; % coeff = [1;4] = [b;a]
py = coeff'*E; % py = coeff(1)*ones(1,4) + coeff(2)*x = [1 5 13 17]

figure; plot(x,y,'o',x,py);

ppy = @(x)coeff(1) + coeff(2)*x + coeff(3)*x.^2;
xx = 0:0.01:4; % x간격 촘촘
figure; plot(x,y,'o',xx,ppy(xx),x,py,'b','LineWidth',2); % 원래 파란선보다 부드러운 빨간선


