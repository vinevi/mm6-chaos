local debug = {
	eventFilename = 'No AI',
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
				chaosPicker.eventCurrent = self.event
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

debug.chances = function(self)
	if(chaosPicker) then
		for key,chance in pairs(chaosPicker.chanceTable) do
			print(chance .. ' : ' .. chaosPicker.events[key].filename)
		end
	end
end

debug.events = function(self)
	if(chaosPicker) then
		for key,event in pairs(chaosPicker.events) do
			local title = event.title or '...'
			local description = event.description or '...'
			print(title .. ' - ' .. description)
		end
	end
end

return debug