local timer = {
	timer = 0,
	timerMax = 3,
}

timer.init = function(self)
	function events.LoadMap()
		Timer(function()
			self:count()
			if (self.timer == -1) then
				self:loop()
				chaos:onCycle()
			end
			chaos:onTick()
		end, const.Minute)
	end
end

timer.count = function(self)
	self.timer = self.timer - 1
end

timer.loop = function(self)
	self.timer = self.timer % self.timerMax
end

return timer