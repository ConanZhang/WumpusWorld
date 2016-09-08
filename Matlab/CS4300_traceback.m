function solution_nodes = CS4300_traceback(nodes, current_index, initial_state)
% CS4300 - Traceback nodes to find solution
% On input:
%     initial_state (1x3 vector): x,y,dir state
%     goal_state (1x3 vector): x,y,dir state
% On output:
%     f int : 
% Call:
% solution = CS4300_traceback(nodes,pair(1));
% Author:
%     Rajul Ramchandani & Conan Zhang
%     UU
%     Fall 2016
%
solution_nodes = [];
node = nodes(current_index);
    while 1 == 1
       if node.state(1) == initial_state(1) && node.state(2) == initial_state(2)
           solution_nodes = [node.state, node.action; solution_nodes];
           break;
       else
           solution_nodes = [node.state, node.action; solution_nodes];
           node = nodes(node.parent);
       end
    end
end