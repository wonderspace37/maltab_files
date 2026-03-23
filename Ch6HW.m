% Chapter 6 Programming in MATLAB - Homework
%
% Name: Aman Sirigineedi
% Date:3/14/2026
clear; clc; % clear workspace and command window

% ===========================================================
disp('Problem 1');
% ===========================================================
% Average monthly precipitation (in.) for Boston and Seattle in 2012
BOS = [2.67 1.00 1.21 3.09 3.43 4.71 3.88 3.08 4.10 2.62 1.01 5.93];
SEA = [6.83 3.63 7.20 2.68 2.05 2.96 1.04 0.00 0.03 6.71 8.28 6.85];

% -----------------------------------------------------------
disp('Part (a)');
% Calculate total and monthly average precipitation for each city
BOS_total = sum(BOS);       % total Boston precipitation
BOS_avg   = mean(BOS);      % monthly average Boston
SEA_total = sum(SEA);       % total Seattle precipitation
SEA_avg   = mean(SEA);      % monthly average Seattle

fprintf('The total precipitation in Boston in 2012 was %.2f in and average %.2f in\n', BOS_total, BOS_avg);
fprintf('The total precipitation in Seattle in 2012 was %.2f in and average %.2f in\n', SEA_total, SEA_avg);

% -----------------------------------------------------------
disp('Part (b)');
% Count months where precipitation was above average in each city
BOS_above = 0;
SEA_above = 0;
for i = 1:12
    if BOS(i) > BOS_avg
        BOS_above = BOS_above + 1;
    end
    if SEA(i) > SEA_avg
        SEA_above = SEA_above + 1;
    end
end
fprintf('Boston had %d months above average and Seattle %d months\n', BOS_above, SEA_above);

% -----------------------------------------------------------
disp('Part (c)');
% Find months and count where Boston precipitation < Seattle
lower_months = [];
count = 0;
for i = 1:12
    if BOS(i) < SEA(i)
        lower_months = [lower_months i];
        count = count + 1;
    end
end
fprintf('The precipitation was lower in Boston in the following %d months:', count);
for i = 1:count
    fprintf(' %d', lower_months(i));
end
fprintf('\n');

% ===========================================================
disp('Problem 2');
% ===========================================================
% Find all Pythagorean triples (a, b, c) with a^2 + b^2 = c^2
% where a, b, c are positive integers <= 50

table = [];
for a = 1:50
    for b = a:50
        for c = b:50
            if a^2 + b^2 == c^2
                table = [table; a b c];  % add valid triple as a new row
            end
        end
    end
end
table   % display table (shows variable name and values)

% ===========================================================
disp('Problem 3');
% ===========================================================
% Calculate Training Heart Rate (THR) for two individuals
% Men   : THR = [(220 - AGE) - RHR] x INTEN + RHR
% Women : THR = [(206 - 0.88 x AGE) - RHR] x INTEN + RHR
% INTEN : 0.55 (low), 0.65 (medium), 0.80 (high)

for i = 1:2
    gender  = input('Please input your gender (male or female): ', 's');
    age     = input('Please input your age: ');
    RHR     = input('Please enter your resting heart rate: ');
    fitness = input('Please enter your fitness level (low, medium, or high: ', 's');

    % Set intensity factor from fitness level (check first letter)
    if fitness(1) == 'l'        % low
        INTEN = 0.55;
    elseif fitness(1) == 'm'    % medium
        INTEN = 0.65;
    else                        % high
        INTEN = 0.80;
    end

    % Calculate THR based on gender (check first letter)
    if gender(1) == 'm'         % male
        THR = ((220 - age) - RHR) * INTEN + RHR;
    else                        % female
        THR = ((206 - 0.88 * age) - RHR) * INTEN + RHR;
    end

    fprintf('\nThe recommended training heart rate is %d\n\n', round(THR));
end

