function [ player, p2, p3, p4, globalBoard ]= makeLegalMove( globalBoard, move, player, p2, p3, p4)
    
    
    [ x, y ] = find(globalBoard == player{1});
    if player{1} == 11
        myMark = 111;
    elseif player{1} == 22
        myMark = 222;
    elseif player{1} == 33
        myMark = 333;
    else
        myMark = 444;
    end

    % up movement
    if ( move == 1 && (x - 1) >= 1 && globalBoard( x - 1, y ) == 0 )
        globalBoard( x - 1, y ) = player{1};
        globalBoard( x, y ) = 0;
        if player{2}( x - 1, y ) ~= myMark
            player{4} = player{4} + 10;
        end
        player{2}( x - 1, y ) = player{1};
        player{2}( x, y ) = myMark;
        
    % down movement
    elseif ( move == 2 && (x + 1) <= 15 &&  globalBoard( x + 1, y ) == 0 )
       globalBoard( x + 1, y ) = player{1};
        globalBoard( x, y ) = 0;
        if player{2}( x + 1, y ) ~= myMark
            player{4} = player{4} + 10;
        end
        player{2}( x + 1, y ) = player{1};
        player{2}( x, y ) = myMark;

    % right movement
    elseif ( move == 3 && (y + 1) <= 15 && globalBoard( x, y + 1 ) ==  0 )
        globalBoard( x, y + 1 ) = player{1};
        globalBoard( x, y ) = 0;
        if player{2}( x, y + 1 ) ~= myMark
            player{4} = player{4} + 10;
        end
        player{2}( x, y + 1 ) = player{1};
        player{2}( x, y ) = myMark;
        
     % left movement
    elseif ( move == 4 && (y - 1) >= 1 && globalBoard( x, y - 1 ) == 0 ) 
        globalBoard( x, y - 1 ) = player{1};
        globalBoard( x, y ) = 0;
        if player{2}( x, y - 1 ) ~= myMark
            player{4} = player{4} + 10;
        end
        player{2}( x, y - 1 ) = player{1};
        player{2}( x, y ) = myMark;
        
    % fire movement
    elseif ( move == 7 )
        % fire in up direction 
        if player{3} == 1
            x = x - 1;
            while (x >= 1)
                if globalBoard( x, y ) ~= 0
                   if globalBoard( x, y ) == -2
                      break;
                   else
                       mark = globalBoard( x, y );
                       globalBoard( x, y ) = -3;
                       player{4} = player{4} + 50;
                       
                       if p2{1} == mark
                          p2{5} = false;
                       elseif p3{1} == mark
                           p3{5} = false;
                       elseif p4{1} == mark
                           p4{5} = false;
                       end
                   end
                end
                x = x - 1;
            end
         % fire in downward direction
        elseif player{3} == 2
            x = x + 1;
            while (x <= 15)
                if globalBoard( x, y ) ~= 0
                   if globalBoard( x, y ) == -2
                      break;
                   else
                       mark = globalBoard( x, y );
                       globalBoard( x, y ) = -3;
                       player{4} = player{4} + 50;
                       
                       if p2{1} == mark
                          p2{5} = false;
                       elseif p3{1} == mark
                           p3{5} = false;
                       elseif p4{1} == mark
                           p4{5} = false;
                       end
                   end
                end
                x = x + 1;
            end
         % fire in left directoin
        elseif player{3} == 3
            y = y - 1;
            while (y >= 1)
                if globalBoard( x, y ) ~= 0
                   if globalBoard( x, y ) == -2
                      break;
                   else
                       mark = globalBoard( x, y );
                       globalBoard( x, y ) = -3;
                       player{4} = player{4} + 50;
                       
                       if p2{1} == mark
                          p2{5} = false;
                       elseif p3{1} == mark
                           p3{5} = false;
                       elseif p4{1} == mark
                           p4{5} = false;
                       end
                   end
                end
                y = y - 1;
            end
         % fire in right direction
        elseif player{3} == 4
            y = y + 1;
            while (y <= 15)
                if globalBoard( x, y ) ~= 0
                   if globalBoard( x, y ) == -2
                      break;
                   else
                       mark = globalBoard( x, y );
                       globalBoard( x, y ) = -3;
                       player{4} = player{4} + 50;
                       
                       if p2{1} == mark
                          p2{5} = false;
                       elseif p3{1} == mark
                           p3{5} = false;
                       elseif p4{1} == mark
                           p4{5} = false;
                       end 
                   end
                end
                y = y + 1;
            end
        end
    % turn left or right 
    else
        player{3} = moveHull(player{3}, move);
    end
end
