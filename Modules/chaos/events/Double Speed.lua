-- Double party movement speed

return {
	title = 'Double Speed',
	chance = 10,
	onBegin = function(self)
			mem.bytecodepatch(0x00908c88, [[
				180
			]])
		end,
}