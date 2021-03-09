local skynet = require "skynet"
require "skynet.manager"

function doSomething(session, address, ...)
    skynet.error("session", session)
    skynet.error("address", skynet.address(address))
    local args = {...}
    for i,v in pairs(args) do
         skynet.error("arg"..i..":", v)
    end
    return true
end

skynet.start(function()
    skynet.error("testRecvMsg server start!")
    skynet.register(".testRecvMsg")
    skynet.dispatch("lua", function(session, address, ...)
        skynet.retpack(doSomething(session, address, ...))
    end)
    skynet.error("handle:",  skynet.address(skynet.self()))
end)