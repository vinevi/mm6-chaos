-- Receive a random amount of gold

return {
	title = 'Get gold',
	chance = 10,
	gold = 0,
	prepare = function(self)
			self.gold = math.random(1, 1000)
			self.title = '+' .. self.gold ..'g'
		end,
	run = function(self)
			Party.AddGold(self.gold, 0)	
		end,
}