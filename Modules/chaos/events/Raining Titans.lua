return {
	title = "Raining Titans",
	description = "Titans appear from the sky",
	chance = 30,
	onMinute = function(self)
		SummonMonster(166, Party.X, Party.Y, Party.Z + 1000, true)
	end
}