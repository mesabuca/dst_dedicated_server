
name = "Extra Equip Slots API Edition"
description = "Adds a backpack, amulet and compass slot to the game. Plus adds space for other mod's slots if you want it to."
author = "xVars & MystPhysX,reuploaded by BUTTERSKY11 VS GAMING"
version = "2.4.4"

forumthread = ""

api_version = 10
priority = 10

--This lets the clients know that they need to download the mod before they can join a server that is using it.
all_clients_require_mod = true

--This let's the game know that this mod doesn't need to be listed in the server's mod listing
client_only_mod = false

--Let the mod system know that this mod is functional with Don't Starve Together
dont_starve_compatible = true
reign_of_giants_compatible = true
dst_compatible = true

--These tags allow the server running this mod to be found with filters from the server listing screen
server_filter_tags = {"extra equip slot eqs"}

icon_atlas = "preview.xml"
icon = "preview.tex"

configuration_options =
{
    {
        name = "slots_count",
        label = "# of Extra Slots",
		hover = "The number of extra slots added by your other mods.",
        options = 
        {
            {description = "None", data = 1.25},
            {description = "1", data = 1.33},
			{description = "2", data = 1.4},
        }, 
        default = 1.25,
    },
	
	{
        name = "compass_state",
        label = "Compass Slot On/Off",
		hover = "Do you want the compass slot on or off?",
        options = 
        {
            {description = "Off", data = 2},
			{description = "On", data = 1},
        }, 
        default = 2,
    },

        {
        name = "amulete_slot",
        label = "Amulet Slot On/Off",
		hover = "Do you want the Amulet slot on or off?",
        options = 
        {
            {description = "Off", data = 2},
			{description = "On", data = 1},
        }, 
        default = 1,
    },
}