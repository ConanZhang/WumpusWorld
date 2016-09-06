function action = CS4300_agent1( percept )
%CS4300_agent1 
%   It randomly either changes direction or moves forward
% On input:
%     percept (1x5 Boolean vector): percept values
%      (1): Stench
%      (2): Pit
%      (3): Glitters
%      (4): Bumped
%      (5): Screamed
% On output:
%     action (int): action selected by agent
%       FORWARD = 1;
%       ROTATE_RIGHT = 2;
%       ROTATE_LEFT = 3;
%       GRAB = 4;  --NOT USED
%       SHOOT = 5;  --NOT USED
%       CLIMB = 6;  --NOT USED
% Call:
%     a = CS4300_Example1([0,1,0,0,0]);
% Author:
%     Conan Zhang and Rajul Ramchandani
%     UU
%     Fall 2016
%
persistent state

FORWARD = 1;
ROTATE_RIGHT = 2;
ROTATE_LEFT = 3;

if isempty(state)
    state = 1;
else 
    state = randi([1,3],1);
end

switch state
    case 1
        action = FORWARD;
        
    case 2
        action = ROTATE_RIGHT;
        
    case 3
        action = ROTATE_LEFT;
end
end

