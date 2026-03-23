% Chapter 6 Programming in MATLAB - Lab
%
% Name: Aman Sirigineedi
% Date: 3/14/2026
clear, clc;

disp('Problem 1:')
% Determine and display the first 20 Fibonacci numbers
% Sequence starts with 0 and 1; each next value = sum of previous two
f1 = 0;
f2 = 1;
fib = [f1 f2];
for i = 3:20
    fnew = f1 + f2;
    fib = [fib fnew];
    f1 = f2;
    f2 = fnew;
end
fprintf('The first 20 Fibonacci numbers are:\n\n');
fprintf(' %d', fib);
fprintf('\n');

disp('Problem 2:')
% Build an m x n matrix where element (r,c) = r^c / (r + c)
m = input('Enter number of rows m: ');
n = input('Enter number of columns n: ');
matrix = [];
for r = 1:m
    row = [];
    for c = 1:n
        row = [row  r^c / (r + c)];
    end
    matrix = [matrix; row];
end
matrix

disp('Problem 3:')
% Find the smallest even integer divisible by 13 and 16 with sqrt > 120
% Loop starts at 1 and stops when all conditions are satisfied
n = 1;
found = 0;
while found == 0
    if n/2 == round(n/2) && n/13 == round(n/13) && n/16 == round(n/16) && sqrt(n) > 120
        found = 1;
    else
        n = n + 1;
    end
end
fprintf('The required number is: %d\n', n);

disp('Problem 4:')
% Solve quadratic equation ax^2 + bx + c = 0 using discriminant D = b^2 - 4ac
% D > 0: two real roots, D = 0: one root, D < 0: no real roots
% Run three times for three equations
for i = 1:3
    fprintf('For the equation ax^2+bx+c\n');
    a = input('Enter a: ');
    b = input('Enter b: ');
    c = input('Enter c: ');
    fprintf('\n');
    D = b^2 - 4*a*c;
    if D > 0
        x1 = (-b + sqrt(D)) / (2*a);
        x2 = (-b - sqrt(D)) / (2*a);
        r1 = min(x1, x2);
        r2 = max(x1, x2);
        fprintf('The equation has two roots,\n');
        fprintf(' %.3f and %.3f\n\n', r1, r2);
    elseif D == 0
        x = -b / (2*a);
        fprintf('The equation has one root,\n');
        fprintf(' %.3f\n\n', x);
    else
        fprintf('The equation has no real roots.\n\n');
    end
end

disp('Problem 5:')
% Sierpinski triangle via iterated random rules (equal probability)
% Rule 1: x = 0.5x,          y = 0.5y
% Rule 2: x = 0.5x + 0.25,   y = 0.5y + sqrt(3)/4
% Rule 3: x = 0.5x + 0.5,    y = 0.5y
% Start at (x1, y1) = (0, 0); run for n = 10, 100, 1000, 10000 iterations
n_values = [10, 100, 1000, 10000];
figure;
for k = 1:4
    n = n_values(k);
    xc = 0;
    yc = 0;
    x = xc;
    y = yc;
    for i = 1:n-1
        rule = randi(3);
        if rule == 1
            xc = 0.5*xc;
            yc = 0.5*yc;
        elseif rule == 2
            xc = 0.5*xc + 0.25;
            yc = 0.5*yc + sqrt(3)/4;
        else
            xc = 0.5*xc + 0.5;
            yc = 0.5*yc;
        end
        x = [x xc];
        y = [y yc];
    end
    subplot(2, 2, k);
    plot(x, y, '^');
    if n == 10
        title('n = 10');
    elseif n == 100
        title('n = 100');
    elseif n == 1000
        title('n = 1000');
    else
        title('n = 10000');
    end
end
