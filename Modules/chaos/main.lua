local util = require('chaos.util')

chaosPicker = require('chaos.picker')
chaosTimer = require('chaos.timer')
chaosStatus = require('chaos.status')

local chaos = {}
function chaos.init(self)
	chaosStatus:init()
	chaosPicker:init()
	chaosTimer:init()
end

function chaos.onCycle(self)
	chaosPicker:pickEvent()
end

function chaos.onTick(self)
	chaosStatus:update()
end

return chaos

