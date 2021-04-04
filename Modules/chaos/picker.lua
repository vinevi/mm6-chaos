local util = require('chaos.util')
local BaseEvent = require('chaos.event')
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
	for path in _G.path.find(AppPath .. "scripts/modules/chaos/events/*.lua") do
		local filename = util.getFilenameFromPath(path)
		path = 'chaos.events.'  .. filename
		local newEvent = require(path)
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
	local eventNext = self:findByChance(value)
	self:setNextEvent(eventNext)
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

picker.setNextEvent = function(self, eventNext)
	self.eventCurrent:restore()
	self.eventCurrent = self.eventNext
	self.eventCurrent:run()
	self.eventNext = eventNext
	self.eventNext:prepare()
end

return picker