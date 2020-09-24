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


