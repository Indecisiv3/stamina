local StaminaPanel
hook.Add("HUDPaint", "DrawStaminaBar", function()
    local ply = LocalPlayer()
    local stamina = ply:GetNWInt("Stamina", 0)
    local isStaminaFull = stamina == FStamina.maxStamina

    if IsValid(StaminaPanel) then
        if isStaminaFull then
            StaminaPanel:Remove()
            StaminaPanel = nil
        end
    else
        if not isStaminaFull then
            StaminaPanel = vgui.Create("jlib.Panel")
            StaminaPanel:SetSize(300, 40) 
            StaminaPanel:SetPos(ScrW() / 2 - StaminaPanel:GetWide() / 2, ScrH() - StaminaPanel:GetTall() - 10) 
            StaminaPanel:SetBackgroundColor(Color(0, 0, 0, 200))
            StaminaPanel:SetRounding(4)

            StaminaPanel.progressBar = vgui.Create("jlib.Panel", StaminaPanel)
            StaminaPanel.progressBar:SetSize(0, StaminaPanel:GetTall()) 
            StaminaPanel.progressBar:SetPos(0, 0) 
            StaminaPanel.progressBar:SetBackgroundColor(Color(250, 255, 91, 200))
            StaminaPanel.progressBar:SetRounding(4)
        end
    end

    if IsValid(StaminaPanel) then
        StaminaPanel.progressBar:SetSize(StaminaPanel:GetWide() * (stamina / FStamina.maxStamina), StaminaPanel:GetTall())
    end
end)

hook.Add("InitPostEntity", "RemoveStaminaPanel", function()
    if IsValid(StaminaPanel) then
        StaminaPanel:Remove()
    end
end)


