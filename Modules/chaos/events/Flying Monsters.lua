return {
	title = 'Flying Monsters',
	description = 'Map monsters can fly now',
	chance = 10,
	onBegin = function(self)
			for _, monster in Game.Map.Monsters do
				monster.Fly = true
			end
		end,
}