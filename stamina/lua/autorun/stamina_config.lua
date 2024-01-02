FStamina = FStamina or {}
FStamina.maxStamina = 100
FStamina.staminaRegenRate = function(curStamina, ply)
    -- I made this a function incase u wanted to make it do something fancy idk
    --return curStamina * 1.2

    return 1 -- add 1 stamina per tick
end


-- I'll leave this here incase u want to use it
/* 
FStamina.staminaDecreaseRate = function(ply)
    if ply:IsVIP() then
        return 0.5
    end

    return 2
end
*/


