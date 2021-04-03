local chaos = {}

function chaos.init(self)
	self:loadEvents()
end

function chaos.loadEvents(self)
	local eventList = require('chaos/events')
	if(eventList) then
		local eventInfo = {}
		local baseEvent = require('chaos/event')
		local events = {}
		for key,eventInfo in pairs(eventList) do
			eventObject = require('chaos/events/' .. eventInfo.filename )
			eventObject.chance = eventInfo.chance
			setmetatable(eventObject, eventObject)
			eventObject.__index = baseEvent
			table.insert(events, eventObject)
		end
		self.events = events
	end
end

function chaos.createChanceTable(self)

return chaos

-- RandomPicker = { -- is used to pick next random event and hold the chance table
-- 	randomTable = {},
-- 	eventsTotal = nil,
-- 	chanceTotal = 0,
-- 	pickEvent = function(self)
-- 			local random = math.random(1, self.chanceTotal)
-- 			local lastValue = 0
-- 			for key,value in pairs(self.randomTable) do
-- 				if random >= lastValue and random <= value then
-- 					return key
-- 				end
-- 				lastValue = value
-- 			end
-- 			return 1
-- 		end,
-- 	init = function(self, events)
-- 			self.eventsTotal = #events
-- 			local total = 0
-- 			for key,event in pairs(events) do
-- 				local chance = event.chance
-- 				total = total + chance
-- 				table.insert(self.randomTable, total)
-- 			end
-- 			self.chanceTotal = total
-- 		end,
-- }

-- RandomEventManager = { -- main manager
-- 	timer = nil,
-- 	timerMax = 10,
-- 	eventsTotal = nil,
-- 	events = {},
-- 	eventCurrent = nil,
-- 	eventNext = nil,
-- 	onCycle = function(self)
-- 			if(self.eventCurrent) then
-- 				local permanent = self.eventCurrent.permanent
-- 				if(permanent == false) then
-- 					self.eventCurrent:callbackRestore()
-- 				end
-- 			end
-- 			if(self.eventNext) then
-- 				self.eventNext:callback()
-- 			end
-- 			self:updateNextEvent()
-- 		end,
-- 	updateNextEvent = function(self)
-- 			self.eventCurrent = self.eventNext
-- 			local newIndex = RandomPicker:pickEvent()
-- 			local newEvent = self.events[newIndex]:new{}
-- 			newEvent:prepare()
-- 			self.eventNext = newEvent
-- 		end,
-- 	getTimeLeft = function(value)
-- 			if(value < 10) then
-- 				value = 0 .. value
-- 			end
-- 			return '00:' .. value
-- 		end,
-- 	whitespaceSymbol = ' ',
-- 	maxEventTitleLength = 14,
-- 	createWhitespaceString = function(self, length)
-- 			local title = ''
-- 			for i = 1, length do
-- 				title = title .. self.whitespaceSymbol
-- 			end
-- 			return title
-- 		end,

-- 	getTitle = function(self, event, right)
-- 			local title = ''
-- 			if(event) then
-- 				title = event.title
-- 				local length = string.len(title)
-- 				local remainder = self.maxEventTitleLength - length
-- 				if(remainder >= 0) then
-- 					local padding = self:createWhitespaceString(remainder) -- adding whitespace in order to center the timer
-- 					if( right == true ) then
-- 							title = title .. padding
-- 						else
-- 							title = padding .. title
-- 					end
-- 				else
-- 					remainder = math.abs(remainder)
-- 					local stringEnd = length - remainder
-- 					title = string.sub(title, 0, stringEnd)
-- 				end
-- 			else
-- 				title = self:createWhitespaceString(self.maxEventTitleLength)
-- 			end
-- 			return title
-- 		end,

-- 	updateStatusBar = function(self)
-- 			self.timer = (self.timer - 1) % (self.timerMax + 1)
-- 			local timeleft = self.getTimeLeft(self.timer)

-- 			local titleCurrent = self:getTitle(self.eventCurrent)
-- 			local titleNext = self:getTitle(self.eventNext, true)

-- 			local statusText =  titleCurrent .. ' > ' .. timeleft .. ' > ' .. titleNext
-- 			Game.ShowStatusText(statusText, const.Minute)
-- 		end,
--  	init = function(self)
-- 			self.timer = self.timerMax
-- 			function events.LoadMap()
-- 				self.events = randomEvents.register(RandomEvent)
-- 				RandomPicker:init(self.events)
-- 				self:updateNextEvent()
-- 				Timer(function()
-- 					if (self.timer == 0) then
-- 						self:onCycle()
-- 					end
-- 					self:updateStatusBar()
-- 				end, const.Minute)
-- 			end
-- 		end,
-- }

-- RandomEventManager:init()

