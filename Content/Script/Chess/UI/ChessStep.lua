

local M = {}

local ChessBorad = {
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,
    0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,
    0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,
    0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,
    0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,
    0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,
    0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,
    0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,
    0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,
    0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
}

local ChessStartBorad = {
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,5,4,3,2,1,2,3,4,5,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,6,0,0,0,0,0,6,0,0,0,0,0,
    0,0,0,7,0,7,0,7,0,7,0,7,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,14,0,14,0,14,0,14,0,14,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,13,0,0,0,0,0,0,0,0,0,13,0,
    0,0,0,12,11,10,9,8,9,10,11,12,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
}

local BossBorad = {
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,
    0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,
    0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,
    0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,
    0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
}

local CheesType = {
    -- 
    ["Jiang"] = 1,
    ["shi"] = 2,
    ["xiang"] =3,
    ["ma"] = 4,
    ["jun"] = 5,
    ["pao"] = 6,
    ["zu"] = 7,

    ["shuai"] = 8,
    ["shi"] = 9,
    ["xiang"] =10,
    ["ma"] = 11,
    ["jun"] = 12,
    ["pao"] = 13,
    ["zu"] = 14,
}

local Dirc = {
    {X = 1, Y = 0},
    {X = -1, Y = 0},
    {X = 0, Y = -1},
    {X = 0, Y = 1},
}

local ShiDirc = {
    {X = 1, Y = 1},
    {X = -1, Y = 1},
    {X = 1, Y = -1},
    {X = -1, Y = -1},
}

local MaDirc = {
    {X = 2, Y = 1},
    {X = 1, Y = 2},
    {X = -2, Y = 1},
    {X = -1, Y = 2},
    {X = 2, Y = -1},
    {X = 1, Y = -2},
    {X = -2, Y = -1},
    {X = -1, Y = -2},
}

local HafltMaDire = {
    {X = 1, Y = 0},
    {X = 0, Y = 1},
    {X = -1, Y = 0},
    {X = 0, Y = 1},
    {X = 1, Y = 0},
    {X = 0, Y = -1},
    {X = -1, Y = 0},
    {X = 0, Y = -1},
}

local zuDire = {
    {X = -1, Y = 0},
    {X = 1, Y = 0},
    {X = 0, Y = 1},
}


function M:GetPosXY(index)
    local X = index % 16 - 4
    local Y = math.floor(index / 16) - 3
    return {X = X, Y = Y}
end

function M:GetIndexByPos(Pos)
    local index = (Pos.X + 4) + (Pos.Y + 3) * 16
    return index
end

function M:GetIndexByXY(X, Y)
    local index = (X + 4) + (Y + 3) * 16
    return index
end

function M:CheckNative(CheesT, Y)
    if CheesT < 8 and (Y + 3) < 8 then
        return true
    elseif CheesT > 7 and (Y + 3) > 7 then
        return true
    end
    return false
end

function M:GetStepNext(borad, chessPos)
    local Pos = self:GetIndexByPos(chessPos)
    local ret
    local chessT = borad[Pos]
    if chessT % 7 == 1 then
        ret = self:BossNextSetp(borad, chessPos, chessT)
    elseif chessT % 7 == 2 then
        ret = self:ShiNextSetp(borad, chessPos, chessT)
    elseif chessT % 7 == 3 then
        ret = self:XiangNextSetp(borad, chessPos, chessT)
    elseif chessT % 7 == 4 then
        ret = self:MaNextSetp(borad, chessPos, chessT)
    elseif chessT % 7 == 0 then
        ret = self:ZuNextSetp(borad, chessPos, chessT)
    elseif chessT % 7 == 5 then
        ret = self:JunNextSetp(borad, chessPos, chessT)
    elseif chessT % 7 == 6 then
        ret = self:PaoNextSetp(borad, chessPos, chessT)
    end
    return ret
end

function M:BossNextSetp(borad, Pos, CheesT)
    local ret = {}
    local num = 1
    for i = 1, #Dirc do
        local X = Pos.X + Dirc[i].X
        local Y = Pos.Y + Dirc[i].Y
        if X >= 0 and X < 9 and Y >= 0 and Y < 10 then
            local NextSetp = self:GetIndexByXY(X, Y)
            if BossBorad[NextSetp] > 0 then
                if borad[NextSetp] > 0 and self:CheckSame(CheesT, borad[NextSetp]) then
                    ret[num] = {X = X, Y = Y}
                    num = num + 1
                elseif borad[NextSetp] == 0 then
                    ret[num] = {X = X, Y = Y}
                    num = num + 1
                end
            end
        end
    end
    local nextDire = 1
    if CheesT > 7 then
        nextDire = -1
    end

    for i = 1, 9 do
        local X = Pos.X
        local Y = Pos.Y + nextDire * i
        local NextSetp = self:GetIndexByXY(X, Y)
        if borad[NextSetp] > 0 then
            if borad[NextSetp] % 7 == 1 then
                ret[num] = {X = X, Y = Y}
            end
            break
        end
    end

    return ret
end

function M:ShiNextSetp(borad, Pos, CheesT)
    local ret = {}
    local num = 1
    for i = 1, #ShiDirc do
        local X = Pos.X + ShiDirc[i].X
        local Y = Pos.Y + ShiDirc[i].Y
        if X >= 0 and X < 9 and Y >= 0 and Y < 10 then
            local NextSetp = self:GetIndexByXY(X, Y)
            if BossBorad[NextSetp] > 0 then
                if borad[NextSetp] > 0 and self:CheckSame(CheesT, borad[NextSetp]) then
                    ret[num] = {X = X, Y = Y}
                    num = num + 1
                elseif borad[NextSetp] == 0 then
                    ret[num] = {X = X, Y = Y}
                    num = num + 1
                end
            end
        end
    end
    return ret
