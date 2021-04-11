local event = {
	title = '',
	onQue = function() end, -- is used to compute title / result while event is in que
	onBegin = function() end, -- event's main action
	onEnd = function() end, -- remove the effect after event has finished
	onMinute = function() end, -- called every in-game minute
	onSecond = function() end, -- called every in-game second
	chance = 0,
	new = function(self, o)
			o = o or {}
			setmetatable(o, self)
			self.__index = self
			return o
		end,
}

return event