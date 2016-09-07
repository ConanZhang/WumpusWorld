function [solution,nodes]  = CS4300_Wumpus_A_star1(board,initial_state, goal_state,h_name,option)
% CS4300_Wumpus_A_star1 - A* algorithm for Wumpus world
% On input:
%     board (4x4 int array): Wumpus board layout
%       0: means empty cell
%       1: means a pit in cell
%       2: means gold (only) in cell
%       3: means Wumpus (only) in cell
%       4: means gold and Wumpus in cell
%     initial_state (1x3 vector): x,y,dir state
%     goal_state (1x3 vector): x,y,dir state
%     h_name (string): name of heuristic function
%     option (int): picks insertion strategy for equal cost states
%        1: insert state before equal or greater than states
%        2: insert after equal or less than states
% On output:
%     solution (nx4 array): solution sequence of state and the action
%     nodes (search tree data structure): search tree
%       (i).parent (int): index of node’s parent
%       (i).level (int): level of node in search tree
%       (i).state (1x3 vector): [x,y,dir] state represented by node
%       (i).action (int): action along edge from parent to node
%       (i).g (int): path length from root to node
%       (i).h (float): heuristic value (estimate from node to goal)
%       (i).cost (float): g + h   (called f value in text)
%       (i).children (1xk vector): list of node’s children
% Call:
%[so,no] = CS4300_Wumpus_A_star1([0,0,0,0;0,0,0,1;0,2,1,3;0,0,0,0], [1,1,0],[2,2,1],'CS4300_A_star_Man',1)
% so =
%     1     1     0     0
%     2     1     0     1
%     2     1     1     3
%     2     2     1     1
%
% no = 1x9 struct array with fields:
%    parent
%    level
%    state
%    action
%    cost
%    g
%    h
%    children
% Author:
%     Rajul Ramchandani & Conan Zhang
%     UU
%     Fall 2016
%
nodes = {};
root = {0, 0, {1,1,0}, 0, feval(h_name,initial_state, goal_state), 0, feval(h_name,initial_state, goal_state), []};
nodes{end+1} = root;
frontier = PriorityQueue;
frontier = insert(frontier, root, option);
explored = {};



while 1
     if isempty(frontier)
         so = [];
         return
     else
         node = pop(frontier);
         explored{end+1} = node;
         nodes{end+1} = node;
     end
     
     if node{1, 3}{1,1} == goal_state(1, 1) && node{1,3}{1, 2} == goal_state(1,2)
         so = traceback(node, initial_state);
         return;
     else
         
        % TODO: Calculate f = h + g
        %put children in the children part of the parent node once you
        %explore 
     
     end
     
     
end

end

function solution_nodes = traceback(node, initial_state)
    while node{1,1} ~= initial_state(1,1) && node(1,2) ~= initial_state(1,2)
       solution_nodes(end+1) = node;
       node = nodes(node{1,1});
    end
end

% frontier = insert(frontier, {0,0, {0,900},0,1},{0});
% frontier = insert(frontier,{0,0,0,0,3},1);
% frontier = insert(frontier,{1,0,0,0,2},1);
% frontier = insert(frontier,{2,0,0,0,2},1);

% celldisp(frontier.queue)