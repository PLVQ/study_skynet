local skynet = require "skynet"
require "skynet.manager"

skynet.start(function()
    skynet.register(".testSendMsg")
    local testRecvMsg = skynet.localname(".testRecvMsg")

    --发送lua类型的消息给testluamsg，发送成功后立即返回，r的值为0
    local r = skynet.send(testRecvMsg, "lua", 1, "nengzhong", true) --申请了C内存（msg，sz）已经用与发送，所以不用自己再释放内存了。
    skynet.error("skynet.send return value:", r)   
        
    --通过skynet.pack来打包发送
    r = skynet.rawsend(testRecvMsg, "lua", skynet.pack(2, "nengzhong", false)) --申请了C内存（msg，sz）已经用与发送，所以不用自己再释放内存了。
    skynet.error("skynet.rawsend return value:", r) 
    skynet.error("handle:",  skynet.address(skynet.self()))
end)