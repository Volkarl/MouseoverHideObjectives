# World of Warcraft Addon: MouseoverHideObjectives

Works with Battle For Azeroth 8.0.1

Hides the objectives frame (all tracked quests and achievements) after a few seconds when not in use.
It is re-opened by a lot of events that affect quests, as well as whenever the minimap is moused over.

## Implementation details
The reason it works with minimap mouseovers instead of objectiveFrame mouseovers, is because when I tried that, it cause the entire objectiveFrame (basically the right 1/3 of the screen) to not be click-through any longer. This meant that you could no longer interact with objects behind the full-size quest log, regardless of how many quests you were actually tracking.
