-- Receive a random item

return {
	title = 'Get item',
	item = nil,
	chance = 10,
	prepare = function(self)
			self.item = math.random(1, 580)
			self.title = Game.ItemsTxt[self.item].Name
		end,
	run = function(self)
			evt.GiveItem{Id = self.item}
		end,
}