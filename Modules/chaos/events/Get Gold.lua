-- Receive a random amount of gold

return {
	title = 'Get Gold',
	chance = 10,
	gold = 0,
	onQue = function(self)
			self.gold = math.random(1, 1000)
			self.title = '+' .. self.gold ..'g'
		end,
	onBegin = function(self)
			Party.AddGold(self.gold, 0)	
		end,
}