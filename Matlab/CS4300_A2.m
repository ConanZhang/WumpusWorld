function results = CS4300_A2(N)
% CS4300_A2
% On input:
%     N (int): Number of Boards
% On output:
%     results : An array containing mean, variance, 
%               and 95% confidence intervals
% Call:
%     results = CS4300_A2(2000);
% Author:
%     Rajul Ramchandani and Conan Zhang
%     UU
%     Fall 2016
%

results = zeros (1,4);
wb = waitbar(0, 'Results');

nodes_generated = zeros(N, 1);
for i = 1:N
    waitbar(i/N);    
    board = CS4300_gen_board(0.2);
    gold_location = find_gold(board);
    [solution, nodes] = CS4300_Wumpus_A_star1(board,[1,1,0],gold_location,'CS4300_A_star_Man',1);
    node_size = size(nodes);
    nodes_generated(i) = node_size(1);
end
results(1, 1) = mean(nodes_generated);
results(1, 2) = var(nodes_generated);
results(1, 3) = results(1, 1) - 1.96*sqrt(results(1, 2)/N);
results(1, 4) = results(1, 1) + 1.96*sqrt(results(1, 2)/N);

close(wb);

end

function [gold_location] = find_gold(board)
    for i = 1:4
        for j = 1:4
            if board(i, j) == 2
                gold_location = [5-i, j, 0];
                break;
            end
        end
    end
end