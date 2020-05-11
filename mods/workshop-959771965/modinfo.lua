name = "Mandrake Respawn"
description = "Spawns a new mandrake in the world after one is used up."
author = "Daedalus"
version = "1.2"
forumthread = ""

api_version = 6
api_version_dst = 10

icon = "modicon.tex"
icon_atlas = "modicon.xml"

dont_starve_compatible = true
reign_of_giants_compatible = true
shipwrecked_compatible = true

dst_compatible = true

all_clients_require_mod = false
clients_only_mod = false

configuration_options = 
{
	{
		name = "dist",
		label = "Spawn Distance",
		options =
		{
			{description = "10", data = 10},
			{description = "20", data = 20},
			{description = "30", data = 30},
			{description = "40", data = 40},
			{description = "50", data = 50},
			{description = "60", data = 60},
			{description = "70", data = 70},
			{description = "80", data = 80},
			{description = "90", data = 90},
			{description = "100", data = 100},
		},
		default = 80,
	},
}
