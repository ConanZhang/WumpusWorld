function [next_state] = CS4300_Wumpus_transition(state, action, board)
% CS4300_Wumpus_transition - test if a Wumpus board has a solution
% On input:
%       state (1x3 vector): x,y,dir of node
%       action (int): action taken to get to this state
%     board (4x4 array): Wumpus board
%       0: empty cell
%       1: pit in cell
%       2: gold in cell
%       3: Wumpus in cell
%       4: Wumpus and gold in cell
% On output:
%     can_transition: new state if transition is valid; else 0
% Call:
%     next_state = CS4300_Wumpus_transition(nodes(node).state, action,board);
% Author:
%     Rajul Ramchandani & Conan Zhang
%     UU
%     Fall 2016
%
can_transition = 1;
    x = state(1);
    y = state(2);
    dir = state(3);
    
    if action ==1
        %move to position first and then check whether the agent survived
        if dir==0
            y=y+1;
        elseif dir==1
            x = x+1;
        elseif dir == 2
            y = y-1;
        elseif dir == 3
            x = x-1;
        end
            
        %if next is W or P
        %if edge of board and moving off of board 
        if x>5 || y>5 || y<1 || x<1
            can_transition = 0;
        elseif board(transpose_x(x), y)==1 || board(transpose_x(x), y)==3
            can_transition = 0;
        end          
    elseif action == 2 %Right
        if dir==0
            dir = 3;
        else
            dir = dir - 1;
        end
    elseif action == 3 %Left
        if dir==3
            dir = 0;
        else 
            dir = dir + 1;
        end
    end
    next_state = [x,y,dir,can_transition];
end

function [x] = transpose_x( n)
    x= 5-n;
end