% Problem 1
% Set the range of n value
n = [-3 -2 -1 0 1 2 3 4 5];
% The value of h[n]
h = [0 0 0 1 2 0 0 0 0];
% The value of x[n]
x = [0 0 0 4 3 2 1 0 0];
% Plot the value of h[n]
figure
stem(n,h);
xlabel('n');
ylabel('h[n]');
title('(a)');
% Plot the value of x[n]
figure
stem(n,x);
xlabel('n');
ylabel('x[n]');
title('(b)');
% Calculate the convolution of h[n] and x[n]
y = conv(h, x);
% Reset n range according to the value of y[n]
n = [-6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6 7 8 9 10];
% Plot the value of y[n] = x[n]*h[n]
figure
stem(n, y);
xlabel('n');
ylabel('y[n]');
title('(c)');

% Problem 2
% Set the range of n value
n = [-3 -2 -1 0 1 2 3 4 5 6];
% The value of h[n]
h = [0 0 0 1 0.5 0.25 0.125 1/16 1/32 1/64];
% The value of x[n]
x = [0 0 0 1 1 1 1 1 1 1];
% Plot the value of h[n]
figure
stem(n,h);
xlabel('n');
ylabel('h[n]');
title('(a)');
% Plot the value of x[n]
figure
stem(n,x);
xlabel('n');
ylabel('x[n]');
title('(b)');
% Calculate the convolution of h[n] and x[n]
y = conv(h, x);
% Plot the value of y[n] = x[n]*h[n]
figure
stem(y);
xlabel('n');
ylabel('y[n]');
title('(c)');

% Problem 5(f) partial fraction expansion
syms A B C
eqn1 = A + B + C == -3.25;
eqn2 = -0.5*A - 1.25*B + 0.25*C == -1;
eqn3 = -0.5*A + 0.25*B - 0.125*C == -1/2;
sol = solve([eqn1, eqn2, eqn3], [A, B, C]);
ASol = sol.A;
BSol = sol.B;
CSol = sol.C;

% Problem 4
b = [0.3375 0 -0.3375];
a = [1 -0.2326 0.3249];
[h,w] = freqz(b,a,100);
x = [0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
y = filter(b, a, x);
stem(y);
xlabel('n');
ylabel('y[n]');
