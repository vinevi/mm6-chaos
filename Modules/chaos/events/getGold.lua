return {
	title = 'Get gold',
	gold = 0,
	chance = 1000,
	prepare = function(self)
			self.gold = math.random(1, 1000)
			self.title = '+' .. self.gold ..'g'
		end,
	run = function(self)
			Party.AddGold(self.gold, 0)	
		end,
}