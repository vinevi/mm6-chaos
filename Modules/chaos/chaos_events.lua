local RandomEvents = {}

function RandomEvents.register(RandomEvent)
	return {
		RandomEvent:new {
			title = 'Get item',
			chance = 1000,
			item = nil,
			prepare = function(self)
					self.index = math.random(1, 580)
					local name = Game.ItemsTxt[self.index].Name
					self.title = 'x1 ' .. name
				end,
			callback = function(self)
					evt.GiveItem(1,0)
				end,
		},
		RandomEvent:new {
			title = 'Get gold',
			chance = 15,
			gold = 0,
			prepare = function(self)
					self.gold = math.random(1, 1000)
					self.title = '+' .. self.gold ..'g'
				end,
			callback = function(self)
					Party.AddGold(self.gold, 0)	
				end,
		},
	}
end

return RandomEvents