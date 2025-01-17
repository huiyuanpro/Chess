
--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--

local ChessHelper = require "Chess.UI.ChessStep"

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
    0,0,0,0,13,0,0,0,0,0,13,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,12,11,10,9,8,9,10,11,12,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
}

local TypeName = {
    [1] = "将",
    [2] = "仕",
    [3] = "象",
    [4] = "马",
    [5] = "军",
    [6] = "炮",
    [7] = "卒",
    [8] = "帅",
    [9] = "士",
    [10] = "相",
    [11] = "马",
    [12] = "军",
    [13] = "炮",
    [14] = "兵",
}


---@type WBP_ChessMainView_C
local M = UnLua.Class()

function M:Initialize(Initializer)
    --self.GcChessItem = {}
    self.MapPos = {}
    self.nextStep = {}
    self.NowSelectItem = nil
    self.red = true
    self.ChessNum = 1
    --self.MaxIndex = 0
end

--function M:PreConstruct(IsDesignTime)
--end

function M:Construct()
    self:CreateChessItem(35)
    self.ChessNum = 1
    self:GetStartChess()
    self:ShowBorad()
    self:CreateChessStep(20)
end

--function M:Tick(MyGeometry, InDeltaTime)
--end

function M:Destruct()

end

function M:GetStartChess()
    self.borad = {}
    for i = 1, #ChessStartBorad do
        self.borad[i] = ChessStartBorad[i]
    end
end

function M:GetRelPosByXY(X, Y)
    if not self.LUPos then
        self.LUPos = self.Image_LU.Slot:GetPosition()
        self.RDPos = self.Image_RD.Slot:GetPosition()
    end
    local PosX = (self.RDPos.Y - self.LUPos.Y) / 9 * Y + self.LUPos.Y
    local PosY = (self.RDPos.X - self.LUPos.X) / 8 * X + self.LUPos.X
    return {X = PosX, Y = PosY}
end

function M:ShowBorad()
    self.MapPos = {}
    for i = 1, #self.borad do
        if self.borad [i] > 0 then
            local itemWidget = self:GetChessItem()
            local pos = ChessHelper:GetPosXY(i)
            local relPos = self:GetRelPosByXY(pos.X, pos.Y)

            itemWidget.Slot:SetPosition(UE.FVector2D(relPos.Y,relPos.X))
            itemWidget:ShowChess(true)
            local Prame = {
                chessType = self.borad[i],
                X = pos.X,
                Y = pos.Y,
                red = (self.borad[i] > 7),
            }
            itemWidget:InitChessState({Name = TypeName[self.borad[i]], obj = self, func = self.HandleItemClick, prame = Prame, red = (self.borad[i] > 7)})
            if not self.MapPos[pos.X] then
                self.MapPos[pos.X] = {}
            end
            self.MapPos[pos.X][pos.Y] = itemWidget
        end
    end
end

function M:HandleItemClick(item, Prame)
    if self.red == Prame.red then
        self:ClearNextStep()
        self.NowSelectItem = item
        self.SelectPos = Prame
        local ret = ChessHelper:GetStepNext(self.borad, Prame)
        self:ShowNextStep(ret)
    end
end

function M:GetChessItem()
    local item = self.ChessItemCache:Get(self.ChessNum)
    item:SetUsed(true)
    self.ChessNum = self.ChessNum + 1
    return item
end

function M:HuishouChessItem(item)
    item:SetUsed(false)
    item:ShowChess(false)

end

function M:ShowNextStep(ret)
    local stp = 2
    for k, v in pairs(ret) do
        local relPos = self:GetRelPosByXY(v.X, v.Y)
        local itemWidget = self.StepCache:Get(stp)
        itemWidget.Slot:SetPosition(UE.FVector2D(relPos.Y,relPos.X))
        itemWidget:SetStepClick(self.StepClick, self, v)
        itemWidget:ShowStep(true)
        self.nextStep[stp] = itemWidget
        stp = stp + 1
    end
end

function M:StepClick(item, Pos)
    if self.NowSelectItem and self.NowSelectItem ~= item then
        local itemWidget = item
        if itemWidget.isUsed then
            self:HuishouChessItem(itemWidget)
        else
            local chessItem = self.MapPos[Pos.X][Pos.Y]
            if chessItem then
                self:HuishouChessItem(chessItem)
            end
        end

        self:ShowLastStep(self.SelectPos)

        local tarIndex = ChessHelper:GetIndexByPos(Pos)
        local itemWidgetFrom = self.NowSelectItem
        local fromIndex = ChessHelper:GetIndexByPos(self.SelectPos)
        self.borad[tarIndex] = self.borad[fromIndex]
        self.borad[fromIndex] = 0
        self:MoveToTarIndex(tarIndex, itemWidgetFrom, self.SelectPos, Pos)
        self.red = not self.red
        self.NowSelectItem = nil
        self:ClearNextStep()
    end
end

function M:MoveToTarIndex(tarIndex, item, Pos, tarPos)
    self.MapPos[Pos.X][Pos.Y] = nil
    local relPos = self:GetRelPosByXY(tarPos.X, tarPos.Y)
    item.Slot:SetPosition(UE.FVector2D(relPos.Y,relPos.X))
    local Prame = {
        chessType = self.borad[tarIndex],
        X = tarPos.X,
        Y = tarPos.Y,
        red = (self.borad[tarIndex] > 7),
    }
    item:UpdatePrame(Prame)
    self.MapPos[tarPos.X][tarPos.Y] = item
end

function M:ClearNextStep()
    for k, v in pairs(self.nextStep) do
        v:ShowStep(false)
    end
    self.nextStep = {}
end

function M:ShowLastStep(Pos, isRed)
    local itemWidget = self.StepCache:Get(1)
    local relPos = self:GetRelPosByXY(Pos.X, Pos.Y)
    itemWidget.Slot:SetPosition(UE.FVector2D(relPos.Y,relPos.X))
    itemWidget:ShowLastStep(true, self.red)
end

return M
