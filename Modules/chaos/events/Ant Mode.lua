-- Party height is 0

return {
	title = 'Ant Mode',
	chance = 10,
	onBegin = function(self)
		mem.u4[0x00908c7c] = 0
		mem.u4[0x00908c78] = 0
		end,
	onEnd = function(self)
		mem.u4[0x00908c7c] = 160
		mem.u4[0x00908c78] = 160
		end,
}