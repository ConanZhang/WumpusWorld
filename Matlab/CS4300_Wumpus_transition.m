function [can_transition] = CS4300_Wumpus_transition(state, action,board)
can_transition = 1;

    if action ==1
        x = state(1);
        y = state(2);
        dir = state(3);
        
        %move to position first and then check whether the agent survived
        if dir==0
            y=y+1;
        elseif dir==1
            x = x+1;
        elseif dir == 2
            y = y-1;
        elseif dir == 3
            x = x-1;
            
            
        %if next is W or P
        %if edge of board and moving off of board 
        if x>5 || y>5 || y<1 || x<1
            can_transition = 0;
        elseif board(transpose_coord(x), y)==1 || board(transpose_coord(x), y)==3
            can_transition = 0;
        end          
        
        end
end


end

function [x] = transpose_x( n)
    x= 5-n;
end