%% font design
%% data
x_T = [11, 76, 76, 50, 50, 36, 36, 11, 11 ];
y_T = [-72, -72, -92, -92, -155, -155, -92, -92, -72];

figure; plot(x_T, y_T);

[x_T,y_T] = subd_image(x_T,y_T);
[x_T2,y_T2] = subd_image(x_T,y_T); % 점점 매끄러운 함수 출력

figure, plot(x_T, y_T, '-b')
figure, plot(x_T2, y_T2, '-b')

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
