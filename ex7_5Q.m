
%% #1
% The height of a rocket (in meters) can be represented by the following equation: 
% Height = 2.13 t^ 2 - 0.0013 t^ 4 + 0.000034 t ^ (4.751)
% Create a vector of time ( t ) values from 0 to 100 at 2-second intervals. Use the find function to determine when the rocket hits the ground to within 2 seconds. (Hint : The value of height will be positive for all values until the rocket hits the ground.)
% Plot your results to back up your answer.
format shortEng;
t=[0:2:100]; % t=0:2:100;
Height = 2.13 * t .^2 - 0.0013 * t .^4 + 0.000034 * t .^(4.751);
table_time_Height = [t; Height]';
find_above_ground_index =find(table_time_Height(:,2)>=0 );
time_hit_ground = t(max(find_above_ground_index))
fprintf('The rocket hits the ground after %8.0f seconds \n',time_hit_ground);
table_rocket_above_ground_with_index = [find_above_ground_index, table_time_Height(find_above_ground_index,1),table_time_Height(find_above_ground_index,2)] 
time_rocket_hits_ground = max(table_rocket_above_ground_with_index(:,2))

figure('Name','HW7 #1 height versus time');
set(gcf, 'Position',  [0, 0, 500, 500])
plot(t,Height,'b','LineWidth',8);
title('height vs time', 'Fontsize',20, 'Color','blue')
xlabel('time', 'Fontsize',20, 'Color','blue')
ylabel('height','Fontsize', 20, 'Color','blue')
[T, H] = ginput(1);
% min_height=min(H) ; 
% time_when_minH=max(T);
disp('HW7 #1 To estimate the time when the rocket hits the ground.');
disp(['When the rocket reaches ground ' num2str(H) ' meters, the time is ' num2str(T) ' seconds.'] );
disp('So, my answer is correct.')
disp(' ');
disp(' ');








%% #2
% Create a function called g that satisfies the following criteria. (Hint: Find function)
% For x < -π		g(x) = -1
% For x ≥ -π and x ≤ π	g(x) = cos(x)
% For x >π		g(x) = -1
% Plot your results for values of x from -2pi to +2pi. Choose your spacing to create a smooth curve.

k=0;
x = [-2 * pi :pi/100 : 2 * pi]  ;
for    n = [-2 * pi :pi/100 : 2 * pi] ;
    % n
    k=k+1;
    y(k)=g(n);
end
table_x_y=[x;y]';
figure('Name','HW7 #2 x vs piecewise function y');
set(gcf, 'Position',  [100, 0, 600, 600]);
plot(x,y,'r','LineWidth',8);
title('x vs piecewise function y', 'Fontsize',20, 'Color','red');
xlabel('x', 'Fontsize',20, 'Color','red');
ylabel('y','Fontsize', 20, 'Color','red');
text(-7.5,-0.8,'x < -π, y = -1', 'Fontsize', 20,'Color','blue');
text(-6,0.8,'x ≥ -π and x ≤ π,         y = cos(x)', 'Fontsize', 20,'Color','blue') ;
text(3,-0.8,'x >π, y = -1', 'Fontsize', 20,'Color','blue');








%% #3
%  Create a program that first prompts the user to enter a value for x and 
%  then prompts the user to enter a value for y. 
% If the value of x is greater than the value of y, send a message to the command window telling the user that x > y. 
% If x is less than or equal to y, send a message to the command window telling the user that y >= x.

flag=' ';
while true
     if strtrim(flag)=='q' | strtrim(flag)=='Q'
         disp(['You entered '  flag ]);
         disp(['(1 is true to quit the program, 0 is false)']);
         disp([strtrim(flag)=='q' | strtrim(flag)=='Q']);
         break
    else
        input_x=input('Please enter a value for x: ');
        input_y=input('Please enter a value for y: ');
        if input_x>input_y
            disp(['HW7 #3  ' num2str(input_x) ' > ' num2str(input_y)]);
        else
            disp(['HW7 #3  ' num2str(input_y) ' >= ' num2str(input_x)]);
        end
        flag=input('To quit, please hit any other key to continue, hit q or Q to quit: ', 's');
     end
end








%% #4
% Suppose the following matrix represents the number of saws ordered from your company each month over the last year.% h(t) = (-9.8/2) * t^2 + 125 * t + 500
% saws = [1,4,5,3,7,5,3,10,12,8, 7, 4]
% All the numbers should be zero or positive.
% (a) Use an if statement to check whether any of the values in the matrix are invalid. (Evaluate the whole matrix at once in a single if statement.) Send the message "All valid" or else "Invalid number found" to the screen, depending on the results of your analysis. 
% (b) Change the saws matrix to include at least one negative number, and check your program to make sure that it works for both cases.

% (a)
saws = [1,4,5,3,7,5,3,10,12,8, 7, 4];
counter_negtive=0;
invalid_num=[];
for n=1:length(saws)
    if saws(n)<=0
        counter_negtive=counter_negtive+1;
        invalid_num=[invalid_num, saws(n)];
    end
end
disp(' ');
if counter_negtive==0
    disp('HW7 #4 (a) All valid.');
else
    disp([ num2str(counter_negtive) ' invalid number found, which  are:  '  num2str(invalid_num) ] );
end    

   

% (b)
saws = [-1,4,5,3,7,5,3,10,12,8, 7, 0];
counter_negtive=0;
invalid_num=[];
for n=1:length(saws)
    if saws(n)<=0
        counter_negtive=counter_negtive+1;
        invalid_num=[invalid_num, saws(n)];
    end
end
disp(' ');
if counter_negtive==0
    disp('HW7 #4: All valid.');
else
    disp([ 'HW7 #4 (b): ' num2str(counter_negtive) ' invalid number found, which  are:  '  num2str(invalid_num) ] );
end    








%% #5
% In order to have a closed geometric figure composed of straight lines, the angles in the figure must add to
%  (n - 2)(180 degrees)    Where n is the number of sides.
% (a) Write a program that prompts the user to enter one of the following:
% triangle
% square
% pentagon
% hexagon
% Use the input to define the value of n via a switch/case structure; then use n to calculate the sum of the interior angles in the figure.
% (b) Reformulate your program from part (a) so that it uses a menu.

% (a) 
shape=input('Please select a shape: triangle, square, pentagon or hexagon: ', 's');
switch shape;
    case 'triangle'
        n=3;
    case 'square'
        n=4;
    case 'pentagon'
        n=5;
    case 'hexagon'
        n=6;
    otherwise
        n=0;
end;
disp('  ')
if n==0
    disp(['HW7 #5 (a) You did not spell the word as directed.  ']); 
else
    angles_add=(n - 2) * 180 ;
    disp(['HW7 #5 (a) In order to have a closed geometric figure composed of straight lines,']);
    disp(['the angles in the figure as ' shape ' must add to  ' num2str(angles_add) '  degrees.']);
end

% (b) 
shape=menu('Please select a shape: ','triangle','square','pentagon','hexagon');
switch shape
    case 1
        n=3;
    case 2
        n=4;
    case 3
        n=5;
    case 4
        n=6;
end;
angles_add=(n - 2) * 180 ;
disp(['HW7 #5 (b) In order to have a closed geometric figure composed of straight lines,']);
disp(['the angles in the figure must add to  ' num2str(angles_add) '  degrees.']);

