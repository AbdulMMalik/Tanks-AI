function score = evaluateFitness( net )
    
    rows = 15; cols = 15;
    turn = 11;
    total_turns = 1000;
    globalBoard = initializeBoard(rows, cols);
    globalBoard(1, 15) = 22;
    globalBoard(15, 1) = 11;
    globalBoard(1, 1) = 33;
    globalBoard(15, 15) = 44;
    
    p1 = {};
    p1{1} = 11;
    p1{2} = initializeBoard( rows, cols );
    p1{2}( 15, 1 ) = 11;
    p1{3} = 1;
    p1{4} = 10;
    p1{5} = true;

    p2 = {};
    p2{1} = 22;
    p2{2} = initializeBoard(rows, cols);
    p2{2}(1, 15) = 22;
    p2{3} = 2;
    p2{4} = 10;
    p2{5} = true;

    p3 = {};
    p3{1} = 33;
    p3{2} = initializeBoard(rows, cols);
    p3{2}(1, 1) = 33;
    p3{3} = 4;
    p3{4} = 10;
    p3{5} = true;

    p4 = {};
    p4{1} = 44;
    p4{2} = initializeBoard(rows, cols);
    p4{2}(15, 15) = 44;
    p4{3} = 3;         
    p4{4} = 10;
    p4{5} = true;

    agentLocalBoard = zeros(15, 15);
    agentLocalBoard = agentLocalBoard - 1;
    globalBoard = placeRocks(globalBoard);
    %find agent's local board

    while ( total_turns > 0 )
        if turn ~= p1{1, 1}
            move = randomMove();
            if move == 7
               [ x, y ] = find(globalBoard == turn);
               agentLocalBoard( x, y ) = turn;
            end
        end
        if ( turn == 11 && p1{5} == true )
            agentLocalBoard = findVision( agentLocalBoard, globalBoard, p1{1, 1}, p1);
            % give best move use neural network
            move = generateAgentMove( net, agentLocalBoard );
           [ p1, p2, p3, p4,  globalBoard ] = makeLegalMove( globalBoard, move, p1, p2, p3, p4);
           turn = changeTurn ( turn );
           %grid = boardToGrid( globalBoard,  p1, p2, p3, p4 );
           %imshow( grid );

        elseif ( turn == 22 && p2{5} == true )
            [ p2, p1, p3, p4, globalBoard ] = makeLegalMove( globalBoard, move, p2, p1, p3, p4);
            turn = changeTurn ( turn );
            %grid = boardToGrid( globalBoard, p1, p2, p3, p4 );
            %imshow( grid );

        elseif ( turn == 33 && p3{5} == true )
            [ p3, p1, p2, p4, globalBoard ] = makeLegalMove( globalBoard, move, p3, p1, p2, p4);
            turn = changeTurn ( turn );
            %grid = boardToGrid( globalBoard, p1, p2, p3, p4 );
            %imshow( grid );

        elseif( p4{5} == true )
            [ p4, p1, p2, p3, globalBoard ] = makeLegalMove( globalBoard, move, p4, p1, p2, p3);
            turn = changeTurn ( turn );
            %grid = boardToGrid( globalBoard, p1, p2, p3, p4 );
            %imshow( grid );
        end 
        total_turns = total_turns - 1;
    end
    
    score = p1{1, 4};
end

