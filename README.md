# mm6-chaos

An attempt to make something similar to Chaos Mod for Grand Theft Auto games but for Might & Magic VI.

Events can be added without altering the core parts by adding new scripts to the chaos/events directory

The event itself is a table.
All event properties are optional.
The events can have 3 functions:

  prepare - is triggered when event appears in que. Is used to compute event's title and result if needed. For example to display the item name or amount of gold while the event is in que
  
  run - main event function which is triggered when the timer reaches 0
  
  restore - is triggered before the next event starts and is used to remove the effects of the event

Events are picked based on their chance property. A ticket approach is used to determine the next event.
Status bar is used to display the event information.
  
