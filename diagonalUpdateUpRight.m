function [ localBoard, colH ] = diagnolUpdateUpRight(globalBoard, localBoard, agentTurn, agentDirection, x, y, colH)

    if agentDirection == 1
        while(x >= 1 && y <= 15)
            if (( globalBoard(x, y) == 0 || globalBoard(x, y) == agentTurn ) && y ~= colH )
               localBoard(x, y) = globalBoard(x, y); 
            else
                localBoard(x, y) = globalBoard(x, y);
                colH = y;
                break;
            end

            x = x - 1;
            y = y + 1;
        end
    end
    
    if agentDirection == 4
        while(x >= 1 && y <= 15)
            if (( globalBoard(x, y) == 0 || globalBoard(x, y) == agentTurn ) && x ~= colH )
               localBoard(x, y) = globalBoard(x, y); 
            else
                localBoard(x, y) = globalBoard(x, y);
                colH = x;
                break;
            end

            x = x - 1;
            y = y + 1;
        end
    end    
end
    