-- Monsters stay in place

return {
	title = 'Stop Monsters',
	chance = 10,
	onBegin = function(self)
		-- Outdoor
		mem.asmpatch(0x00461590, [[
			RET
		]])
		-- Indoor
		mem.asmpatch(0x00460780, [[
			RET
		]])
		end,
	onEnd = function(self)
		-- Outdoor
		mem.asmpatch(0x00461590, [[
			SUB ESP,0x40
		]])
		-- Indoor
		mem.asmpatch(0x00460780, [[
			SUB ESP,0x80
		]])
		end,
}



