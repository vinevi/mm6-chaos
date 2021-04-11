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

function chaos.onMinute(self)
	chaosStatus:update()
	chaosPicker.eventCurrent:onMinute()
end

function chaos.onSecond(self)
	chaosPicker.eventCurrent:onSecond()
end

return chaos