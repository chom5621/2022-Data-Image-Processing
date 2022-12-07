X0 = double (imread('peppers.png'));
figure; imshow(uint8(X0))

% size(X0) % 384 512 3
figure; surf(X0(:,:,1)); % R
figure; surf(X0(:,:,2)); % G
figure; surf(X0(:,:,3)); % B

X0 = zooming_fourg_color(X0);
figure; imshow(uint8(X0))


% function1: subd_zoom
function [x_subd] = subd_zoom(y)

y1 = [y(1) y y(end)];
n = length(y);
x_subd = zeros(1, 2*n-1);
mask = [-1 9 9 -1]/16;

for i = 2:n+1
    x_subd(2*i-3) = y1(i);
end

for i = 2:n
    x_subd(2*i-2) = mask*[y1(i-1); y1(i); y1(i+1); y1(i+2)];
end

end

% function2: zooming_fourg_color
function Aaa = zooming_fourg_color(X0)

a = size(X0,1); % 행 R
b = size(X0,2); % 열 G에서 padding(쪼개기)

Aa = zeros(a, 2*b-1, 3); % 3은 B 그대로
for i = 1:3              % i는 R,G,B
    for j = 1:a          % j는 R에서 하나씩 subdivision
        Aa(j,:,i) = subd_zoom(X0(j,:,i));
    end
end

Aaa = zeros(2*a-1, 2*b-1, 3);
for i = 1:3
    for j = 1:size(Aa,2)                    % 2*b-1=size(Aa,2)
        Aaa(:,j,i) = subd_zoom(Aa(:,j,i)'); % subd_zoom에서는 가로로 돌아가므로 transpose(')
    end
end
% figure; imshow(uint8(Aaa))

end
