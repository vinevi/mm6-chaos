-- Party height is 0

return {
	title = 'Chad Mode',
	chance = 10,
	onBegin = function(self)
		mem.u4[0x00908c7c] = 320
		mem.u4[0x00908c78] = 320
		end,
	onEnd = function(self)
		mem.u4[0x00908c7c] = 160
		mem.u4[0x00908c78] = 160
		end,
}