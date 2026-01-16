-- Sakura Hub | Lightweight Loader (Delta Safe)

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local LP = Players.LocalPlayer

-- ===== CONFIG =====
local HUB_URL = "https://raw.githubusercontent.com/SakuraChann268/SakuraHub/refs/heads/main/SakuraHubs.lua"

-- ===== SIMPLE OBFUSCATION =====
local function safeRun(code)
    local f = loadstring(code)
    if typeof(f) == "function" then
        return pcall(f)
    end
    return false
end

-- Fake payload (anti skid nhẹ)
local fake = function()
    local t = {}
    for i = 1, math.random(3,6) do
        t[i] = math.random()
    end
    return t
end
fake()

-- Bind nhẹ theo UserId (không khoá cứng)
local uid = tostring(LP.UserId)
if #uid < 5 then return end

-- Load real hub
local ok, err = pcall(function()
    local src = game:HttpGet(HUB_URL)
    safeRun(src)
end)

if not ok then
    warn("[SakuraHub] Loader failed:", err)
end
