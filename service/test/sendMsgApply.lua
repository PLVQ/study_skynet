require "skynet.manager"
local skynet = require "skynet"

function task()
    local recvMsgHd = skynet.localname(".recvMsgApply")
    local ret = skynet.send(recvMsgHd, "lua", "set", "name", "pengjiang")
    skynet.error("send return:", ret)
    local ret = skynet.call(recvMsgHd, "lua", "get", "name", "pengjiang")
    skynet.error("call return:", ret)
    skynet.exit()
end

skynet.start(function()
    skynet.fork(task)
end)