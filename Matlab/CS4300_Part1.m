function result = CS4300_Part1(N)
% CS4300_Part1 
% On input:
%     N (int): Number of Boards
% On output:
%       
% Call:
%     t = CS4300_WW1(50,'CS4300_Example2');
% Author:
%     Conan Zhang and Rajul Ramchandani
%     UU
%     Fall 2016
%

trials = 2000;
val = containers.Map('KeyType','double','ValueType','any');
data = zeros(1,2);

for p = 0:14
    experiment = zeros(trials, 1);
    for i = 0:trials
        count = 0;
        for j = 1:N
            board = CS4300_gen_board_A1(p);
            solved = CS4300_Wumpus_solvable(board);
            if solved==1
                count= count+1;
            end
        end
        percentage_solved = count/N;
        experiment(i+1, 1) = percentage_solved;
    end
    val(p+1) = experiment;
end

% TODO Calculate variance/mean to evaluate confidence interval 95%

t= CS4300_WW1(50,'CS4300_agent1',[0,1,0,0;0,0,1,0;0,3,2,0;0,0,0,0]);
M = CS4300_show_trace(t,1);
movie(M)

%Part 2
%t= CS4300_WW1(50,'CS4300_agent1',[0,1,2,0;1,0,0,0;0,0,1,1;0,0,0,0]); %board given in Part 2
%data = CS4300_get_data(t);