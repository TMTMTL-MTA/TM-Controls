< SETUP >

	Simply Drag-n-Drop this resource into your gamemode and add it to your mtaserver.conf or resource startup script and start your server!
	
	In the 'g_controls.lua' file you will find variables you can modify to make TM_Controls fit your liking. Ie; Colours, translation aand the Default Controls pack. You can modify this to your needs and also use it as an example.
	
	To change the font simply drop your font into the /fonts/ folder and change the 'fontFileName' variable.
	You can also modify 'defaultControlFontSize' to change the size of the text.
	
	You can change the 'odsEnabled' variable to 'false' to stop Debug Outputs.
	You can enable 'exampleEnabled' by changing the variable to 'true' to test the given example commands. /testexample and /controls

	In c_controls_minimap you will find the name where you can place your code to return true or false to allow padding for the minimap.
	
	! IT IS HIGHLY RECOMMENDED YOU DO NOT RENAME THE RESOURCE NAME !
	
< SETUP />

< EXPORTED FUNCTIONS >

	- TM_Controls has 4 exported functions.

	< ! CLIENT ! >
	
	bool areControlsImported(string controlPackName)
	-- returns true if the given controlPackName is already imported, returns false if otherwise.
	-- Use this to check if a pack of controls is already imported to tm_controls.
	
	bool importControlPack(string controlPackName, table controlPackTable, string resourceName)
	-- returns true if the given arguments are parsed and the controlPack is loaded, returns false if otherwise.
	-- This can be used to import a pack of controls onClientResourceStart or when you need them to be loaded.
	-- Once the pack is imported it does not need to be imported again unless the resource has been restarted, in which case all imported controlPacks would be lost.
	-- As well as importing and loading with this function, you can use it to replace already loaded controlPacks.
	
	bool showControlPack(string controlPackName)
	-- returns true if the given controlPackName is imported and displayed, returns false if it is not loaded.
	-- This is used to trigger when to show a controlPack to a player.
	
	bool removeControlPack(string controlPackName)
	-- returns true if the given controlPackName is removed from display, returns false if it was not shown.
	-- This is used to trigger when to hide a displayed controlPack from a player.
	
	You may ask why there are no server functions? This is purely because they are unnessacary.
	You should use these functions from the client side when you need to display them for whatever you are doing, ie; You are making a job and you have made a job UI that appears on screen, execute the 'showControlPack' function, when you finish the job and the job UI you have made hides, execute the 'removeControlPack' function.
	
	You will find a .lua script accompanying this resource called 'c_controls_example.lua'.
	In here are 2 examples, one a small client side command that triggers the "Default Controls" as set in 'g_controls.lua' and displays them for 10 seconds, and then hides them.
	And another being an example of a way to import and use control packs from another resource.
	
	Make sure to use the correct 'resourceName' in 'importControlPack', this will ensure the controls are hidden in the event the resource is stopped.
	
	* KEY NAMES *
	** KEY NAMES ARE NOT THE MTA KEY NAMES **
	
	Refer to the 'keyToImage' table inside the 'g_controls.lua' file. Here you can find the current controls that can be displayed and you can also add your own if you choose to do so.

< EXPORTED FUNCTIONS />

< SUPPORT, DISCLAIMER, CREDITS & T'S & C'S >

	This is a free resource for public domain by TMTMTL, designed specifically with the Owl Gaming gamemode and other roleplay gamemodes in mind, but with the possibility of it being used in any gamemode you like.
	
	[ Terms & Conditions:
		1. You will not re-sell or reproduce this resource for profit.
		2. Any modifications you make after installing this resource will invalidate any support.
		3. You will not remove my credits from my resources.
	]
	
	Need help with TM_Controls?
	
	Join the T-MTA @ https://discord.gg/VGGxQ9STbu & Make a ticket to contact me!
	
	If you choose to make any modifications or have any suggestions, why not show them off in the T-MTA Discord?
	
	Credits to 'TMTMTL' for the Lua code.

	Credits to 'Nicolae Berbece' aka 'Zelu' from 'ThoseAwesomeGuys' for the Keyboard & Mouse images.
	These assets are public domain and you can do with them as you please. (Read: https://www.reddit.com/r/gamedev/comments/1z0zid/free_keyboard_and_controllers_prompts_pack/)
	
< SUPPORT, DISCLAIMER, CREDITS & T'S & C'S />