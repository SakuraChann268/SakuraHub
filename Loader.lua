-- 🌸 Sakura Hub | Loader Version 🌸
-- Stable for Delta Mobile & PC

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local HttpService = game:GetService("HttpService")

-- ===== CONFIG =====
local PAYLOAD_URL = "https://raw.githubusercontent.com/SakuraChann268/Sakura/refs/heads/main/SakuraHub.lua"

-- ===== UI LOADER =====
pcall(function()
    LP.PlayerGui:FindFirstChild("SakuraLoader"):Destroy()
end)

local gui = Instance.new("ScreenGui", LP.PlayerGui)
gui.Name = "SakuraLoader"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.fromOffset(260,140)
frame.Position = UDim2.fromScale(0.5,0.5)
frame.AnchorPoint = Vector2.new(0.5,0.5)
frame.BackgroundColor3 = Color3.fromRGB(255,200,225)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,40)
title.Text = "🌸 Sakura Hub Loader 🌸"
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(255,90,140)
title.BackgroundTransparency = 1

local status = Instance.new("TextLabel", frame)
status.Position = UDim2.new(0,0,0,50)
status.Size = UDim2.new(1,0,0,30)
status.Text = "Initializing..."
status.TextSize = 14
status.TextColor3 = Color3.fromRGB(120,60,80)
status.BackgroundTransparency = 1

local btn = Instance.new("TextButton", frame)
btn.Position = UDim2.new(0.1,0,0.7,0)
btn.Size = UDim2.new(0.8,0,0,36)
btn.Text = "LOAD SAKURA HUB"
btn.TextSize = 14
btn.BackgroundColor3 = Color3.fromRGB(255,150,190)
btn.TextColor3 = Color3.new(1,1,1)
btn.BorderSizePixel = 0

-- ===== SOUND =====
local function sound(id)
    local s = Instance.new("Sound", gui)
    s.SoundId = "rbxassetid://"..id
    s.Volume = 1
    s:Play()
    game.Debris:AddItem(s,2)
end

-- ===== LOAD PAYLOAD =====
btn.MouseButton1Click:Connect(function()
    btn.Text = "Loading..."
    status.Text = "Fetching Sakura Hub..."
    sound(9118823106)

    local ok, res = pcall(function()
        return game:HttpGet(PAYLOAD_URL)
    end)

    if not ok then
        status.Text = "❌ Load failed"
        btn.Text = "RETRY"
        return
    end

    status.Text = "Executing..."
    task.wait(0.3)

    local runOk, err = pcall(function()
        loadstring(res)()
    end)

    if runOk then
        sound(9118822463)
        status.Text = "✅ Loaded!"
        task.wait(0.6)
        gui:Destroy()
    else
        status.Text = "❌ Error"
        btn.Text = "RETRY"
        warn(err)
    end
end)