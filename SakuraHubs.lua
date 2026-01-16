-- 🌙 Sakura Hub | UI PRO Lunar Sidebar
-- Delta / Mobile Safe

local plr = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", plr.PlayerGui)
gui.Name = "SakuraHub"
gui.ResetOnSpawn = false

-- ===== SOUND =====
local function clickSound()
    local s = Instance.new("Sound", gui)
    s.SoundId = "rbxassetid://9118823106"
    s.Volume = 0.8
    s:Play()
    game.Debris:AddItem(s,2)
end

-- ===== TOGGLE BUTTON =====
local open = false
local toggle = Instance.new("TextButton", gui)
toggle.Size = UDim2.fromOffset(55,55)
toggle.Position = UDim2.new(0,15,0.5,-30)
toggle.Text = "🌙"
toggle.TextSize = 26
toggle.BackgroundColor3 = Color3.fromRGB(170,120,255)
toggle.TextColor3 = Color3.new(1,1,1)
toggle.BorderSizePixel = 0
toggle.Active = true
toggle.Draggable = true
toggle.ZIndex = 10

-- ===== MAIN =====
local main = Instance.new("Frame", gui)
main.Size = UDim2.fromScale(0.9,0.8)
main.Position = UDim2.fromScale(0.05,0.1)
main.BackgroundColor3 = Color3.fromRGB(20,20,30)
main.Visible = false
main.BorderSizePixel = 0

toggle.MouseButton1Click:Connect(function()
    open = not open
    main.Visible = open
    clickSound()
end)

-- ===== TITLE =====
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1,0,0,45)
title.Text = "🌸 Sakura Hub – Lunar PRO"
title.TextSize = 22
title.TextColor3 = Color3.fromRGB(200,170,255)
title.BackgroundTransparency = 1

-- ===== SIDEBAR =====
local sidebar = Instance.new("Frame", main)
sidebar.Size = UDim2.new(0,130,1,-45)
sidebar.Position = UDim2.new(0,0,0,45)
sidebar.BackgroundColor3 = Color3.fromRGB(30,30,45)
sidebar.BorderSizePixel = 0

local sideLayout = Instance.new("UIListLayout", sidebar)
sideLayout.Padding = UDim.new(0,6)

-- ===== PAGES =====
local pages = Instance.new("Folder", main)

local function newPage(name)
    local sf = Instance.new("ScrollingFrame", pages)
    sf.Name = name
    sf.Position = UDim2.new(0,140,0,55)
    sf.Size = UDim2.new(1,-150,1,-65)
    sf.ScrollBarThickness = 6
    sf.CanvasSize = UDim2.new(0,0,0,0)
    sf.Visible = false

    local l = Instance.new("UIListLayout", sf)
    l.Padding = UDim.new(0,8)
    l:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        sf.CanvasSize = UDim2.new(0,0,0,l.AbsoluteContentSize.Y+10)
    end)
    return sf
end

local tabs = {
    "Information",
    "TSB Hubs",
    "Tech",
    "JJS",
    "Fix Lag",
    "Misc"
}

local pagesMap = {}
for _,t in ipairs(tabs) do
    pagesMap[t] = newPage(t)
end
pagesMap["Information"].Visible = true

local function addTab(name)
    local b = Instance.new("TextButton", sidebar)
    b.Size = UDim2.new(1,-10,0,36)
    b.Text = name
    b.TextSize = 14
    b.BackgroundColor3 = Color3.fromRGB(45,45,65)
    b.TextColor3 = Color3.fromRGB(220,220,255)
    b.BorderSizePixel = 0
    b.MouseButton1Click:Connect(function()
        clickSound()
        for _,p in pairs(pagesMap) do p.Visible=false end
        pagesMap[name].Visible = true
    end)
end

for _,t in ipairs(tabs) do addTab(t) end

local function addBtn(page,text,cb)
    local b = Instance.new("TextButton", page)
    b.Size = UDim2.new(1,-10,0,42)
    b.Text = text
    b.TextSize = 15
    b.BackgroundColor3 = Color3.fromRGB(70,60,110)
    b.TextColor3 = Color3.new(1,1,1)
    b.BorderSizePixel = 0
    b.MouseButton1Click:Connect(function()
        clickSound()
        cb()
    end)
end

-- ===== INFORMATION =====
addBtn(pagesMap["Information"],"👤 User: "..plr.Name,function() end)

-- ===== TSB HUBS (FIX ĐẦY ĐỦ) =====
addBtn(pagesMap["TSB Hubs"],"Phantasm",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/PhantasmHub/Phantasm/main/Loader.lua"))()
end)

addBtn(pagesMap["TSB Hubs"],"DoviHub",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/DoviHub/Dovi/main/Loader.lua"))()
end)

addBtn(pagesMap["TSB Hubs"],"Lunar Hub",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LunarHub/Lunar/main/Loader.lua"))()
end)

addBtn(pagesMap["TSB Hubs"],"Speed Hub X",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua"))()
end)

addBtn(pagesMap["TSB Hubs"],"Auto Block",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/dinhthanhtuankiet1762009-sudo/Js/refs/heads/main/93f2600e64c1a112.lua"))()
end)

addBtn(pagesMap["TSB Hubs"],"Side Dash",function()
    loadstring(game:HttpGet("https://api.getpolsec.com/scripts/hosted/23bcf4264b586dc93b16a9b054eddae259938b7421ac5096353079b2e9d74e24.lua"))()
end)

-- ===== TECH =====
addBtn(pagesMap["Tech"],"Supa v2",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/yourlink/supav2.lua"))()
end)

addBtn(pagesMap["Tech"],"Supa v3 (Key)",function()
    loadstring(game:HttpGet("https://api.getpolsec.com/scripts/hosted/ea0b7cbd8c395e01ec38271794b2559808d26501bd6e6e30c48660759a7db7b3.lua"))()
end)

addBtn(pagesMap["Tech"],"MereQ (Key)",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/yourlink/mereq.lua"))()
end)

-- ===== JJS =====
addBtn(pagesMap["JJS"],"TBO Script",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/cool5013/TBO/main/TBOscript"))()
end)

-- ===== FIX LAG =====
addBtn(pagesMap["Fix Lag"],"Anti Lag V2",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/louismich4el/ItsLouisPlayz-Scripts/refs/heads/main/Anti%20Lag%20V2.lua"))()
end)

-- ===== MISC =====
addBtn(pagesMap["Misc"],"Jerk 🐿️",function()
    loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))()
end)
