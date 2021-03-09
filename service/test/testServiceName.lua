require "skynet.manager"
local skynet = require "skynet"
local harbor = require "skynet.harbor"

skynet.start(function()
   local handle = skynet.newservice("test1")

    skynet.name(".testName", handle)
    skynet.name("_testName", handle)

    handle = skynet.localname(".testName")
    skynet.error("local name:", handle)

    handle = skynet.localname("_testName")
    skynet.error("local name:", handle)

    handle = harbor.queryname(".testName")
    skynet.error("world name:", handle)

    handle = harbor.queryname("_testName")
    skynet.error("world name:", handle)
end)