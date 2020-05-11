name = "Eternal Glowcaps & Mushlights"
version = "18.1.2"
author = "adai1198"
description = "Version: "..version.."\n"..
"\n"..
"\"Oh shiny!\"\n"..
"\n"..
"Spores, Light Bulbs, and Glow Berries will stop perishing while in Mushlights or Glowcaps.\n"..
"\n"
forumthread = ""
api_version = 10
icon_atlas = "modicon.xml"
icon = "modicon.tex"
dont_starve_compatible = false
reign_of_giants_compatible = false
shipwrecked_compatible = false
dst_compatible = true
all_clients_require_mod = true
client_only_mod = false
server_filter_tags = {}

configuration_options =
{
    {
        name = "winter_tree",
        label = "Winter Tree",
        --hover = "",
        options =
        {
            {description = "Disable", data = 0, hover = ""},
            {description = "Eternal", data = 1, hover = ""},
        },
        default = 0
    },
    {
        name = "glowcap",
        label = "Glowcap",
        --hover = "",
        options =
        {
            {description = "Disable", data = 0, hover = ""},
            {description = "Eternal", data = 1, hover = ""},
        },
        default = 1
    },
    {
        name = "mushlight",
        label = "Mushlight",
        --hover = "",
        options =
        {
            {description = "Disable", data = 0, hover = ""},
            {description = "Eternal", data = 1, hover = ""},
        },
        default = 1
    },
}