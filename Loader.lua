-- 🌸 Sakura Hub | Loader C+D (Delta Compatible)
-- Get Key + Save Key + Whitelist + Obfuscation Light

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local LP = Players.LocalPlayer

-- ===== CONFIG =====
local HUB_URL = "https://raw.githubusercontent.com/SakuraChann268/SakuraHub/refs/heads/main/SakuraHubs.lua"

-- LINK GET KEY (đổi link TikTok / rút gọn của em)
local GET_KEY_URL = "https://link-to-tiktok-or-shortlink"

-- KEY LIST (em tự thêm key)
local VALID_KEYS = {
    ["SAKURA-61062162"] = true,
    ["SAKURA-456"] = true,
}

-- WHITELIST USERID (tuỳ chọn)
local WHITELIST = {
    [LP.UserId] = true -- cho chính em
}

-- ===== SAVE KEY =====
local KEY_FILE = "SakuraKey_"..LP.UserId..".json"

local function saveKey(key)
    writefile(KEY_FILE, HttpService:JSONEncode({key=key}))
end

local function loadSavedKey()
    if isfile(KEY_FILE) then
        local data = HttpService:JSONDecode(readfile(KEY_FILE))
        return data.key
    end
end

-- ===== UI =====
pcall(function() LP.PlayerGui:FindFirstChild("SakuraLoader"):Destroy() end)

local gui = Instance.new("ScreenGui", LP.PlayerGui)
gui.Name = "SakuraLoader"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.fromOffset(300,180)
frame.Position = UDim2.fromScale(0.5,0.5)
frame.AnchorPoint = Vector2.new(0.5,0.5)
frame.BackgroundColor3 = Color3.fromRGB(30,30,40)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,40)
title.Text = "🌸 Sakura Hub Loader"
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(255,150,200)
title.BackgroundTransparency = 1

local box = Instance.new("TextBox", frame)
box.Position = UDim2.new(0.1,0,0.35,0)
box.Size = UDim2.new(0.8,0,0,32)
box.PlaceholderText = "Enter Key Here"
box.Text = ""
box.TextSize = 14
box.BackgroundColor3 = Color3.fromRGB(45,45,60)
box.TextColor3 = Color3.new(1,1,1)
box.BorderSizePixel = 0

local status = Instance.new("TextLabel", frame)
status.Position = UDim2.new(0,0,0.6,0)
status.Size = UDim2.new(1,0,0,20)
status.Text = ""
status.TextSize = 13
status.TextColor3 = Color3.fromRGB(200,200,200)
status.BackgroundTransparency = 1

local btnLoad = Instance.new("TextButton", frame)
btnLoad.Position = UDim2.new(0.1,0,0.75,0)
btnLoad.Size = UDim2.new(0.35,0,0,32)
btnLoad.Text = "LOAD"
btnLoad.TextSize = 14
btnLoad.BackgroundColor3 = Color3.fromRGB(120,80,150)
btnLoad.TextColor3 = Color3.new(1,1,1)
btnLoad.BorderSizePixel = 0

local btnGet = Instance.new("TextButton", frame)
btnGet.Position = UDim2.new(0.55,0,0.75,0)
btnGet.Size = UDim2.new(0.35,0,0,32)
btnGet.Text = "GET KEY"
btnGet.TextSize = 14
btnGet.BackgroundColor3 = Color3.fromRGB(80,120,150)
btnGet.TextColor3 = Color3.new(1,1,1)
btnGet.BorderSizePixel = 0

-- ===== GET KEY =====
btnGet.MouseButton1Click:Connect(function()
    setclipboard(GET_KEY_URL)
    status.Text = "🔗 Link copied! Open browser"
end)

-- ===== LOAD =====
local function loadHub()
    local src = game:HttpGet(HUB_URL)
    loadstring(src)()
    gui:Destroy()
end

btnLoad.MouseButton1Click:Connect(function()
    local key = box.Text

    if VALID_KEYS[key] then
        saveKey(key)
        status.Text = "✅ Key valid! Loading..."
        task.wait(0.5)
        loadHub()
    else
        status.Text = "❌ Invalid key"
    end
end)

-- ===== AUTO LOAD SAVED KEY =====
local saved = loadSavedKey()
if saved and VALID_KEYS[saved] then
    status.Text = "🔓 Key saved! Loading..."
    task.wait(0.6)
    loadHub()
end
