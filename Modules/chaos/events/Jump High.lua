-- Jump height is doubled

return {
	title = 'Jump High',
	chance = 10,
	onBegin = function(self)
		mem.u4[0x00908c90] = 10
		end,
	onEnd = function(self)
		mem.u4[0x00908c90] = 5
		end,
}