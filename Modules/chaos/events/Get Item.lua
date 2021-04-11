-- Receive a random item

return {
	title = 'Get Item',
	chance = 10,
	item = nil,
	onQue = function(self)
			self.item = math.random(1, 580)
			self.title = Game.ItemsTxt[self.item].Name
		end,
	onBegin = function(self)
			evt.GiveItem{Id = self.item}
		end,
}