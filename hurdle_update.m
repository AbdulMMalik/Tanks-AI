function board = hurdle_update(board,i,j,x,y)


    ti = i
    tj = j
    while (ti+x>=1 && ti+x <=15 )
        ti = ti+x;
       board(ti,j) =-2;
    end
    while (tj+y>=1 && tj+y <=15 )
        tj = tj+y;
       board(i,tj) =-2;
    end
    
end