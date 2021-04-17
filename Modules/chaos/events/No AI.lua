return {
	title = 'No AI',
	description = 'Disables NPC logic',
	chance = 10,
	onBegin = function(self)
		-- prevent movement (indoor)
		mem.asmpatch(0x00401762, [[
			JMP absolute 0x0040178e
		]])
		-- prevent movement (outdoor)
		mem.asmpatch(0x00401238, [[
			JMP absolute 0x00401264
		]])

		-- prevent decision making
		mem.asmpatch(0x00402189, [[
			JMP absolute 0x0040267d
		]])
		end,
	onEnd = function(self)
		-- restore movement (indoor)
		mem.asmpatch(0x00401762, [[
			MOV ECX,0x4c6340
		]])
		-- restore movement (outdoor)
		mem.asmpatch(0x00401238, [[
			MOV ECX,0x4c6340
		]])

		-- restore decision making
		mem.asmpatch(0x00402189, [[
			CALL absolute 0x004ae22b
		]])
		end,
}

