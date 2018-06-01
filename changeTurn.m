function nextTurn = changeTurn( turn )
    if turn == 11
        nextTurn = 22;
    elseif turn == 22;
            nextTurn = 33;
    elseif turn == 33;
            nextTurn = 44;
    else
        nextTurn = 11;
    end
end

