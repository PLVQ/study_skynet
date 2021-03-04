local skynet = require "skynet"

skynet.start(function()
    skynet.error("new server!")
    skynet.error("test1 server")
    skynet.newservice("test")
    if not skynet.getenv "daemon" then
		local console = skynet.newservice("console")
	end
    skynet.exit()
end)