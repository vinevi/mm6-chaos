return {
	title = 'Invisible Objects',
	description = 'Map objects are hidden',
	chance = 10,
	onBegin = function(self)
		mem.nop(0x0046a1f4)
		end,
	onEnd = function(self)
		mem.asmpatch(0x0046a1f4, [[
			CALL absolute 0x00469380
		]])
		end,
}