end

function M:XiangNextSetp(borad, Pos, CheesT)
    local ret = {}
    local num = 1
    for i = 1, #ShiDirc do
        local X = Pos.X + ShiDirc[i].X * 2
        local Y = Pos.Y + ShiDirc[i].Y * 2
        if X >= 0 and X < 9 and Y >= 0 and Y < 10 then
            local NextSetp = self:GetIndexByXY(X, Y)
            
            if ChessBorad[NextSetp] > 0 and self:CheckNative(CheesT, Y) then
                if borad[NextSetp] > 0 and self:CheckSame(CheesT, borad[NextSetp]) then
                    ret[num] = {X = X, Y = Y}
                    num = num + 1
                elseif borad[NextSetp] == 0 then
                    ret[num] = {X = X, Y = Y}
                    num = num + 1
                end
            end
        end
    end
    return ret
end

function M:MaNextSetp(borad, Pos, CheesT)
    local ret = {}
    local num = 1
    for i = 1, #MaDirc do
        local X = Pos.X + MaDirc[i].X
        local Y = Pos.Y + MaDirc[i].Y
        if X >= 0 and X < 9 and Y >= 0 and Y < 10 then
            local NextSetp = self:GetIndexByXY(X, Y)
            local CX = Pos.X + HafltMaDire[i].X
            local CY = Pos.Y + HafltMaDire[i].Y
            local CheckMa = self:GetIndexByXY(CX, CY)

            if ChessBorad[NextSetp] > 0 and borad[CheckMa] == 0 then
                if borad[NextSetp] > 0 and self:CheckSame(CheesT, borad[NextSetp]) then
                    ret[num] = {X = X, Y = Y}
                    num = num + 1
                elseif borad[NextSetp] == 0 then
                    ret[num] = {X = X, Y = Y}
                    num = num + 1
                end
            end
        end
    end
    return ret
end

function M:ZuNextSetp(borad, Pos, CheesT)
    local ret = {}
    local num = 1
    local mul = 1

    if CheesT > 7 then
        mul = -1
    end

    if self:CheckNative(CheesT, Pos.Y)  then
        local X = Pos.X 
        local Y = Pos.Y + mul
        if X >= 0 and X < 9 and Y >= 0 and Y < 10 then
            local NextSetp = self:GetIndexByXY(X, Y)
            if ChessBorad[NextSetp] > 0 then
                if borad[NextSetp] > 0 and self:CheckSame(CheesT, borad[NextSetp]) then
                    ret[num] = {X = X, Y = Y}
                    num = num + 1
                elseif borad[NextSetp] == 0 then
                    ret[num] = {X = X, Y = Y}
                    num = num + 1
                end
            end
        end
    else
        for i = 1, #zuDire do
            local X = Pos.X + zuDire[i].X
            local Y = Pos.Y + zuDire[i].Y * mul
            if X >= 0 and X < 9 and Y >= 0 and Y < 10 then
                local NextSetp = self:GetIndexByXY(X, Y)
                if ChessBorad[NextSetp] > 0 then
                    if borad[NextSetp] > 0 and self:CheckSame(CheesT, borad[NextSetp]) then
                        ret[num] = {X = X, Y = Y}
                        num = num + 1
                    elseif borad[NextSetp] == 0 then
                        ret[num] = {X = X, Y = Y}
                        num = num + 1
                    end
                end
            end
        end
    end
    return ret
end

function M:JunNextSetp(borad, Pos, CheesT)
    local ret = {}
    local num = 1
    for i = 1, #Dirc do
        for j = 1, 10 do
            local X = Pos.X + Dirc[i].X * j
            local Y = Pos.Y + Dirc[i].Y * j
            if X >= 0 and X < 9 and Y >= 0 and Y < 10 then
                local NextSetp = self:GetIndexByXY(X, Y)
                if ChessBorad[NextSetp] > 0 then
                    if borad[NextSetp] == 0 then
                        ret[num] = {X = X, Y = Y}
                        num = num + 1
                    elseif borad[NextSetp] > 0 then
                        if self:CheckSame(CheesT, borad[NextSetp]) then
                            ret[num] = {X = X, Y = Y}
                            num = num + 1
                        end
                        break
                    end
                else
                    break
                end
            end
        end 
    end
    return ret
end

function M:PaoNextSetp(borad, Pos, CheesT)
    local ret = {}
    local num = 1
    for i = 1, #Dirc do
        local tiao = false
        for j = 1, 10 do
            local X = Pos.X + Dirc[i].X * j
            local Y = Pos.Y + Dirc[i].Y * j
            if X >= 0 and X < 9 and Y >= 0 and Y < 10 then
                local NextSetp = self:GetIndexByXY(X, Y)
                if ChessBorad[NextSetp] > 0 then
                    if borad[NextSetp] == 0 then
                        if not tiao then
                            ret[num] = {X = X, Y = Y}
                            num = num + 1
                        end
                    elseif borad[NextSetp] > 0 then
                        if not tiao then
                            tiao = true
                        elseif self:CheckSame(CheesT, borad[NextSetp]) then
                            ret[num] = {X = X, Y = Y}
                            num = num + 1
                            break
                        else
                            break
                        end
                    end
                else
                    break
                end
            end
        end
    end
    return ret
end

function M:CheckSame(ChessT1,ChessT2)
    return (ChessT1 < 8) ~= (ChessT2 < 8)
end

return M
