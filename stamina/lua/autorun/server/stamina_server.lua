local function InitializeStamina(ply)
    ply:SetNWInt("Stamina", FStamina.maxStamina)
end

hook.Add("PlayerSpawn", "InitializeStamina", InitializeStamina)

local function UpdateStamina()
    for k, ply in ipairs(player.GetAll()) do
        local stamina = ply:GetNWInt("Stamina", FStamina.maxStamina)

        if ply:KeyDown(IN_SPEED) and stamina > 0 then
            stamina = math.Clamp(stamina - FStamina.staminaDecreaseRate(ply), 0, FStamina.maxStamina)
        else
            stamina = math.Clamp(stamina + FStamina.staminaRegenRate(stamina, ply), 0, FStamina.maxStamina)
        end

        ply:SetNWInt("Stamina", stamina)
    end
end
hook.Add("Think", "UpdateStamina", UpdateStamina)

local function CanSprint(ply)
    local stamina = ply:GetNWInt("Stamina", FStamina.maxStamina)

    return ply:KeyDown(IN_SPEED) and stamina > 0
end
hook.Add("PlayerCanSprint", "CanSprint", CanSprint)

local function ModifySprintSpeed(ply, mv)
    if CanSprint(ply) then
        mv:SetMaxClientSpeed(mv:GetMaxClientSpeed() * 1.5)
    end
end
hook.Add("SetupMove", "ModifySprintSpeed", ModifySprintSpeed)