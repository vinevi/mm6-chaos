return {
	title = 'Jump High',
	description = 'Jump height is doubled',
	chance = 10,
	onBegin = function(self)
		mem.u4[0x00908c90] = 10
		end,
	onEnd = function(self)
		mem.u4[0x00908c90] = 5
		end,
}