function [ localBoard, colH ] = diagnolUpdateDownLeft(globalBoard, localBoard, agentTurn, agentDirection, x, y, colH)
 
    if agentDirection == 2
        while(x <= 15 && y >= 1)
            if (( globalBoard(x, y) == 0 || globalBoard(x, y) == agentTurn ) && y ~= colH)
                localBoard(x, y) = globalBoard(x, y);
            else
                localBoard(x, y) = globalBoard(x, y);
                colH = y;
                break;
            end

            x = x + 1;
            y = y - 1;
        end
    end
    
    
     if agentDirection == 3
        while(x <= 15 && y >= 1)
            if (( globalBoard(x, y) == 0 || globalBoard(x, y) == agentTurn ) && x ~= colH)
                localBoard(x, y) = globalBoard(x, y);
            else
                localBoard(x, y) = globalBoard(x, y);
                colH = x;
                break;
            end

            x = x + 1;
            y = y - 1;
        end
    end
end
    