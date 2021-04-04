local util = require('chaos.util')

chaosStatus = require('chaos.status')
chaosPicker = require('chaos.picker')
chaosTimer = require('chaos.timer')


local chaos = {}
function chaos.init(self)
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