% ===========================================================
disp('Problem 4');
% ===========================================================
% Calculate shipping cost based on service type and package weight
%
% Pricing table:
%   Ground (5-7 days):
%     0 - 0.5 lb  : $0.70  + $0.06/oz
%     0.5 - 5 lb  : $1.18  + $0.42 per additional 0.5 lb (or fraction)
%     > 5 lb      : $4.96  + $0.72 per additional lb (or fraction)
%
%   Express (3-4 days):
%     0 - 0.5 lb  : $2.40  + $0.25/oz
%     0.5 - 5 lb  : $4.40  + $1.20 per additional 0.5 lb (or fraction)
%     > 5 lb      : $15.20 + $1.80 per additional lb (or fraction)
%
%   Overnight (1 day):
%     0 - 0.5 lb  : $12.20 + $0.80/oz
%     0.5 - 5 lb  : $18.60 + $4.80 per additional 0.5 lb (or fraction)
%     > 5 lb      : $61.80 + $6.40 per additional lb (or fraction)

for i = 1:3
    service = input('Please input the type of service\n G for Ground,E for Express, O for Overnight: ', 's');
    weight  = input('Please enter the weight of the package as [lb oz]: ');
    lb = weight(1);
    oz = weight(2);

    % Convert package weight to total pounds
    total_lb = lb + oz / 16;

    % --- Ground ---
    if service == 'G'
        if total_lb <= 0.5
            cost = 0.70 + 0.06 * oz;
        elseif total_lb <= 5
            % Count how many 0.5-lb units (including fractions) above 0.5 lb
            units = 0;
            remaining = total_lb - 0.5;
            while remaining > 0
                units = units + 1;
                remaining = remaining - 0.5;
            end
            cost = 1.18 + units * 0.42;
        else
            % Count how many 1-lb units (including fractions) above 5 lb
            units = 0;
            remaining = total_lb - 5;
            while remaining > 0
                units = units + 1;
                remaining = remaining - 1;
            end
            cost = 4.96 + units * 0.72;
        end

    % --- Express ---
    elseif service == 'E'
        if total_lb <= 0.5
            cost = 2.40 + 0.25 * oz;
        elseif total_lb <= 5
            units = 0;
            remaining = total_lb - 0.5;
            while remaining > 0
                units = units + 1;
                remaining = remaining - 0.5;
            end
            cost = 4.40 + units * 1.20;
        else
            units = 0;
            remaining = total_lb - 5;
            while remaining > 0
                units = units + 1;
                remaining = remaining - 1;
            end
            cost = 15.20 + units * 1.80;
        end

    % --- Overnight ---
    else
        if total_lb <= 0.5
            cost = 12.20 + 0.80 * oz;
        elseif total_lb <= 5
            units = 0;
            remaining = total_lb - 0.5;
            while remaining > 0
                units = units + 1;
                remaining = remaining - 0.5;
            end
            cost = 18.60 + units * 4.80;
        else
            units = 0;
            remaining = total_lb - 5;
            while remaining > 0
                units = units + 1;
                remaining = remaining - 1;
            end
            cost = 61.80 + units * 6.40;
        end
    end

    fprintf('\nThe cost of service will be $%.2f\n\n', cost);
end

% ===========================================================
disp('Problem 5');
% ===========================================================
% Iterative cubic root: x_{i+1} = (P/x_i^2 + 2*x_i) / 3
% Start with x_1 = P, stop when relative error E < 0.00001
% E = |x_{i+1} - x_i| / |x_i|

P_values = [100, 53701, 19.35];

for k = 1:3
    P = P_values(k);
    x = P;      % first estimate: x_1 = P
    E = 1;      % initialize error large enough to enter loop

    while E >= 0.00001
        x_new = (P / x^2 + 2 * x) / 3;        % compute next estimate
        E     = abs(x_new - x) / abs(x);       % compute relative error
        x     = x_new;                          % update current estimate
    end

    fprintf('The cube root of %g is %.1f\n', P, x);
end
