
%% #1
% (a) Use a for loop to sum the elements in the following vector:
% X= [1, 23, 43, 72, 87, 56, 98, 33]  Check your answer with the sum function.
% (b) Repeat part (a), this time using while loop.

% (a) 
X= [1, 23, 43, 72, 87, 56, 98, 33];
sumFunction = sum(X) ; 
sum_forLoop=0 ;
for n=1:length(X)
    sum_forLoop=sum_forLoop + X(n);
end
disp(['HW8 #1 (a) Sum of X by using function sum() is: ' num2str(sumFunction)]);
disp(['HW8 #1 (a) Sum of X by using for loop is: ' num2str(sum_forLoop) ] );

% (b) 
X= [1, 23, 43, 72, 87, 56, 98, 33];
sumFunction = sum(X) ; 
k=0;
sum_WhileLoop=0;
while k<length(X) % make sure use <, not <=
    k=k+1;
    sum_WhileLoop=sum_WhileLoop + X(k);
end 
disp(['HW8 #1 (b) Sum of X by using function sum() is: ' num2str(sumFunction)]);
disp(['HW8 #1 (b) Sum of X by using while loop is: ' num2str(sum_WhileLoop) ] );








%% #2
% Use the primes function to create a list of all the primes below 100. Now use a for loop to multiply adjacent values together. For example, the first four prime numbers are
% 2, 3, 5, 7
% Your calculation would be 2*3, 3*5, 5*7
% Which gives 6, 15, 35
primes_numbers=primes(100);
k=0;
calc_result=[];

for    n = 1:length(primes_numbers) ;
    k=k+1;
    if n+1<= length(primes_numbers)
        calc_result(k)= primes_numbers(n) *primes_numbers(n+1);
        disp([num2str(primes_numbers(n)) ' * ' num2str(primes_numbers(n+1) ) ' = ' num2str(calc_result(k)) ]);         
    end
end
disp('The result is:')
disp([num2str(calc_result) ]) 
 





 
%% #3
%  A Fibonacci sequence is composed of elements created by adding the two previous elements. The simplest Fibonacci sequence starts with 1, 1 and proceeds as follows:
%  1, 1, 2, 3, 5, 8, 13, …
% However, a Fibonacci sequence can be created with any two starting numbers. Fibonacci sequences appear regularly in nature. 
% Prompt the user to enter the first two numbers in a Fibonacci sequence and the total number of elements requested for the sequence. 
% Find the sequence and store it in an array by using a for loop. 
% Now plot your results on a polar graph. Use the element number for the angle and the value of the element in the sequence for the radius.

first_num=input('Please enter the first number in a Fibonacci sequence: ');
second_num=input('Please enter the second number in a Fibonacci sequence: ');
total_num=input('Please enter the total number of elements requested for Fibonacci sequence: ');
Fibonacci_sequence =[first_num, second_num];
k=2;
for    n = 3:total_num 
    k=k+1;
    Fibonacci_sequence(k)= Fibonacci_sequence(k-1) + Fibonacci_sequence(k-2)    ; 
end 
% Fibonacci_sequence
disp(['The first number in a Fibonacci sequence: ' num2str(first_num)])
disp(['The second number in a Fibonacci sequence: ' num2str(second_num)])
disp(['The total number of elements requested for Fibonacci sequence:  ' num2str(total_num)])
disp(['Fibonacci sequence:  ' num2str(Fibonacci_sequence)])

figure('Name','HW8 #3 Fibonacci sequence');
set(gcf, 'Position',  [100, 100, 600, 600])
polar(Fibonacci_sequence, 'r');
title('Fibonacci sequence', 'Fontsize',16, 'Color','red');
xlabel('element number for the angle', 'Fontsize', 16 ,'Color', 'red');
ylabel('element value in sequence for radius', 'Fontsize',16,'Color','red');








%% #4
% Edmond Halley (the astronomer famous for discovering Halley’s Comet) invented a fast algorithm for computing the square root of a number, A .Halley’s algorithm approximates A  as follows: Start with an initial guess x1. The new approximation is then given by
% Yn=1/A * Xn^2
% Xn+1=Xn/8 *(15-Yn(10-3*Yn))
% |Xn+1-Xn| ≤ £
A=input('Enter a number for computing the square root of this number: ')
epsilon=0.002;
Y=0;
first_X  = fix(A^0.5);
while epsilon >= 0.001
    Edmond_Halley_Y=1/A * first_X^2;
    second_X=first_X/8 * (15 - Edmond_Halley_Y * (10 - 3 * Edmond_Halley_Y));
    epsilon=abs(second_X-first_X);
    first_X=second_X;
end
disp(['HW8 #4: Halley''s algorithm approximates the square root of ' num2str(A) ' is ' num2str(first_X)]);
disp([ 'HW7 #4 the built in matlab sqrt function result is: ' num2str(sqrt(A))  ] );
disp(['HW8 #4: So, Halley''s algorithm approximates the square root is great. ']);
  







%% #5
% Let’s say you and your friend are trying to predict the outcome of a flip of a coin. In MATLAB, 
% create a random coin flip with heads being 1 and tails being 2. 
% Ask the user to predict what the outcome will be. 
% If the user predicts right, display a winning sentence and vice versa for if the user does not predict right. 
% Afterwards, ask the user if they want to play again or stop playing. 
% If the user elects to play again, the program should run itself from the beginning asking the user for their prediction.

flag=' ';
while true
    if strtrim(flag)=='q' | strtrim(flag)=='Q'
         disp(['You entered '  flag ]);
         disp(['(1 is true to quit the program, 0 is false)']);
         disp([strtrim(flag)=='q' | strtrim(flag)=='Q']);
         break
    else
        number_guess=input('Please predict a random coin flip with heads being 1 or tails being 2: ');
        number_random=round(rand(1,1)*1+1); 
        if number_guess==number_random
            disp(['HW8 #5 The  random coin flip is: ' num2str(number_random)]);
            disp(['HW8 #5 You predicted it right! ' ]);
        else
            disp(['HW8 #5 The  random coin flip is: ' num2str(number_random)]);
            disp(['HW8 #5 You predicted it wrong!  ' ]);
        end  
        flag=input('Please hit any other key to play again, hit q or Q to quit: ','s');  
    end
end

  
    
