-- 🌸 Sakura Hub | LOCAL Statistics (Delta OK)

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local HttpService = game:GetService("HttpService")

local FILE_NAME = "SakuraHub_LocalStats.json"
local startTime = os.time()

-- Load stats
local stats = {
    UserId = LP.UserId,
    Username = LP.Name,
    Executor = identifyexecutor and identifyexecutor() or "Unknown",
    LaunchCount = 0,
    TotalTime = 0,
    LastOpen = "Never"
}

if isfile(FILE_NAME) then
    local ok, data = pcall(function()
        return HttpService:JSONDecode(readfile(FILE_NAME))
    end)
    if ok and type(data) == "table" then
        stats = data
    end
end

-- Update stats
stats.LaunchCount += 1
stats.LastOpen = os.date("%Y-%m-%d %H:%M:%S")

-- Save on close
local function saveStats()
    stats.TotalTime += os.time() - startTime
    writefile(FILE_NAME, HttpService:JSONEncode(stats))
end

game:BindToClose(saveStats)

-- Auto save mỗi 60s
task.spawn(function()
    while task.wait(60) do
        saveStats()
    end
end)

-- 🌸 Sakura Hub | UI Lunar – Stable Build

local Library = loadstring(game:HttpGet(
"https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"
))()

local Window = Library.CreateLib("🌸 Sakura Hub | LEVEL X", "Ocean")

-- ===== HOME =====
local Home = Window:NewTab("🏠 Home")
local H = Home:NewSection("Info")
H:NewButton("Discord", "Join Discord", function()
    setclipboard("https://discord.gg/sakura")
end)

-- ===== TECH =====
local Tech = Window:NewTab("⚙️ Tech")
local T = Tech:NewSection("Tech Scripts")
T:NewButton("Supa v2", "", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xxx/supa-v2.lua"))()
end)

-- ===== TSB MENU =====
local TSB = Window:NewTab("🔥 TSB Menu")
local S = TSB:NewSection("TSB Hubs")
S:NewButton("Phantasm", "", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xxx/phantasm.lua"))()
end)
S:NewButton("DoviHub", "", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xxx/dovihub.lua"))()
end)
S:NewButton("LunarHub", "", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xxx/lunarhub.lua"))()
end)
S:NewButton("Speed Hub X", "", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xxx/speedhubx.lua"))()
end)
S:NewButton("Back Dash Cancel", "", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xxx/backdash.lua"))()
end)

-- ===== JJS =====
local JJS = Window:NewTab("🥋 JJS")
local J = JJS:NewSection("JJS Scripts")
J:NewButton("JJS Combo", "", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xxx/jjs.lua"))()
end)

-- ===== MISC =====
local Misc = Window:NewTab("🧩 Misc")
local M = Misc:NewSection("Other")
M:NewButton("FPS Boost", "", function()
    settings().Rendering.QualityLevel = "Level01"
end)
