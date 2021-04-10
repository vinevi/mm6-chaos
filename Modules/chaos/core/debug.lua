local debug = {
	eventFilename = 'Double Speed',
	event = {},
	began = false,
}

debug.init = function(self)
	self.event = chaosPicker:findByFilename(self.eventFilename)
	function Keys.F6(t)
		if( chaosTimer ) then
			chaosTimer.paused = not chaosTimer.paused
			local message = ''
			if(chaosTimer.paused == true) then
				message = 'Pausing'
			else
				message = 'Resuming'
			end
			Game.ShowStatusText(message)
		end
	end
	function Keys.F7(t)
		if(self.event) then
			if(self.began == false) then
				self.event:onQue()
				self.event:onBegin()
			else
				self.event:onEnd()
			end
			self.began = not self.began
		end
	end
	function Keys.F8(t)

	end
end

debug.printChanceTable = function(self)
	if(chaosPicker) then
		for key,chance in pairs(chaosPicker.chanceTable) do
			print(chance .. ' : ' .. chaosPicker.events[key].filename)
		end
	end
end

return debug