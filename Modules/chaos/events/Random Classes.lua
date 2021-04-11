return {
	title = 'Random Classes',
	description = 'Each player gets a random class',
	chance = 10,
	onBegin = function(self)
			for _, player in Party do
				local newClass = math.random(0, 17)
				player.Class = newClass
			end
		end,
}

