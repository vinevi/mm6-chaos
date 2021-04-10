local timer = {
	timer = 0,
	timerMax = 3,
	paused = true,
}

timer.init = function(self)
	function events.LoadMap()
		Timer(function()
			self:count()
		end, const.Minute)
	end
end

timer.count = function(self)
	if(self.paused == false) then
		self.timer = self.timer - 1
		if (self.timer == -1) then
			self:loop()
			chaos:onCycle()
		end
		chaos:onTick()
	end
end

timer.loop = function(self)
	self.timer = self.timer % self.timerMax
end

return timer