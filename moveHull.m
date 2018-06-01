function newDirection = moveHull( hullDirection, movement )
    
    if movement == 5
        if hullDirection == 1
            newDirection = 4;
        elseif hullDirection == 2
            newDirection = 3;
        elseif hullDirection == 3
            newDirection = 1;
        else
            newDirection = 2;
        end
    else
        if hullDirection == 1
            newDirection = 3;
        elseif hullDirection == 2
            newDirection = 4;
        elseif hullDirection == 3
            newDirection = 2;
        else
            newDirection = 1;
        end
    end
end

