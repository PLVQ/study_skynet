local skynet = require "skynet"

skynet.start(function()
    skynet.error("new server!")
    skynet.error("test server")
end)