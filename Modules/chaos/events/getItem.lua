return {
	title = 'Get item',
	item = nil,
	prepare = function(self)
			self.index = math.random(1, 580)
			local name = Game.ItemsTxt[self.index].Name
			self.title = 'x1 ' .. name
		end,
	run = function(self)
			evt.GiveItem(index)
		end,
}