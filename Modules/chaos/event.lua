local event = {
	title = 'Event',
	prepare = function() end, -- (optional) is used to compute title / result while event is in que
	run = function() end, -- event's main action
	restore = function() end, -- (optional) remove the effect after event has finished
	loop = false,
	chance = 0,
	new = function(self, o)
			o = o or {}
			setmetatable(o, self)
			self.__index = self
			return o
		end,
}

return event