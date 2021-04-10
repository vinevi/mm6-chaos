local event = {
	title = '',
	onQue = function() end, -- is used to compute title / result while event is in que
	onBegin = function() end, -- event's main action
	onEnd = function() end, -- remove the effect after event has finished
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