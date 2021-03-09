require "skynet.manager"

local skynet = require "skynet"

local data = {}

local CMD = {}

function CMD.SET(key, value)
    data[key] = value
end

function CMD.GET(key)
    return data[key]
end
skynet.start(function()
    skynet.error("recvMsgApply service start!")
    skynet.dispatch("lua", function(session, address, cmd, ...)
        local cmd = string.upper(cmd)
        local f = CMD[cmd]
        if f == nil then
            skynet.error(string.format("Unknown command %s", tostring(cmd)))
            return false
        else
            skynet.retpack(f(...))
        end
    end)
    skynet.register(".recvMsgApply")
end)