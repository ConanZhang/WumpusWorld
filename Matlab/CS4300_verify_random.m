function histogram = CS4300_verify_random(num_trials)
% CS4300_verify_random - verify random state works
% On input:
%     num_trials (int): number of trials
% On output:
%
% Call:
%     CS4300_verify_random();
% Author:
%     Conan Zhang & Rajul Ramchandani
%     UU
%     Fall 2016
%

res = zeros(num_trials,1);
wb = waitbar(0,'Verify Random');
for t = 1:num_trials
    res(t,1) = randi([1,3],1);
end
close(wb);

% Histogram for Random State
hist(res);
set(gca,'XTick',[1, 2, 3] );
title('Random State Count for 3000 Trials')
xlabel('State')
ylabel('Count')