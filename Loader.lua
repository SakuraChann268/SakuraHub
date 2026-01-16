-- Sakura Hub | PRO Loader 👑
-- Delta / Mobile / PC OK

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local plr = Players.LocalPlayer

-- ===== CONFIG =====
local HUB_RAW = "https://raw.githubusercontent.com/SakuraChann268/SakuraHub/main/SakuraHub.lua"
local SAVE_FILE = "SakuraHub_Key.json"
local VALID_KEY = "SAKURA-61062162" -- đổi khi cần
-- ==================

-- ===== SAVE KEY LOCAL =====
local function saveKey(key)
    if writefile then
        writefile(SAVE_FILE, HttpService:JSONEncode({
            key = key,
            uid = plr.UserId
        }))
    end
end

local function loadKey()
    if readfile and isfile and isfile(SAVE_FILE) then
        local ok, data = pcall(function()
            return HttpService:JSONDecode(readfile(SAVE_FILE))
        end)
        if ok and data and data.key == VALID_KEY and data.uid == plr.UserId then
            return true
        end
    end
    return false
end

-- ===== UI GET KEY =====
local gui = Instance.new("ScreenGui", plr.PlayerGui)
gui.Name = "SakuraKeyUI"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.fromScale(0.4,0.3)
frame.Position = UDim2.fromScale(0.3,0.35)
frame.BackgroundColor3 = Color3.fromRGB(30,30,40)

local box = Instance.new("TextBox", frame)
box.Size = UDim2.new(0.8,0,0.25,0)
box.Position = UDim2.new(0.1,0,0.3,0)
box.PlaceholderText = "Nhập Key Sakura 🌸"
box.Text = ""

local btn = Instance.new("TextButton", frame)
btn.Size = UDim2.new(0.5,0,0.25,0)
btn.Position = UDim2.new(0.25,0,0.65,0)
btn.Text = "VERIFY"

-- ===== AUTO LOAD IF SAVED =====
local function loadHub()
    gui:Destroy()
    loadstring(game:HttpGet(HUB_RAW, true))()
end

if loadKey() then
    loadHub()
    return
end

btn.MouseButton1Click:Connect(function()
    if box.Text == VALID_KEY then
        saveKey(box.Text)
        loadHub()
    else
        box.Text = "SAI KEY ❌"
    end
end)
