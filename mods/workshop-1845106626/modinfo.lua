name = "Smarter Ice Flingomatic"
description = "Ice Flingomatic will detect fire and put it off more accurately even if it's turned off."
forumthread = ""
author = "辣椒小皇纸"
version = "1.3.0"
api_version = 10
dont_starve_compatible = false
reign_of_giants_compatible = false
shipwrecked_compatible = false
dst_compatible = true
all_clients_require_mod = false
client_only_mod = false

priority = -1000.20190918

icon_atlas = "modicon.xml"
icon = "modicon.tex"

----------------------
-- General settings --
----------------------

configuration_options =
{
    {
        name = "more_fuel",
        label = "More Fuel",
        hover = "",
        options =   {
                        {description = "Default", data = 1, hover = ""},
                        {description = "x2", data = 2, hover = ""},
                        {description = "x3", data = 3, hover = ""},
                        {description = "x4", data = 4, hover = ""},
                        {description = "x5", data = 5, hover = ""},
                    },
        default = 1,
    },
}