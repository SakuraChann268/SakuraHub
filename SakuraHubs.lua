-- 🌸 Sakura Hub | Stable Mobile + PC | Delta OK 🌸

local Players = game:GetService("Players")
local plr = Players.LocalPlayer

-- Clean old
pcall(function()
    plr.PlayerGui:FindFirstChild("SakuraHub"):Destroy()
end)

-- GUI
local gui = Instance.new("ScreenGui", plr.PlayerGui)
gui.Name = "SakuraHub"
gui.ResetOnSpawn = false

-- Sound
local function sound(id)
    local s = Instance.new("Sound", gui)
    s.SoundId = "rbxassetid://"..id
    s.Volume = 1
    s:Play()
    game.Debris:AddItem(s,2)
end

-- Toggle Button 🌸
local open = false
local toggle = Instance.new("TextButton", gui)
toggle.Size = UDim2.fromOffset(56,56)
toggle.Position = UDim2.new(0,20,0.5,-30)
toggle.Text = "🌸"
toggle.TextSize = 26
toggle.BackgroundColor3 = Color3.fromRGB(255,150,200)
toggle.TextColor3 = Color3.new(1,1,1)
toggle.BorderSizePixel = 0
toggle.Active = true
toggle.Draggable = true
toggle.ZIndex = 10

-- Main
local main = Instance.new("Frame", gui)
main.Size = UDim2.fromScale(0.85,0.75)
main.Position = UDim2.fromScale(0.075,0.12)
main.BackgroundColor3 = Color3.fromRGB(255,220,235)
main.BorderSizePixel = 0
main.Visible = false
main.Active = true
main.Draggable = true

toggle.MouseButton1Click:Connect(function()
    open = not open
    main.Visible = open
    sound(9118823106)
end)

-- Title
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1,0,0,40)
title.Text = "🌸 Sakura Hub 🌸"
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(255,120,160)
title.BackgroundTransparency = 1

-- Tabs
local tabNames = {
    "Information",
    "TSB Menu",
    "TSB Hubs",
    "Tech",
    "Fix Lag",
    "Misc"
}

local tabBar = Instance.new("Frame", main)
tabBar.Position = UDim2.new(0,0,0,40)
tabBar.Size = UDim2.new(1,0,0,40)
tabBar.BackgroundTransparency = 1

local pages = Instance.new("Folder", main)
local pageMap = {}

local function newPage(name)
    local sf = Instance.new("ScrollingFrame", pages)
    sf.Name = name
    sf.Position = UDim2.new(0,0,0,80)
    sf.Size = UDim2.new(1,0,1,-80)
    sf.ScrollBarThickness = 6
    sf.CanvasSize = UDim2.new(0,0,0,0)
    sf.Visible = false

    local layout = Instance.new("UIListLayout", sf)
    layout.Padding = UDim.new(0,6)
    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        sf.CanvasSize = UDim2.new(0,0,0,layout.AbsoluteContentSize.Y+10)
    end)

    return sf
end

for _,t in ipairs(tabNames) do
    pageMap[t] = newPage(t)
end
pageMap["Information"].Visible = true

-- Tab buttons
for i,t in ipairs(tabNames) do
    local b = Instance.new("TextButton", tabBar)
    b.Size = UDim2.new(1/#tabNames,0,1,0)
    b.Position = UDim2.new((i-1)/#tabNames,0,0,0)
    b.Text = t
    b.TextSize = 12
    b.BackgroundColor3 = Color3.fromRGB(255,180,210)
    b.TextColor3 = Color3.new(1,1,1)
    b.BorderSizePixel = 0
    b.MouseButton1Click:Connect(function()
        for _,p in pairs(pageMap) do p.Visible=false end
        pageMap[t].Visible=true
        sound(9118823106)
    end)
end

-- Button helper
local function addBtn(page,text,cb)
    local b = Instance.new("TextButton", page)
    b.Size = UDim2.new(1,-10,0,40)
    b.Text = text
    b.TextSize = 14
    b.BackgroundColor3 = Color3.fromRGB(255,160,200)
    b.TextColor3 = Color3.new(1,1,1)
    b.BorderSizePixel = 0
    b.MouseButton1Click:Connect(function()
        sound(9118823106)
        cb()
    end)
end

-- INFORMATION
addBtn(pageMap["Information"],"👤 User: "..plr.Name,function() end)

-- TSB MENU
addBtn(pageMap["TSB Menu"],"Auto Block",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/dinhthanhtuankiet1762009-sudo/Js/refs/heads/main/93f2600e64c1a112.lua"))()
end)

addBtn(pageMap["TSB Menu"],"Side Dash",function()
    loadstring(game:HttpGet("https://api.getpolsec.com/scripts/hosted/23bcf4264b586dc93b16a9b054eddae259938b7421ac5096353079b2e9d74e24.lua"))()
end)

addBtn(pageMap["TSB Menu"],"Back Dash Cancel",function()
    loadstring(game:HttpGet("https://pastefy.app/3L4QZJ9r/raw"))()
end)

-- TSB HUBS
addBtn(pageMap["TSB Hubs"],"Phantasm Hub",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/PhantasmHub/Phantasm/main/Main.lua"))()
end)

addBtn(pageMap["TSB Hubs"],"Dovi Hub",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/DoviHub/Dovi/main/Main.lua"))()
end)

addBtn(pageMap["TSB Hubs"],"Lunar Hub",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LunarHub/Lunar/main/Main.lua"))()
end)

addBtn(pageMap["TSB Hubs"],"Speed Hub X",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/SpeedHubX/Speed/main/Main.lua"))()
end)

-- TECH
addBtn(pageMap["Tech"],"Supa v2",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/SupaHub/SupaV2/main/Main.lua"))()
end)

addBtn(pageMap["Tech"],"Supa v3 (Key)",function()
    loadstring(game:HttpGet("https://api.getpolsec.com/scripts/hosted/ea0b7cbd8c395e01ec38271794b2559808d26501bd6e6e30c48660759a7db7b3.lua"))()
end)

addBtn(pageMap["Tech"],"MereQ (Key)",function()
    loadstring(game:HttpGet("https://pastefy.app/MereQ/raw"))()
end)

-- FIX LAG
addBtn(pageMap["Fix Lag"],"Anti Lag",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/louismich4el/ItsLouisPlayz-Scripts/refs/heads/main/Anti%20Lag%20V2.lua"))()
end)

-- MISC
addBtn(pageMap["Misc"],"Jerk 🐿️",function()
    loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))()
end)
