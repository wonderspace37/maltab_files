% Math 5: Midterm
%
% Name: Aman Sirigineedi
% Date: 3/23/2026
clear; clc;

% ===========================================================
disp('Problem 1: Hakki Formula');
% ===========================================================
% Aortic valve area: Av = Q / sqrt(PG)
% Q  = cardiac output (L/min)
% PG = systolic pressure difference (mm Hg), 2 <= PG <= 60

PG = 2:60;
Av4 = 4 ./ sqrt(PG);   % curve for Q = 4 L/min
Av5 = 5 ./ sqrt(PG);   % curve for Q = 5 L/min

plot(PG, Av4, '-b', PG, Av5, '--r')
xlabel('Systolic Pressure Difference, mm Hg')
ylabel('Aortic Valve Area, cm^2')
title('Hakki Formula')
legend('4 L/min Cardiac Output', '5 L/min Cardiac Output')

% ===========================================================
disp('Problem 2: Course Grade Calculator');
% ===========================================================
% Grading scheme:
%   Quizzes (0-10 scale): drop lowest, average top 5 = 30% of grade
%   Midterms & Final (0-100 scale):
%     If midterm avg >= final: midterms = 50%, final = 20%
%     If final > midterm avg:  midterms = 20%, final = 50%
% Letter grades: A>=90, B>=80, C>=70, D>=60, E<60

for i = 1:2
    quizzes  = input('Please enter the quiz grades as a vector [x x x x x x]: ');
    midterms = input('Please enter the midterm grades as a vector [x x x]: ');
    final    = input('Please enter the final exam grade: ');

    % Drop lowest quiz, average top 5
    quizzes_sorted = sort(quizzes);          % ascending order
    quiz_avg = mean(quizzes_sorted(2:end));  % drop first (lowest)

    % Quiz contribution: quiz is on 0-10 scale, worth 30% of 0-100 grade
    % quiz_avg/10 * 100 * 0.30 = quiz_avg * 3
    quiz_contribution = quiz_avg * 3;

    % Midterm and final contributions
    midterm_avg = mean(midterms);
    if midterm_avg >= final
        course_grade = quiz_contribution + midterm_avg * 0.50 + final * 0.20;
    else
        course_grade = quiz_contribution + midterm_avg * 0.20 + final * 0.50;
    end

    % Assign letter grade
    if course_grade >= 90
        letter = 'A';
    elseif course_grade >= 80
        letter = 'B';
    elseif course_grade >= 70
        letter = 'C';
    elseif course_grade >= 60
        letter = 'D';
    else
        letter = 'E';
    end

    fprintf('The overall course grade is %.1f for a letter grade of %s\n\n', course_grade, letter);
end

% ===========================================================
disp('Problem 3: Taylor Series for cos(x)');
% ===========================================================
% cos(x) = sum_{n=0}^{inf} (-1)^n * x^(2n) / (2n)!
% Add terms until relative error E = |Sn - S_{n-1}| / |S_{n-1}| <= 0.000001

for i = 1:2
    deg = input('Please input an angle in degrees: ');
    x   = deg * pi / 180;   % convert degrees to radians

    S = 1;         % S_0 = first term (n=0): (-1)^0 * x^0 / 0! = 1
    n = 1;
    E = 1;         % initialize error large enough to enter loop

    while E > 0.000001
        an    = ((-1)^n) * x^(2*n) / factorial(2*n);  % nth term
        S_new = S + an;
        E     = abs(S_new - S) / abs(S);               % relative error
        S     = S_new;
        n     = n + 1;
    end

    fprintf('The value of cosine of %d degrees is %.8f\n\n', deg, S);
end
