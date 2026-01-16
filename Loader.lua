-- 👑 Sakura Hub | LEVEL X MAX
-- 📱 Delta Android OK

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- ===== CONFIG =====
local HUB_NAME = "🌸 Sakura Hub | LEVEL X"
local GET_KEY_LINK = "https://linkvertise.com/xxx/sakurahub" -- 🔗 ĐỔI LINK KIẾM TIỀN
local SECRET = "SAKURA-X"
local SAVE_FILE = "SakuraHub_Key.txt"

-- ===== NOTIFY =====
local function notify(t)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title = HUB_NAME, Text = t, Duration = 6
        })
    end)
end

-- ===== KEY THEO NGÀY =====
local function todayKey()
    local d = os.date("*t")
    return SECRET .. "-" .. d.day .. d.month .. d.year
end

-- ===== SAVE / LOAD =====
local function save(k)
    if writefile then writefile(SAVE_FILE, k) end
end
local function load()
    if readfile and isfile and isfile(SAVE_FILE) then
        return readfile(SAVE_FILE)
    end
end

-- ===== WHITELIST =====
local WL = {
    [LocalPlayer.UserId] = true,
}
if not WL[LocalPlayer.UserId] then
    notify("❌ Bạn chưa được whitelist")
    return
end

-- ===== CHECK KEY =====
local userKey = getgenv().SAKURA_KEY or load()
local realKey = todayKey()

if not userKey then
    setclipboard(GET_KEY_LINK)
    notify("🔗 Link get key đã copy")
    return
end

if userKey ~= realKey then
    setclipboard(GET_KEY_LINK)
    notify("❌ Key sai / hết hạn")
    return
end

save(userKey)
notify("✅ Key hợp lệ – Loading Hub...")

-- ===== LOAD HUB =====
loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/SakuraChann268/SakuraHub/main/SakuraHubs.lua"
))()
