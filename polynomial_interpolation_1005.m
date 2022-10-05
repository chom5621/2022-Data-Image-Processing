syms x % x에 대한 함수 정의(@ 대신)

f = x^2;

data = linspace(-5,5,10);
fdata = double(subs(f,data)); % 앞에서 sysm로 정의했으므로 subsititute
n = length(data);

%% Vandermonde
V = zeros(n,n);
for i = 0:n-1
    V(:,i+1) = data.^i;
end

coeff = inv(V)*fdata'; % V\fdata

c = flip(coeff);
p1 = poly2sym(c, x);

figure; fplot([f,p1], [-5,5]);


%% Lagrange
p2=0;
Lag = zeros(n,1);

for j = 1:n
    lag = 1;

    for i = 1:n
        if i ~= j
            lag = lag * (x-data(i))/(data(j)-data(i));
        end

        Lag = lag * fdata(j);
    end

    p2 = p2 + Lag;
end

figure; fplot([f,p2], [-5,5]);
