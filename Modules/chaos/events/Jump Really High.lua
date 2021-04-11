-- Jump height is multiplied

return {
	title = 'Jump Really High',
	chance = 10,
	onBegin = function(self)
		mem.u4[0x00908c90] = 25
		end,
	onEnd = function(self)
		mem.u4[0x00908c90] = 5
		end,
}