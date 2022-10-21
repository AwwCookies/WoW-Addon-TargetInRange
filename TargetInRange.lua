local TargetInRangeFrame = CreateFrame("frame", "TargetInRangeFrame")
local TIRString = TargetInRangeFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")

TargetInRangeFrame:SetScript("OnUpdate", function()
    if (UnitExists("target")) then
        local nameplate = C_NamePlate.GetNamePlateForUnit("target")
        if (nameplate == nil) then
            TIRString:Hide()
            return
        end
        TIRString:SetPoint("CENTER", nameplate, "TOP", 0, 0)
        if (IsActionInRange(1)) then
            TIRString:SetTextColor(0, 255, 0, 1)
            TIRString:SetText("In Range")
        else
            TIRString:SetTextColor(255, 0, 0, 0.5)
            TIRString:SetText("Out of Range")
        end
        TIRString:Show()
    else
        TIRString:SetText("No Target")
        TIRString:Hide()
    end
end)