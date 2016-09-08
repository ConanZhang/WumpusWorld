function [solution,nodes]  = CS4300_Wumpus_A_star1(board,initial_state, goal_state, h_name, option)
% CS4300_Wumpus_DFS - DFS on Wumpus board finding path to goal
% On input:
%     board (4x4 array): Wumpus board
%       0: empty cell
%       1: pit in cell
%       2: gold in cell
%       3: Wumpus in cell
%       4: Wumpus and gold in cell
%     initial_state (1x3 vector): x,y,dir values of initial state
%     goal_state (1x3 vector): x,y,dir of final state
% On output:
%     solution (nx4 array): n states from start to goal states
%       (x,y,dir,action)
%     nodes (search tree data structure): nodes of search tree
%       (i).parent (int): pair(1) of parent
%       (i). level (int): level in tree
%       (i).state (1x3 vector): x,y,dir of pair(1)
%       (i).action (int): action taken to get to this state
%       (i).cost (int): path cost to this pair(1) fro mroot
%       (i).children (1xk vector): indexes of pair(1)'s children
% Call:
%     b = CS4300_gen_board_A1(2)
%   b =
%       0     0     0     1
%       2     0     1     0
%       0     0     0     0
%       0     3     0     0
%     [so,no] = CS4300_Wumpus_DFS(b,[1,1,0],[3,4,1])
%   so =
%     1     1     0     0
%     1     1     1     3
%     1     2     1     1
%     1     3     1     1
%   no = 
%     1x8 struct array with fields:
%     parent
%     level
%     state
%     action
%     cost
%     g
%     h
%     children  
% Author:
%     T. Henderson & Rajul Ramchandani & Conan Zhang
%     UU
%     Fall 2016
%

nodes(1).parent = [];
nodes(1).level = 0;
nodes(1).state = initial_state;
nodes(1).action = 0;
nodes(1).g = 0;
nodes(1).h = CS4300_A_star_Man(initial_state, goal_state);
nodes(1).cost = nodes(1).g + nodes(1).h;
nodes(1).children = [];
num_nodes = 1;
frontier = PriorityQueue;
frontier = insert(frontier, [1, CS4300_A_star_Man(initial_state, goal_state)]);
explored = [];

while 1==1
    if isempty(frontier.queue)
        solution = [];
        return
    end
    pair = pop(frontier);
    explored = [explored,pair(1)];
    if CS4300_Wumpus_solution(nodes(pair(1)).state,goal_state)%checks if the current state is the goal state
        solution = CS4300_traceback(nodes,pair(1));
        return
    end
    
    % TODO: change transition assignments
    % loop to create all possible children
    for action = 1:3
        transition = CS4300_Wumpus_transition(nodes(pair(1)).state, action,board); %checks to see if agent can complete the action
        next_state = transition(:,1:3);
        if transition(4)>0 && CS4300_Wumpus_new_state(next_state,frontier,explored,nodes) %check if the new states have already been encountered in the past
            num_nodes = num_nodes + 1;
            nodes(num_nodes).parent = pair(1);
            nodes(num_nodes).level = nodes(pair(1)).level + 1;
            nodes(num_nodes).state = next_state;
            nodes(num_nodes).action = action;
            nodes(num_nodes).g = nodes(pair(1)).g + 1;
            nodes(num_nodes).h = CS4300_A_star_Man(nodes(num_nodes).state,goal_state);
            nodes(num_nodes).cost = nodes(num_nodes).g + nodes(num_nodes).h;
            nodes(num_nodes).children = [];%create empty child array for this new pair(1)            
            nodes(pair(1)).children = [nodes(pair(1)).children,num_nodes]; % add this new pair(1) to the parent's children
            %next_list = [num_nodes,next_list];
            insert(frontier, [num_nodes, nodes(num_nodes).cost], option); 
        end
    end    
end