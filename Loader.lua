-- Sakura Hub Loader | Delta Safe

local url = "https://raw.githubusercontent.com/SakuraChann268/SakuraHub/main/SakuraHubs.lua"

local function loadHub()
    local src = game:HttpGet(url)
    if not src or #src < 100 then
        warn("Payload lỗi hoặc trống")
        return
    end

    local fn = loadstring(src)
    if not fn then
        warn("Loadstring fail")
        return
    end

    fn()
end

-- AUTO LOAD
loadHub()
