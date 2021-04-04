local status = {
	timeleft = '',
	titleCurrent = '',
	titleNext = '',
	maxTitleLength = 12,
	whitespaceSymbol = ' ',
}

status.update = function(self)
	self.timeleft = self:formatTimeleft(chaosTimer.timer)
	self.titleCurrent = self:formatTitle(chaosPicker.eventCurrent.title)
	self.titleNext = self:formatTitle(chaosPicker.eventNext.title, true)

	local statusText =  self.titleCurrent .. ' > ' .. self.timeleft .. ' > ' .. self.titleNext
	Game.ShowStatusText(statusText, const.Minute)
end

status.formatTitle = function(self, text, right)
		local title = text or ''
		local length = string.len(title)
		local remainder = self.maxTitleLength - length
		if(remainder >= 0) then
			local padding = self:createWhitespaceString(remainder) -- adding whitespace in order to center the timer
			if( right == true ) then
					title = title .. padding
				else
					title = padding .. title
			end
		else
			remainder = math.abs(remainder - 3)
			local stringEnd = length - remainder
			title = string.sub(title, 0, stringEnd)
			title = title .. '...'
		end
		return title
	end

status.formatTimeleft = function(self, value)
	if(value < 10) then
		value = 0 .. value
	end
	return '00:' .. value
end

status.createWhitespaceString = function(self, length)
	local title = ''
	for i = 1, length do
		title = title .. self.whitespaceSymbol
	end
	return title
end

return status