return {
	title = 'Double Speed',
	description = 'Double party movement speed',
	chance = 10,
	onBegin = function(self)
		mem.u4[0x00908c88] = 708
		end,
	onEnd = function(self)
		mem.u4[0x00908c88] = 384
		end,
}