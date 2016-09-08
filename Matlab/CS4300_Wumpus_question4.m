function no_of_nodes = CS4300_Wumpus_question4(state, action, board)
    board = zeros(4,4);
    no_of_nodes = zeros(4,4);
    for i = 1:4
        for j = 1:4
           board(5-i,j) = 2;
           solution = CS4300_Wumpus_A_star1(board,[1,1,0],[i,j,1],'CS4300_A_star_Man',2);
           
           s = size(solution);
           sizex= s(1);
           
           totalsize = sizex;
           no_of_nodes(5-i,j) = totalsize;
           board = zeros (4,4);
        end
    end

end