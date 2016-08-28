function trace = CS4300_WW2(max_steps,f_name)
% CS4300_WW2 - Wumpus World 2 simulator
% On input:
%     max_steps (int): maximum number of simulation steps
%     f_name (string): name of agent function
% On output:
%     trace (nx3 int array): trace of state
%       (i,1): x location
%       (i,2): y location
%       (i,3): action selected at time i
% Call:
%     t = CS4300_WW1(50,'CS4300_Example2');
% Author:
%     T. Henderson
%     UU
%     Summer 2015
%

agent.x = 1;
agent.y = 1;
agent.alive = 1;  
agent.gold = 0;  % grabbed gold in same room
agent.dir = 0;  % facing right
agent.succeed = 0;  % has gold and climbed out
agent.climbed = 0; % climbed out

%board = [3,1,2,0;1,0,0,0;0,0,1,1;0,0,0,0];
%trace = CS4300_WW1(max_steps,f_name,board);

N = 10;
trials = 5;
val = containers.Map('KeyType','double','ValueType','any');

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