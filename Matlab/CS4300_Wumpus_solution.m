function [is_solution]  = CS4300_Wumpus_solution(current_state, goal_state)
% CS4300_Wumpus_solution - checks if the current state is the goal state
% On input:
%     current_state (1x3 vector): x,y,dir values of current state
%     goal_state (1x3 vector): x,y,dir of final state
% On output:
%     is_solution (int): Says whether current state is solution 
% Call:
%     is_solution = CS4300_Wumpus_solution([1,1,0],[3,4,1])
% Author:
%     Rajul Ramchandi & Conan Zhang
%     UU
%     Fall 2016
%
is_solution = 0;
if current_state(1,1) == goal_state(1,1) && current_state(1,2) == goal_state(1,2)
    is_solution = 1;
    