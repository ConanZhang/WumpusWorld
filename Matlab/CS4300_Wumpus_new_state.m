function is_new=  CS4300_Wumpus_new_state(next_state,frontier,explored,nodes)
% CS4300_Wumpus_new_state - check if the new states have already been encountered in the past
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
%     is_new (Boolean): 1 if state is new; else 0
% Call:
%     next_state = CS4300_Wumpus_transition(nodes(node).state, action,board);
% Author:
%     Rajul Ramchandani & Conan Zhang
%     UU
%     Fall 2016
%

for i = 1:Length(frontier)
    if(nodes(frontier.queue(1,i)) == next_state  )
        

end