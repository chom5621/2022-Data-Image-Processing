%% font design
%% data
x_E = [11, 64, 64, 30, 30, 60, 60, 30, 30, 65, 65, 11, 11 ];
y_E = [-72, -72, -86, -86, -110, -110, -125, -130, -155, -155, -166, -165, -72];

figure; plot(x_E, y_E);

[x_E,y_E] = subd_image(x_E,y_E);
[x_E2,y_E2] = subd_image(x_E,y_E); % 점점 매끄러운 함수 출력

figure, plot(x_E, y_E, '-b')
figure, plot(x_E2, y_E2, '-b')

%% subdivision
function [t_subd] = subdivision(t)

t1 = [t(end-1),t(1:end),t(2)];
n = length(t);
t_subd = zeros(1,2*n-1);

mask = [-1, 9, 9, -1]/16;

for i= 2:n+1
    t_subd(2*i-3) = t1(i);
end
for i=2:n
    t_subd(2*i-2) = mask*[t1(i-1); t1(i); t1(i+1); t1(i+2);];
end

end

%% subdivision_image
function [x,y] = subd_image(x,y)

[x] = subdivision(x);
[y] = subdivision(y);

end