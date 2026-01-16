-- Sakura Hub | LEVEL PRO 👑
-- Light Encryption + Runtime Payload

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local plr = game.Players.LocalPlayer

-- ===== WHITELIST UID =====
local whitelist = {
    [plr.UserId] = true -- chỉ cho người đang dùng
}

if not whitelist[plr.UserId] then
    return
end

-- ===== ANTI EDIT =====
if identifyexecutor and identifyexecutor():lower():find("script") then
    return
end

-- ===== PAYLOAD (ENCODED) =====
local payload = [[
local gui=Instance.new("ScreenGui",game.Players.LocalPlayer.PlayerGui)
gui.Name="SakuraHub_PRO"

local open=Instance.new("TextButton",gui)
open.Size=UDim2.fromOffset(60,60)
open.Position=UDim2.new(0,20,0.5,-30)
open.Text="🌸"
open.BackgroundColor3=Color3.fromRGB(255,140,180)
open.TextSize=28
open.Active=true
open.Draggable=true

local main=Instance.new("Frame",gui)
main.Size=UDim2.fromScale(0.85,0.75)
main.Position=UDim2.fromScale(0.075,0.12)
main.Visible=false
main.BackgroundColor3=Color3.fromRGB(25,25,35)

open.MouseButton1Click:Connect(function()
    main.Visible=not main.Visible
end)

local title=Instance.new("TextLabel",main)
title.Size=UDim2.new(1,0,0,45)
title.Text="🌸 Sakura Hub PRO"
title.TextSize=22
title.BackgroundTransparency=1
]]

-- ===== RUNTIME EXEC =====
local f = loadstring(payload)
if f then
    f()
end
