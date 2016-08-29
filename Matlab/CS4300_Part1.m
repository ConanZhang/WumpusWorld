function results = CS4300_Part1(N)
% CS4300_Part1 
% On input:
%     N (int): Number of Boards
% On output:
%     results : An array containing mean, variance, 
%               and 95% confidence intervals for 0 to 14 pits
% Call:
%     results = CS4300_Part1(2000);
% Author:
%     Conan Zhang and Rajul Ramchandani
%     UU
%     Fall 2016
%

results = zeros (15,5);
wb = waitbar(0, 'Results');

for p = 0:14
    waitbar(p/14);    
    solvable = zeros(N,1);
    for j = 1:N
        board = CS4300_gen_board_A1(p);
        solvable(j) = CS4300_Wumpus_solvable(board);
    end
    results(p+1 , 1) = p;
    results(p+1, 2) = mean(solvable);
    results(p+1, 3) = var(solvable);
    results(p+1, 4) = results(p+1, 2) - 1.645*sqrt(results(p+1, 3)/N);
    results(p+1, 5) = results(p+1, 2) + 1.645*sqrt(results(p+1, 3)/N);
end

close(wb);