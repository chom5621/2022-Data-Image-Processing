% 알파벳 좌표 찍기
x_E = [];
y_E = [];

figure; plot(x_E, y_E);

[x_E, y_E] = subd_image(x_E,y_E)
[x_E, y_E] = subd_image(x_E,y_E) % 점점 매끄러운 함수 출력
figure; plot(x_E,y_E,'-b')

function [t_subd] = subdivision(t)

t1 = [t(end-1), t(1:end), t(2)];
n = length(t);
t_subd = zeros(1,2*n-1);

for t = 2:n+1
    t_subd(2*t-3) = t1(i);
end

for t = 2:n+1
    t_subd(2*t-1) = 
end

end

