-- Speed increases every second

return {
	title = 'Growing Speed',
	chance = 10,
	speed = 384,
	onSecond = function(self)
		self.speed = self.speed + 1
		mem.u4[0x00908c88] = self.speed
		end,
	onEnd = function(self)
		mem.u4[0x00908c88] = 384
		end,
}