--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--

---@type WBP_ItemChessBtn_C
local M = UnLua.Class()

function M:Initialize(Initializer)
    -- 0 未使用 1 使用
    self.state = false
    self.isUsed = false
end

--function M:PreConstruct(IsDesignTime)
--end

function M:GetUsed()
    return self.isUsed
end

function M:SetUsed(flag)
    self.isUsed = flag
end

function M:Construct()
    self.Button_64.OnClicked:Add(self, self.ChessBtnClick)
end

function M:Destruct()
    self.Button_64.OnClicked:Clear()
end


--function M:Tick(MyGeometry, InDeltaTime)
--end

function M:SetChessType()
    
end

function M:InitChessState(data)
    self.TextBlock_52:SetText(data.Name)
    self.func = data.func
    self.obj = data.obj
    self.prame = data.prame
    if data.red then
        local color = UE.FLinearColor(1,0,0,1)
        local OutColor = UE.FSlateColor()
        OutColor.SpecifiedColor = color
        self.TextBlock_52:SetColorAndOpacity(OutColor)
    else
        local color = UE.FLinearColor(0,0,0,1)
        local OutColor = UE.FSlateColor()
        OutColor.SpecifiedColor = color
        self.TextBlock_52:SetColorAndOpacity(OutColor)
    end
end

function M:UpdatePrame(prame)
    self.prame = prame
end

function M:ChessBtnClick()
    if self.state and self.func then
        self.func(self.obj, self, self.prame)
    end
end

function M:ShowChess(flag)
    if flag then
        self.Button_64:SetVisibility(UE.ESlateVisibility.Visible)
        self.state = true
    else
        self.Button_64:SetVisibility(UE.ESlateVisibility.Collapsed)
        self.state = false
    end
end


return M
