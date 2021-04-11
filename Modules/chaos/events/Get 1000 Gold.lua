return {
	title = 'Get 1000 gold',
	description = 'Get 1000 gold',
	chance = 10,
	onBegin = function(self)
			Party.AddGold(1000, 0)	
		end,
}