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
