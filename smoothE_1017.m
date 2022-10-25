x_E = [11, 64, 64, 30, 30, 60, 60, 30, 30, 65, 65, 11, 11 ];
y_E = [-72, -72, -86, -86, -110, -110, -125, -130, -155, -155, -166, -165, -72];

figure; plot(x_E, y_E);

[x_E, y_E] = subd_image(x_E,y_E)
[x_E, y_E] = subd_image(x_E,y_E) % 점점 매끄러운 함수 출력
figure; plot(x_E,y_E,'-b')

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

