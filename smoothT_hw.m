% 알파벳 좌표 찍기
x_T = [];
y_T = [];

figure; plot(x_T, y_T);

[x_T, y_T] = subd_image(x_T,y_T)
[x_T2, y_T2] = subd_image(x_T,y_T) % 점점 매끄러운 함수 출력
figure; plot(x_T,y_T,'-b')
figure; plot(x_T2,y_T2,'-b')

function [t_subd] = subdivision(t)

t1 = [t(end-1), t(1:end), t(2)];
n = length(t);
t_subd = zeros(1,2*n-1);

for i = 2:n+1
    t_subd(2*i-3) = t1(i);
end

for i = 2:n
    t_subd(2*i-1) = mask*[t1(i-1); t1(i); t1(i+1); t1(i+2)];
end

figure; plot(x, y, '-bo', n, t_subd, '-rx');
end

