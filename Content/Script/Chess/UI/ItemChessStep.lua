
--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--

---@type WBP_ItemChessStep_C
local M = UnLua.Class()

--function M:Initialize(Initializer)
--end

--function M:PreConstruct(IsDesignTime)
--end

function M:Construct()
    self.Button_66.OnClicked:Add(self, self.ChessStepClick)

end

function M:Destruct()
    self.Button_66.OnClicked:Clear()
end


--function M:Tick(MyGeometry, InDeltaTime)
--end

function M:SetStepClick(func, obj, Pos)
    self.StepClick = func
    self.obj = obj
    self.stepPos = Pos
end

function M:ChessStepClick()
    if self.StepClick then
        self.StepClick(self.obj, self, self.stepPos)
    end
end

function M:ShowStep(flag)
    if flag then
        self.Button_66:SetVisibility(UE.ESlateVisibility.Visible)
    else
        self.Button_66:SetVisibility(UE.ESlateVisibility.Collapsed)
    end
end

function M:ShowLastStep(flag, red)
    if flag then
        if red then
            self.Image_from:SetVisibility(UE.ESlateVisibility.Visible)
            self.Image_fromB:SetVisibility(UE.ESlateVisibility.Collapsed)    
        else
            self.Image_from:SetVisibility(UE.ESlateVisibility.Collapsed)
            self.Image_fromB:SetVisibility(UE.ESlateVisibility.Visible)    
        end
    else
        self.Image_from:SetVisibility(UE.ESlateVisibility.Collapsed)
        self.Image_fromB:SetVisibility(UE.ESlateVisibility.Collapsed)        
    end
end


return M
