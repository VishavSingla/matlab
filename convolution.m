clear;
clc;

n = -10:1:20;
un = (n >= 0);
un_6 = (n >= 6);
xn = un - un_6;
m = size(xn, 2);
hn = [xn zeros(1, m - 1)];
xn = [xn zeros(1, m - 1)];
y = zeros(1, 2 * m - 1);
for i = 1 : (2 * m - 1)
    sum = 0;
    for j = 1 : i
        sum = sum + (xn(j) * hn(i - j + 1));
    end
    y(i) = sum;
end

subplot(1, 3, 1);
stem(xn);
xlabel('n -->');
ylabel('Amplitude x(n) -->');
title('x(n)');

subplot(1, 3, 2);
stem(hn);
xlabel('n -->');
ylabel('Amplitude h(n) -->');
title('h(n)');

subplot(1, 3, 3);
stem(y);
xlabel('n -->');
ylabel('Amplitude x(n) * h(n)');
title('x(n) * h(n) without using convolution function-->');
