-- 🌸 Sakura Hub | OMEGA+++ Loader (Delta Safe)
-- SaveKey | AutoLogin | Bind UID+Executor | AntiFake | AntiDoubleLoad

if _G.__SAKURA_OMEGAPP then return end
_G.__SAKURA_OMEGAPP = true

local P=game:GetService("Players")
local H=game:GetService("HttpService")
local L=P.LocalPlayer
local UID=tostring(L.UserId)

local function ex()
    if identifyexecutor then return tostring(identifyexecutor()) end
    if getexecutorname then return tostring(getexecutorname()) end
    return "Unknown"
end
local EXEC=ex()

-- ===== CONFIG (SỬA LINK NÀY) =====
local KEY_SERVER="https://raw.githubusercontent.com/SakuraChann268/SakuraHub/refs/heads/main/keys.json"
local HUB_SCRIPT="https://raw.githubusercontent.com/SakuraChann268/SakuraHub/refs/heads/main/SakuraHubs.lua"
local SAVE_FILE="sakura_key.dat"

-- ===== FILE IO =====
local function save(k) if writefile then writefile(SAVE_FILE,k) end end
local function loadk() if readfile and isfile and isfile(SAVE_FILE) then return readfile(SAVE_FILE) end end

-- ===== KEY VERIFY =====
local function verify(key)
    local ok,raw=pcall(function() return game:HttpGet(KEY_SERVER,true) end)
    if not ok then return false,"SERVER" end
    local db=H:JSONDecode(raw)
    local info=db[key]
    if not info or info.status~="active" then return false,"INVALID" end

    if not info.bind_uid then
        info.bind_uid=UID
        info.bind_exec=EXEC
        -- bind lần đầu (client-side notify)
        return true,"BIND"
    end
    if info.bind_uid==UID and info.bind_exec==EXEC then
        return true,"OK"
    end
    return false,"USED"
end

-- ===== UI =====
local gui=Instance.new("ScreenGui",L.PlayerGui); gui.Name="SakuraOmegaPPPLoader"
local fr=Instance.new("Frame",gui)
fr.Size=UDim2.fromScale(.7,.4); fr.Position=UDim2.fromScale(.15,.3)
fr.BackgroundColor3=Color3.fromRGB(20,20,30); fr.Active=true; fr.Draggable=true

local tl=Instance.new("TextLabel",fr)
tl.Size=UDim2.new(1,0,0,42); tl.BackgroundTransparency=1
tl.Text="🌙 Sakura Hub — OMEGA+++"
tl.TextColor3=Color3.fromRGB(170,170,255); tl.TextSize=18

local box=Instance.new("TextBox",fr)
box.Size=UDim2.new(.9,0,0,42); box.Position=UDim2.new(.05,0,.4,0)
box.PlaceholderText="Enter Key"; box.Text=loadk() or ""
box.BackgroundColor3=Color3.fromRGB(50,50,80); box.TextColor3=Color3.new(1,1,1)

local btn=Instance.new("TextButton",fr)
btn.Size=UDim2.new(.6,0,0,42); btn.Position=UDim2.new(.2,0,.7,0)
btn.Text="VERIFY"; btn.TextSize=16
btn.BackgroundColor3=Color3.fromRGB(120,120,220); btn.TextColor3=Color3.new(1,1,1)

local function loadHub()
    gui:Destroy()
    loadstring(game:HttpGet(HUB_SCRIPT,true))()
end

btn.MouseButton1Click:Connect(function()
    local k=box.Text
    local ok,msg=verify(k)
    if not ok then
        btn.Text = (msg=="USED" and "KEY ĐÃ DÙNG ❌")
            or (msg=="SERVER" and "SERVER LỖI ❌")
            or "KEY SAI ❌"
        task.wait(1); btn.Text="VERIFY"; return
    end
    save(k)
    btn.Text = (msg=="BIND" and "BIND ✔") or "OK ✔"
    task.wait(.4)
    loadHub()
end)

-- Auto login
local sk=loadk()
if sk then
    local ok,_=verify(sk)
    if ok then loadHub() end
end
