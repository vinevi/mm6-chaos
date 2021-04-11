local BaseEvent = require('chaos.core.event')
local picker = {
	events = {},
	chanceTable = {},
	chanceSum = 0,
	eventCurrent = BaseEvent:new(),
	eventNext = BaseEvent:new{title = 'Start'},
}

picker.init = function(self)
	self:loadEvents()
	self:createChanceTable()
end

picker.loadEvents = function(self)
	local events = {}
	for s in path.find(AppPath .. "scripts/modules/chaos/events/*.lua") do
		local filename = path.name(s)
		filename = filename:sub(0, #filename - 4)
		s = 'chaos.events.'  .. filename
		local newEvent = require(s)
		newEvent.filename = filename
		newEvent = BaseEvent:new(newEvent)
		table.insert(events, newEvent)
	end
	self.events = events
end

picker.createChanceTable = function(self)
	local chanceSum = 0
	local chanceTable = {}
	for key,event in pairs(self.events) do
		local chance = event.chance
		chanceSum = chanceSum + chance
		table.insert(chanceTable, chanceSum)
	end
	self.chanceSum = chanceSum
	self.chanceTable = chanceTable
end

picker.pickEvent = function(self)
	local value = math.random(0, self.chanceSum)
	local event = self:findByChance(value)
	return event
end

picker.findByChance = function(self, value)
	local valueLast = 0
	for key,chance in pairs(self.chanceTable) do
		if value >= valueLast and value <= chance then
			return self.events[key]:new()
		end
		valueLast = value
	end
end

picker.findByFilename = function(self, filename)
	for key,event in pairs(self.events) do
		if(event.filename == filename) then
			return event:new()
		end
	end
	return false
end

picker.endCurrentEvent = function(self)
	self.eventCurrent:onEnd()

end

picker.advanceInQue = function(self)
	self.eventCurrent = self.eventNext
	self.eventNext = self:pickEvent()
	self.eventNext:onQue()
end

picker.beginCurrentEvent = function(self)
	self.eventCurrent:onBegin()
end

return picker