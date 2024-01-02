FStamina = FStamina or {}
FStamina.maxStamina = 100
FStamina.staminaRegenRate = function(curStamina, ply)
    -- I made this a function incase u wanted to make it do something fancy idk
    --return curStamina * 1.2

    return 1 -- add 1 stamina per tick
end


-- Want to make VIP's take less stamina when running? use this below!
/* 
FStamina.staminaDecreaseRate = function(ply)
    if ply:IsVIP() then
        return 0.5
    end

    return 2
end
*/


