# mm6-chaos

The mod runs custom events based on timer. Each 30 seconds a random event happens. That is intended to turn gameplay into a chaotic experience.

Installation:
	1. Install MMExtension
	2. Copy-paste the code into the /Scripts/ directory

Events:

The mod is intended to be modular to allow adding and removing events without altering the core.
The event picker will read the files in the /events/ directory and import them as events.

Each event can have the following functions:
	onQue - is used to compute the title / result while the event is in que
	onBegin - event's main action
	onEnd - remove the effect after event has finished
	onMinute - called every in-game minute
	onSecond - called every in-game second

All of them are optional.

The events are picked based on their "chance" attribute. The algorithm uses a ticket system in order to make random choises.