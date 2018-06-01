function localBoard = findVision( localBoard, globalBoard, agentTurn, agent)

colH_R = -1;
colH_L = -1;

[ x, y ] = find( globalBoard == agentTurn );
dummy_x = x; dummy_y = y;

    if agent{1, 3} == 1
        while(dummy_x >= 1)
            [ localBoard, colH_R ] = diagonalUpdateUpRight(globalBoard, localBoard, agentTurn, agent{1, 3}, dummy_x, dummy_y, colH_R);
            [ localBoard, colH_L ] = diagnolUpdateUpLeft(globalBoard, localBoard, agentTurn, agent{1, 3}, dummy_x, dummy_y, colH_L);

            localBoard(dummy_x, dummy_y) = globalBoard(dummy_x, dummy_y);
            dummy_x = dummy_x - 1;
            if dummy_x == 0
                break;
            end
            if globalBoard(dummy_x, dummy_y) ~= 0
                localBoard(dummy_x, dummy_y) = globalBoard(dummy_x, dummy_y);
                break;
            end
        end
    end    
colH_R = -1;
colH_L = -1;
    if agent{1, 3} == 2
        while(dummy_x <= 15)
            [ localBoard, colH_R ] = diagnolUpdateDownLeft(globalBoard, localBoard, agentTurn, agent{1, 3}, dummy_x, dummy_y, colH_R);
            [ localBoard, colH_L ] = diagnolUpdateDownRight(globalBoard, localBoard, agentTurn, agent{1, 3}, dummy_x, dummy_y, colH_L);

            localBoard(dummy_x, dummy_y) = globalBoard(dummy_x, dummy_y);
            dummy_x = dummy_x + 1;
            if dummy_x == 16
                break;
            end

            if globalBoard(dummy_x, dummy_y) ~= 0
                localBoard(dummy_x, dummy_y) = globalBoard(dummy_x, dummy_y);
                break;
            end
        end
    end

    if agent{1, 3} == 3
        while(dummy_y >= 1)
            [ localBoard, colH_R ] = diagnolUpdateUpLeft(globalBoard, localBoard, agentTurn, agent{1, 3}, dummy_x, dummy_y, colH_R);
            [ localBoard, colH_L ] = diagnolUpdateDownLeft(globalBoard, localBoard, agentTurn, agent{1, 3}, dummy_x, dummy_y, colH_L);

            localBoard(dummy_x, dummy_y) = globalBoard(dummy_x, dummy_y);
            dummy_y = dummy_y - 1;
            if dummy_y == 0
                break;
            end

            if globalBoard(dummy_x, dummy_y) ~= 0
                localBoard(dummy_x, dummy_y) = globalBoard(dummy_x, dummy_y);
                break;
            end
        end
    end   
    

    if agent{1, 3} == 4
        while(dummy_y <= 15)
            [ localBoard, colH_R ] =  diagonalUpdateUpRight(globalBoard, localBoard, agentTurn, agent{1, 3}, dummy_x, dummy_y, colH_R);
            [ localBoard, colH_L ] = diagnolUpdateDownRight(globalBoard, localBoard, agentTurn, agent{1, 3}, dummy_x, dummy_y, colH_L);

            localBoard(dummy_x, dummy_y) = globalBoard(dummy_x, dummy_y);
            dummy_y = dummy_y + 1;
            if dummy_y == 16
                break;
            end

            if globalBoard(dummy_x, dummy_y) ~= 0
                localBoard(dummy_x, dummy_y) = globalBoard(dummy_x, dummy_y);
                break;
            end
        end
    end
    
end

