local skynet = require "skynet"

local args = {...}
if #args == 0 then
    table.insert(args, "uniqueService")
end

skynet.start(function()
    local us
    skynet.error("test unique service")
    if (#args == 2 and args[1] == true) then
        skynet.error("1")
        us = skynet.queryservice(true, args[2])
    else
        skynet.error("2")
        us = skynet.queryservice(args[1])
    end
    skynet.error("uniqueService handler:", skynet.address(us))
end)