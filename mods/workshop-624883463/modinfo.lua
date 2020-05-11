-- This information tells other players more about the mod
name = "Stackable Equipments"
description = "Allow your equipments to stack up."
author = "zUsername"
version = "1.0.9a"
forumthread = ""


-- This lets other players know if your mod is out of date, update it to match the current version in the game
api_version = 6
api_version_dst = 10

dst_compatible = true

dont_starve_compatible = true
reign_of_giants_compatible = true
shipwrecked_compatible = true

all_clients_require_mod = true
client_only_mod = false

priority = -999999999

icon_atlas = "modicon.xml"
icon = "modicon.tex"

server_filter_tags = {}

configuration_options =
{
	{
		name = "StackSize",
		label = "Max stack size",
		hover = "Choose max stack size for your equipments.",
		options =	
		{
			{description = "5", data = 5},
			{description = "10", data = 10},
			{description = "15", data = 15},
			{description = "20", data = 20},
			{description = "25", data = 25},
			{description = "30", data = 30},
			{description = "35", data = 35},
			{description = "40", data = 40},
		},
		default = 10,
	},
	{
		name = "DropWholeStack",
		label = "Drop whole stack",
		hover = "Items are slippery it will drop whole stack.",
		options =	
		{
            {description = "Yes", data = true},
            {description = "No", data = false},
		},
		default = true,
	},
}