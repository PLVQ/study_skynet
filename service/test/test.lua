local skynet = require "skynet"
local harbor = require "skynet.harbor"
require "skynet.manager"

skynet.start(function()
    skynet.error("test server start!")
    skynet.newservice("test1")
    if not skynet.getenv "daemon" then
		local console = skynet.newservice("console")
	end
    skynet.newservice("testRecvMsg")
    skynet.newservice("testSendMsg")
    skynet.exit()
end)