function globalBoard = placeRocks(globalBoard)


    hurdle = imread('hurdle.jpg');
    rocksId = -2;
    rocksArray = [[8,1];[8,2];[8,3];[1,8];[2,8];[3,8];[8,15];[8,14];[8,13];[15,8];[14,8];[13,8];
                  [12,4];[11,4];[12,5];[4,4];[4,5];[5,4];[4,12];[4,11];[5,12];[12,12];[11,12];[12,11];
                  [8,6];[8,8];[8,10];[6,8];[10,8]];
    
    sizeMat = size(rocksArray);
    sizeofRocks = sizeMat(1);
    
    
    for i=1:sizeofRocks
    
        row = rocksArray(i,1);
        col = rocksArray(i,2);
    globalBoard(row,col) = rocksId;
    %grid((row*35)-34:row*35, (col*35)-34:col*35,:) = icon ;
    %grid((row*35)-33:row*35-1, (col*35)-33:col*35-1,:) = hurdle ;
    %grid(row:(row-1) + 100, col:col+100, :) = hurdle(1:100, 1:101, :);
        
    end
    
    %globalBoard = updateGlobalBoard(rocksId,row, col, globalBoard);
    
    %grid((row*35)-34:row*35, (col*35)-34:col*35,:) = icon ;
    
end