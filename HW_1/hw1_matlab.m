clc;
clear;
% Problem 3
x = [-5 -4 -3 -2 -1 0 1 2 3 4 5 6 7 8 9 10];
% original x(n) value
y1 = [0 0 0 0 1 1 1 1 1 0.5 0 0 0 0 0 0];
% for question (a): x(2n) value
y2 = [0 0 0 0 0 1 1 0.5 0 0 0 0 0 0 0 0];
% for question (b): x(n-1) value
y3 = [0 0 0 0 0 1 1 1 1 1 0.5 0 0 0 0 0];
% for question (b): x(n-1)im(n-3) value
y4 = [0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0];
% Plot the output in 'stem' format
figure
stem(x,y1);
figure
stem(x,y2);
xlabel('n');
ylabel('x[2n]');
title('(a)');
figure
stem(x,y4);
xlabel('n');
ylabel('x[n-1] \delta[n-3]');
title('(b)');

% Problem 6
x = [-5 -4 -3 -2 -1 0 1 2 3 4 5 6 7 8 9];
h = [0, 0, 0, 0, 0, 1, 1, 1, 1, -2, -2, 0, 0, 0, 0];
u = [0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
% Calculate the convolution of h[x] and u[x]
y = conv(h, u);
% Plot the output in 'stem' format
figure
stem(y);
xlabel('n');
ylabel('y[n]');
title('Problem 6');