-- 🌸 Sakura Hub | Delta Mobile Stable 🌸

local Players = game:GetService("Players")
local LP = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui", LP.PlayerGui)
gui.Name = "SakuraHub"
gui.ResetOnSpawn = false

-- Toggle Button
local toggle = Instance.new("TextButton", gui)
toggle.Size = UDim2.fromOffset(55,55)
toggle.Position = UDim2.new(0,15,0.5,-30)
toggle.Text = "🌸"
toggle.TextSize = 26
toggle.BackgroundColor3 = Color3.fromRGB(255,150,190)
toggle.TextColor3 = Color3.new(1,1,1)
toggle.BorderSizePixel = 0
toggle.Active = true
toggle.Draggable = true
toggle.ZIndex = 10

-- Main
local main = Instance.new("Frame", gui)
main.Size = UDim2.fromScale(0.88,0.78)
main.Position = UDim2.fromScale(0.06,0.11)
main.BackgroundColor3 = Color3.fromRGB(25,25,35)
main.Visible = false
main.Active = true
main.Draggable = true
main.BorderSizePixel = 0

toggle.MouseButton1Click:Connect(function()
	main.Visible = not main.Visible
end)

-- Title
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1,0,0,40)
title.Text = "🌸 Sakura Hub"
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(255,140,180)
title.BackgroundTransparency = 1

-- Tabs
local tabs = {"Information","TSB Hubs","Tech","JJS","Misc"}
local tabBar = Instance.new("Frame", main)
tabBar.Size = UDim2.new(1,0,0,40)
tabBar.Position = UDim2.new(0,0,0,40)
tabBar.BackgroundTransparency = 1

local pages = Instance.new("Folder", main)
local pagesMap = {}

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

for _,t in ipairs(tabs) do
	pagesMap[t] = newPage(t)
end
pagesMap["Information"].Visible = true

-- Tab Buttons
for i,t in ipairs(tabs) do
	local b = Instance.new("TextButton", tabBar)
	b.Size = UDim2.new(1/#tabs,0,1,0)
	b.Position = UDim2.new((i-1)/#tabs,0,0,0)
	b.Text = t
	b.TextSize = 12
	b.BackgroundColor3 = Color3.fromRGB(255,160,200)
	b.TextColor3 = Color3.new(1,1,1)
	b.BorderSizePixel = 0
	b.MouseButton1Click:Connect(function()
		for _,p in pairs(pagesMap) do p.Visible = false end
		pagesMap[t].Visible = true
	end)
end

-- Button helper
local function addBtn(page,text,callback)
	local b = Instance.new("TextButton", page)
	b.Size = UDim2.new(1,-10,0,40)
	b.Text = text
	b.TextSize = 14
	b.BackgroundColor3 = Color3.fromRGB(255,170,205)
	b.TextColor3 = Color3.new(1,1,1)
	b.BorderSizePixel = 0
	b.MouseButton1Click:Connect(callback)
end

-- INFORMATION
addBtn(pagesMap["Information"],"👤 User: "..LP.Name,function() end)

-- TSB HUBS (KHÔNG MẤT)
addBtn(pagesMap["TSB Hubs"],"Auto Block",function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/dinhthanhtuankiet1762009-sudo/Js/refs/heads/main/93f2600e64c1a112.lua"))()
end)

addBtn(pagesMap["TSB Hubs"],"Side Dash",function()
	loadstring(game:HttpGet("https://api.getpolsec.com/scripts/hosted/23bcf4264b586dc93b16a9b054eddae259938b7421ac5096353079b2e9d74e24.lua"))()
end)

addBtn(pagesMap["TSB Hubs"],"Back Dash Cancel",function()
	loadstring(game:HttpGet("https://pastefy.app/NXCancel/raw"))()
end)

addBtn(pagesMap["TSB Hubs"],"Phantasm Hub",function()
	loadstring(game:HttpGet("https://pastefy.app/phantasm/raw"))()
end)

addBtn(pagesMap["TSB Hubs"],"Dovi Hub",function()
	loadstring(game:HttpGet("https://pastefy.app/dovihub/raw"))()
end)

addBtn(pagesMap["TSB Hubs"],"Lunar Hub",function()
	loadstring(game:HttpGet("https://pastefy.app/lunarhub/raw"))()
end)

addBtn(pagesMap["TSB Hubs"],"Speed Hub X",function()
	loadstring(game:HttpGet("https://pastefy.app/speedhubx/raw"))()
end)

-- TECH
addBtn(pagesMap["Tech"],"Supa v2",function()
	loadstring(game:HttpGet("https://pastefy.app/supav2/raw"))()
end)

addBtn(pagesMap["Tech"],"Supa v3 (Key)",function()
	loadstring(game:HttpGet("https://api.getpolsec.com/scripts/hosted/ea0b7cbd8c395e01ec38271794b2559808d26501bd6e6e30c48660759a7db7b3.lua"))()
end)

addBtn(pagesMap["Tech"],"MereQ (Key)",function()
	loadstring(game:HttpGet("https://pastefy.app/mereq/raw"))()
end)

-- JJS
addBtn(pagesMap["JJS"],"TBO Script",function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/cool5013/TBO/main/TBOscript"))()
end)

-- MISC
addBtn(pagesMap["Misc"],"Jerk 🗿",function()
	loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))()
end)
