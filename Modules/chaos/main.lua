chaosStatus = require('chaos.core.status')
chaosPicker = require('chaos.core.picker')
chaosTimer = require('chaos.core.timer')
chaosDebug = require('chaos.core.debug')

local chaos = {}
function chaos.init(self)
	chaosPicker:init()
	chaosTimer:init()
	chaosDebug:init()
end

function chaos.onCycle(self)
	chaosPicker:endCurrentEvent()
	chaosPicker:advanceInQue()
	chaosPicker:beginCurrentEvent()
end

function chaos.onTick(self)
	chaosStatus:update()
end

return chaos