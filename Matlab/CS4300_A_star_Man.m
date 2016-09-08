function h = CS4300_A_star_Man(initial_state,goal_state)
% CS4300 - A star man
% On input:
%     initial_state (1x3 vector): x,y,dir state
%     goal_state (1x3 vector): x,y,dir state
% On output:
%     f int : 
% Call:
%     f = CS4300_Wumpus_A_star1([1,1,0],[2,2,1])
% Author:
%     Rajul Ramchandani & Conan Zhang
%     UU
%     Fall 2016
%
x_distance = abs(initial_state(1) - goal_state(1));
y_distance = abs(initial_state(2) - goal_state(2));
h = x_distance + y_distance;