function NMoves = simChinczyk(maxPos)
    freeMove = 0;
    Position = 0;
    NMoves = 0;
    while Position < maxPos
    
        Dice = randi([1, 6], 1);

        if ~freeMove
            NMoves = NMoves + 1;
        end

        if Dice == 6
            freeMove = 1;
        else
            freeMove = 0;
        end
    
        Position = Position + Dice;
    
    end
end