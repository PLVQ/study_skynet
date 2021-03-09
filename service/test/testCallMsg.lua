local skynet = require "skynet"

skynet.start(function()
    skynet.error("call msg service start!")

    local recvMsgHd = skynet.localname(".testRecvMsg")
    skynet.error("handle:",  skynet.address(recvMsgHd))
    local ret = skynet.call(recvMsgHd, "lua", "pengjiang", "true")
    skynet.error("ret:", ret)

    ret = skynet.unpack(skynet.rawcall(recvMsgHd, "lua", skynet.pack("pengjiang", "true")))
    skynet.error("ret:", ret)
    skynet.error("handle:",  skynet.address(skynet.self()))
end)