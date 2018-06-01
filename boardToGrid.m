function grid = boardToGrid(globalBoard, p1, p2, p3, p4)
    [rows, cols] = size(globalBoard);
    size_rows = rows * 120;
    size_cols = cols * 120;
    
    %read images
    grid = imread('sandbk.jpg');
    if p1{1, 3} == 1
        turn1 = imread('tank blue up.png');
    elseif p1{1, 3} == 2
        turn1 = imread('tank blue down.png');        
    elseif p1{1, 3} == 3
        turn1 = imread('tank blue left.png');        
    elseif p1{1, 3} == 4
        turn1 = imread('tank blue right.png');                
    end
    
    if p2{1, 3} == 1
        turn2 = imread('tank yellow up.png');
    elseif p2{1, 3} == 2
        turn2 = imread('tank yellow down.png');        
    elseif p2{1, 3} == 3
        turn2 = imread('tank yellow left.png');        
    elseif p2{1, 3} == 4
        turn2 = imread('tank yellow right.png');                
    end
    
    if p3{1, 3} == 1
        turn3 = imread('tank red up.png');
    elseif p3{1, 3} == 2
        turn3 = imread('tank red down.png');        
    elseif p3{1, 3} == 3
        turn3 = imread('tank red left.png');        
    elseif p3{1, 3} == 4
        turn3 = imread('tank red right.png');                
    end
    
        
    if p4{1, 3} == 1
        turn4 = imread('tank grey up.png');
    elseif p4{1, 3} == 2
        turn4 = imread('tank grey down.png');        
    elseif p4{1, 3} == 3
        turn4 = imread('tank grey left.png');        
    elseif p4{1, 3} == 4
        turn4 = imread('tank grey right.png');                
    end
    %turn1 = imread('snail1.jpg');
    %turn2 = imread('snail2.jpg');
    %turn3 = imread('snail1.jpg');
    %turn4 = imread('snail2.jpg');
    %snail1_mark = imread('snail1_mark.jpg');
    %snail2_mark = imread('snail2_mark.jpg');
    %no_mark = imread('no_mark.jpg');
    hurdle = imread('rockImage.png');
    dead = imread('fire.png');
    
    %place icon of third player
    if p3{5} == true
        [ x, y ] = find(globalBoard == 33);
        x = (x * 100) - 100;
        y = (y * 100) - 100;
        if x == 0
            x = x + 1;
        end
        if y == 0
            y = y + 1;
        end

        %place icon
        grid(x:(x-1) + 100, y:y+100, :) = turn3(1:100, 1:101, :);
    end
    
    %place icon of fourth player
    if p4{5} == true
        [x, y] = find(globalBoard == 44);
        x = (x * 100) - 100;
        y = (y * 100) - 100;
        if x == 0
            x = x + 1;
        end
        if y == 0
            y = y + 1;
        end

        %place icon
        grid(x:(x-1) + 100, y:y+100, :) = turn4(1:100, 1:101, :);
    end
    
    %place icon of second player
    if p2{5} == true
        [x, y] = find(globalBoard == 22);
        x = (x * 100) - 100;
        y = (y * 100) - 100;
        if x == 0
            x = x + 1;
        end
        if y == 0
            y = y + 1;
        end

        %place icon
        grid(x:(x-1) + 100, y:y+100, :) = turn2(1:100, 1:101, :);
    end
    
    %place icon of first player
    if p1{5} == true
        [x, y] = find(globalBoard == 11);
        x = (x * 100) - 100;
        y = (y * 100) - 100;
        if x == 0
            x = x + 1;
        end
        if y == 0
            y = y + 1;
        end
        %place icon
        grid(x:(x-1) + 100, y:y+100, :) = turn1(1:100, 1:101, :);
    end
    
    %find marks of first players
    [ x, y ] = find(globalBoard == 111);
    [ numberOfMarks, dummy ] = size(x);
    %place marks on grid
    for i = 1:numberOfMarks
        x_Cord = x(i); y_Cord = y(i);
        x_Cord = (x_Cord * 100) - 100;
        y_Cord = (y_Cord * 100) - 100;
        if x_Cord == 0
            x_Cord = x_Cord + 1;
        end
        if y_Cord == 0
            y_Cord = y_Cord + 1;
        end
        %place icon
        grid(x_Cord:(x_Cord-1) + 100, y_Cord:y_Cord+100, :) = snail1_mark(1:100, 1:101, :);
    end
    
    %find marks of second players
    [ x, y ] = find(globalBoard == 222);
    [ numberOfMarks, dummy ] = size(x);
    %place marks on grid
    for i = 1:numberOfMarks
        x_Cord = x(i); y_Cord = y(i);
        x_Cord = (x_Cord * 100) - 100;
        y_Cord = (y_Cord * 100) - 100;
        if x_Cord == 0
            x_Cord = x_Cord + 1;
        end
        if y_Cord == 0
            y_Cord = y_Cord + 1;
        end
        %place icon
        grid(x_Cord:(x_Cord-1) + 100, y_Cord:y_Cord+100, :) = snail2_mark(1:100, 1:101, :);
    end
    
    %find marks of third player
    [ x, y ] = find(globalBoard == 333);
    [ numberOfMarks, dummy ] = size(x);
    %place marks on grid
    for i = 1:numberOfMarks
        x_Cord = x(i); y_Cord = y(i);
        x_Cord = (x_Cord * 100) - 100;
        y_Cord = (y_Cord * 100) - 100;
        if x_Cord == 0
            x_Cord = x_Cord + 1;
        end
        if y_Cord == 0
            y_Cord = y_Cord + 1;
        end
        %place icon
        grid(x_Cord:(x_Cord-1) + 100, y_Cord:y_Cord+100, :) = snail2_mark(1:100, 1:101, :);
    end
    
    %find marks of second players
    [ x, y ] = find(globalBoard == 444);
    [ numberOfMarks, dummy ] = size(x);
    %place marks on grid
    for i = 1:numberOfMarks
        x_Cord = x(i); y_Cord = y(i);
        x_Cord = (x_Cord * 100) - 100;
        y_Cord = (y_Cord * 100) - 100;
        if x_Cord == 0
            x_Cord = x_Cord + 1;
        end
        if y_Cord == 0
            y_Cord = y_Cord + 1;
        end
        %place icon
        grid(x_Cord:(x_Cord-1) + 100, y_Cord:y_Cord+100, :) = snail2_mark(1:100, 1:101, :);
    end
    
    % find place where no player can reach
    [ x, y ] = find(globalBoard == -1);
    [ numberOfMarks, dummy ] = size(x);
   
    %place marks on grid
    for i = 1:numberOfMarks
        x_Cord = x(i); y_Cord = y(i);
        x_Cord = (x_Cord * 100) - 100;
        y_Cord = (y_Cord * 100) - 100;
        if x_Cord == 0
            x_Cord = x_Cord + 1;
        end
        if y_Cord == 0
            y_Cord = y_Cord + 1;
        end
        %place icon
        grid(x_Cord:(x_Cord-1) + 100, y_Cord:y_Cord+100, :) = no_mark(1:100, 1:101, :);
    end
    
    %find marks of second players
    [ x, y ] = find(globalBoard == -2);
    [ numberOfMarks, dummy ] = size(x);
    %place marks on grid
    for i = 1:numberOfMarks
        x_Cord = x(i); y_Cord = y(i);
        x_Cord = (x_Cord * 100) - 100;
        y_Cord = (y_Cord * 100) - 100;
        if x_Cord == 0
            x_Cord = x_Cord + 1;
        end
        if y_Cord == 0
            y_Cord = y_Cord + 1;
        end
        %place icon
        grid(x_Cord:(x_Cord-1) + 100, y_Cord:y_Cord+100, :) = hurdle(1:100, 1:101, :);
    end
    
    [ x, y ] = find(globalBoard == -3);
    [ numberOfMarks, dummy ] = size(x);
    %place marks on grid
    for i = 1:numberOfMarks
        x_Cord = x(i); y_Cord = y(i);
        x_Cord = (x_Cord * 100) - 100;
        y_Cord = (y_Cord * 100) - 100;
        if x_Cord == 0
            x_Cord = x_Cord + 1;
        end
        if y_Cord == 0
            y_Cord = y_Cord + 1;
        end
        %place icon
        grid(x_Cord:(x_Cord-1) + 100, y_Cord:y_Cord+100, :) = dead(1:100, 1:101, :);
    end
    
    
    %draw lines or make globalBoard
    printLine = 100;
    for i = 1:rows-1
        %draw vertical lines
        printLineColumn = printLine * i;
        grid(:,  printLineColumn, :) = 0;
        grid(:, (printLineColumn+1), :) = 255;
        grid(:, (printLineColumn+2), :) = 255;
        grid(:, (printLineColumn+3), :) = 255;
        
        %draw horizontal lines
        printLineRow = printLine * i;
        grid(printLineRow, :, :) = 255;
        grid((printLineRow+1), :, :) = 255;
        grid((printLineRow+2), :, :) = 255;
        grid((printLineRow+3), :, :) = 255;
    end
end