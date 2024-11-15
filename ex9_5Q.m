
%% #1
% Use dot product and the car parts list to find the total bill for fixing up your car.
% Item		           Quantity		Cost
% Intake		        2		     $60
% Intercooler           1            $99
% Exhaust Tip           1            $56
% Pistons               4		     $49

Quantity=[2, 1, 1, 4];
Cost=[60,99,56,49];
total_bill_by_dot = dot(Quantity,Cost);
total_bill_by_use_sum = sum(Quantity.*Cost);
disp(['HW9 #1 The total bill for fixing up your car is: ' num2str(total_bill_by_dot) ' dollars.']);
disp(['HW9 #1 By using sum function, the result is the same: ' num2str(total_bill_by_use_sum) ] );





 
%% #2
% Compute the following using the three matrices
% A=[2, -1; 4,5]   B=[4, 2;2, 1]  C=[2, 0, 0; 1,2,2; 5,-4,0]
% (a) Find A*B and B*A
% (b) Find the determinant of all matrices
% (c( If possible, find the inverse of each

% (a)
A=[2, -1; 4,5]   ;
B=[4, 2;2, 1]  ;
C=[2, 0, 0; 1,2,2; 5,-4,0];
% A=[2, -1, 9; 4, 5, 9; 9, 9, 9]   test
% B=[4, 2,  9; 2, 1, 9 ;9, 9, 9]   test
% A_dot_B=dot(A,B) % order doesn't matter, same results
% B_dot_A=dot(B,A) % order doesn't matter, same results
% A_cross_B=cross(A,B) % 3 x 3 order matters, negtive of another result
% B_cross_A=cross(B,A) % 3 x 3 order matters, negtive of another result
A_by_B=A*B  % order matters, different results
B_by_A=B*A  % order matters, different results

% (b)
A=[2, -1; 4,5]   ;
B=[4, 2;2, 1]  ;
C=[2, 0, 0; 1,2,2; 5,-4,0];
det_A=det(A)
det_B=det(B)
det_C=det(C)

% (c)
A=[2, -1; 4,5]   ;
B=[4, 2;2, 1]  ;
C=[2, 0, 0; 1,2,2; 5,-4,0];
det_A=det(A)
det_B=det(B)
det_C=det(C)
if det_A ~=0
    inverse_A=inv(A)
end
if det_B ~=0
    inverse_A=inv(B)
end
if det_C ~=0
    inverse_C=inv(C)
    % 0r inverse_C=C^(-1)
end






%% #3
% Determine the moment of force on the pin where force is being applied. Make sure to leave your answer in ft-lbf units.
%  M0 = r x F moment of force is calculated as the cross product
force_lbf = -35;
angle_degree = 55 ;
% f_lbf=force_lbf*cos(angle)i+ force_lbf*sin(angle)j+0k
% f_lbf =-35*cosd(55)i-35*sind(55)j+0k
f_lbf = [force_lbf*cosd(angle_degree);force_lbf*sind(angle_degree);0];
r_inch = [-10;5;0] ;% r_inch =-10i+5j+0k
r_feet = r_inch/12;
M0_lbf_ft = cross(r_feet,f_lbf) % M0 = r x F 
 




 
%% #4
% The following system of equations is used in Navier Stokes theorem to determine force fluctuations on a hypersonic jet. Solve the following system of equations using inverse matrix method.
% 3x+y+z+w+3v=27
% 5v-3y+x+7z+w=17
% 2x+2y-3z+4w-v=16
% x+y+z+w+v=1
% y-z+x-w-7v=-7
format long 
A=[3, 1,  1,  1, 3;   ;% A * X = B , so  inv(A) * A * X = inv(A) * B 
   1, -3, 7,  1, 5;   ;% so  eye(5) * X = inv(A) * B 
   2, 2, -3,  4, -1;   ;% so  eye(5) * X = inv(A) * B 
   1, 1,  1,  1,  1 ;   ;
   1, 1, -1, -1, -7]   ; % 7x7
B=[ 27;                       ;
    17;                       ;
    16;                       ;
    1;                       ;
    -7]                      ; % 5x1   
% X=[ x;
%     y;
%     z;
%     w;
%     v;]   % AX=B
tic
use_inv_x_y_z_w_v=inv(A) * B  % or X = A\B % Matrix left division Gaussian elimination  5x1  
toc

tic
use_leftDivision_x_y_z_w_v= A\B
toc






%% #5
% In general, matrix left division is faster and more accurate than the matrix inverse. Using both techniques, solve the following system of equations and time the execution with the tic and toc functions:
% 3x1 + 4x2 + 2x3 -x4 +x5 +7x6 +x7 =42 
% 2x1 -2x2 +3x3 -4x4 +5x5 +2x6 +8x7 =32 
% x1 +2x2 +3x3 +x4 +2x5 +4x6 +6x7 =12
% 5x1 +10x2 +4x3 +3x4 +9x5 -2x6 +x7 = -5
% 3x1 +2x2 -2x3 -4x4 -5x5 -6x6 +7x7 =10 
% -2x1 +9x2 +x3 +3x4 -3x5 +5x6 +x7 =18 
% x1 -2x2 -8x3 +4x4 +2x5 +4x6 +5x7 =17
format long 
A=[3, 4,  2, -1, 1,  7,  1;   ;% A * X = B , so  inv(A) * A * X = inv(A) * B 
   2, -2, 3, -4, 5,  2,  8;   ;% so  eye(7) * X = inv(A) * B 
   1, 2,  3,  1, 2,  4,  6;   ;% so  eye(7) * X = inv(A) * B 
   5, 10, 4,  3, 9,  -2, 1;   ;
   3, 2, -2, -4, -5, -6, 7;   ;
   -2,9,  1,  3, -3,  5, 1;   ;
   1, -2, -8, 4,  2,  4, 5]   ; % 7x7
B=[ 42;                       ;
    32;                       ;
    12;                       ;
    -5;                       ;
    10;                       ;
    18;                       ;
    17 ]                      ; % 7x1   
% X=[ x1;
%     x2;
%     x3;
%     x4;
%     x5;
%     x6;
%     x7 ]   % AX=B
tic
X_use_inv=inv(A) * B  % or X = A\B % Matrix left division Gaussian elimination  7x1  
toc

tic
X_use_leftDivision= A\B
toc

