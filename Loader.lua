-- 🌸 Sakura Hub Loader | Money Version
-- Delta Compatible

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local plr = Players.LocalPlayer

-- ===== CONFIG =====
local KEY_LINK = "https://linkvertise.com/3005759/rml6R6kJW5Tc"
local VALID_KEYS = {
    ["SAKURA-61062162"] = true
}

local SAVE_FILE = "SakuraHub/key.json"

-- ===== SAVE / LOAD KEY =====
pcall(function()
    if not isfolder("SakuraHub") then makefolder("SakuraHub") end
end)

local function saveKey(k)
    writefile(SAVE_FILE, HttpService:JSONEncode({key=k}))
end

local function loadKey()
    if isfile(SAVE_FILE) then
        return HttpService:JSONDecode(readfile(SAVE_FILE)).key
    end
end

-- ===== UI =====
local gui = Instance.new("ScreenGui", plr.PlayerGui)
gui.Name = "SakuraKeyUI"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.fromScale(0.75,0.45)
frame.Position = UDim2.fromScale(0.125,0.28)
frame.BackgroundColor3 = Color3.fromRGB(25,25,35)
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,40)
title.Text = "🌸 Sakura Hub – Get Key"
title.TextColor3 = Color3.fromRGB(255,150,190)
title.BackgroundTransparency = 1
title.TextSize = 20

local box = Instance.new("TextBox", frame)
box.Size = UDim2.new(0.9,0,0,40)
box.Position = UDim2.new(0.05,0,0.35,0)
box.PlaceholderText = "Nhập KEY vào đây"
box.Text = ""
box.TextSize = 16

local btnGet = Instance.new("TextButton", frame)
btnGet.Size = UDim2.new(0.42,0,0,38)
btnGet.Position = UDim2.new(0.05,0,0.6,0)
btnGet.Text = "🔗 Get Key"
btnGet.BackgroundColor3 = Color3.fromRGB(255,140,180)

local btnLoad = Instance.new("TextButton", frame)
btnLoad.Size = UDim2.new(0.42,0,0,38)
btnLoad.Position = UDim2.new(0.53,0,0.6,0)
btnLoad.Text = "✅ Load Hub"
btnLoad.BackgroundColor3 = Color3.fromRGB(180,120,255)

btnGet.MouseButton1Click:Connect(function()
    setclipboard(KEY_LINK)
    btnGet.Text = "📋 Đã copy link"
end)

btnLoad.MouseButton1Click:Connect(function()
    local key = box.Text
    if VALID_KEYS[key] then
        saveKey(key)
        gui:Destroy()
        loadstring(game:HttpGet(
          "https://raw.githubusercontent.com/SakuraChann268/SakuraHub/refs/heads/main/SakuraHubs.lua"
        ))()
    else
        btnLoad.Text = "❌ Sai key"
    end
end)

-- AUTO LOAD KEY
local saved = loadKey()
if saved and VALID_KEYS[saved] then
    gui:Destroy()
    loadstring(game:HttpGet(
      "https://raw.githubusercontent.com/SakuraChann268/SakuraHub/refs/heads/main/SakuraHubs.lua"
    ))()
end
