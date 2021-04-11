local timer = {
	timer = 0,
	timerMax = 10,
	paused = false,
}

timer.init = function(self)
	function events.LoadMap()
		Timer(function()
			self:count()
		end, const.Minute / 2)
		Timer(function()
			self:tick()
		end, const.Second)
	end
end

timer.count = function(self)
	if(self.paused == false) then
		self.timer = self.timer - 1
		if (self.timer == -1) then
			self:loop()
			chaos:onCycle()
		end
		chaos:onMinute()
	end
end

timer.tick = function(self)
	if(self.paused == false) then
		chaos:onSecond()
	end
end

timer.loop = function(self)
	self.timer = self.timer % self.timerMax
end

return timer