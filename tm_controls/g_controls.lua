addPaddingForMinimap = true -- use c_controls_minimap file to pad the minimap(You will need to add your own code)

odsEnabled = true
exampleEnabled = true -- you can remove this, remove the c_controls_example file and remove it from the meta if you wish.

defaultControlFontSize = 10 -- 8 is good, change at your own risk.
fontFileName = "controlfont.ttf" -- make sure to use the extension.

controlsTitleText = "Game Controls"

backgroundBoxColour = tocolor(0, 0, 0, 100)
titleBackgroundColour = tocolor(0, 0, 0, 200)

titleTextColour = tocolor(255, 255, 255, 255)
subtitleTextColour = tocolor(50, 168, 82, 255)

controlTextColour = tocolor(255, 255, 255, 200)

tooltipTextColour = tocolor(50, 168, 82, 255)
tooltipAccentColour = tocolor(50, 168, 82, 255)
tooltipBoxColour = tocolor(0, 0, 0, 200)

defaultControlPacks = {
	-- default game controls
	["default-controls"] = {
		-- "controlsTitle - The title of the controls displayed in the subheader
		controlsTitle = "Default Controls",
		
		-- "key" - These are not mta key names, they're assigned in keyToImage
		-- "name" - The name of the control
		-- "tooltip" - The description text that will pop up when hovered over
		
		controls = {
			[1] = {key="I", name="Inventory", tooltip="Toggle your characters inventory."},
			[2] = {key="TAB", name="Scoreboard", tooltip="Show the scoreboard of current players."},
			[3] = {key="F1", name="Help Centre", tooltip="Toggle the help centre."},
			[4] = {key="F3", name="Factions", tooltip="Toggle factions window."},
			[5] = {key="F6", name="Languages", tooltip="Toggle languages window."},
			[6] = {key="F10", name="Options", tooltip="Toggle options window."},
			[7] = {key="T", name="Local IC", tooltip="Open Local In Character chat."},
			[8] = {key="Y", name="Radio IC", tooltip="Open Radio In Character chat."},
			[9] = {key="B", name="Local OOC", tooltip="Open Local Out of Character chat."},
			[10] = {key="U", name="Quick Reply", tooltip="Open Quick Reply to reply to your most recent Private Message."},
			[11] = {key="O", name="Friends Panel", tooltip="Toggle the Friends panel."},
			[12] = {key="M", name="Toggle Mouse", tooltip="Toggle your mouse to allow for mouse input."},
		}
	},
}

keyToImage = {
	["-"] = "Minus_Key_Dark",
	["="] = "Plus_Key_Dark",
	["0"] = "0_Key_Dark",
	["1"] = "1_Key_Dark",
	["2"] = "2_Key_Dark",
	["3"] = "3_Key_Dark",
	["4"] = "4_Key_Dark",
	["5"] = "5_Key_Dark",
	["6"] = "6_Key_Dark",
	["7"] = "7_Key_Dark",
	["8"] = "8_Key_Dark",
	["9"] = "9_Key_Dark",
	
	["F1"] = "F1_Key_Dark",
	["F2"] = "F2_Key_Dark",
	["F3"] = "F3_Key_Dark",
	["F4"] = "F4_Key_Dark",
	["F5"] = "F5_Key_Dark",
	["F6"] = "F6_Key_Dark",
	["F7"] = "F7_Key_Dark",
	["F8"] = "F8_Key_Dark",
	["F9"] = "F9_Key_Dark",
	["F10"] = "F10_Key_Dark",
	["F11"] = "F11_Key_Dark",
	["F12"] = "F12_Key_Dark",
	
	["W"] = "W_Key_Dark",
	["A"] = "A_Key_Dark",
	["S"] = "S_Key_Dark",
	["D"] = "D_Key_Dark",
	
	["Q"] = "Q_Key_Dark",
	["E"] = "E_Key_Dark",
	["R"] = "R_Key_Dark",
	["T"] = "T_Key_Dark",
	["Y"] = "Y_Key_Dark",
	["U"] = "U_Key_Dark",
	["O"] = "O_Key_Dark",
	["P"] = "P_Key_Dark",
	["I"] = "I_Key_Dark",
	["C"] = "C_Key_Dark",
	["B"] = "B_Key_Dark",
	["F"] = "F_Key_Dark",
	["G"] = "G_Key_Dark",
	["H"] = "H_Key_Dark",
	["J"] = "J_Key_Dark",
	["K"] = "K_Key_Dark",
	["L"] = "L_Key_Dark",
	["Z"] = "Z_Key_Dark",
	["X"] = "X_Key_Dark",
	["V"] = "V_Key_Dark",
	["N"] = "N_Key_Dark",
	["M"] = "M_Key_Dark",
	
	["MOUSELOOK"] = "Mouse_Simple_Key_Dark",
	["MOUSELEFT"] = "Mouse_Left_Key_Dark",
	["MOUSERIGHT"] = "Mouse_Right_Key_Dark",
	["MOUSEMIDDLE"] = "Mouse_Middle_Key_Dark",
	["TAB"] = "Tab_Key_Dark",
	["SPACE"] = "Space_Key_Dark",
	["LSHIFT"] = "ShiftL_Key_Dark",
	["RSHIFT"] = "ShiftR_Key_Dark",
	["ENTER"] = "Enter_Key_Dark",
	["BACKSPACE"] = "Backspace_Key_Dark",
	["LALT"] = "AltL_Key_Dark",
	["RALT"] = "AltR_Key_Dark",
	
	["ARROWUP"] = "Arrow_Up_Key_Dark",
	["ARROWDOWN"] = "Arrow_Down_Key_Dark",
	["ARROWLEFT"] = "Arrow_Left_Key_Dark",
	["ARROWRIGHT"] = "Arrow_Right_Key_Dark",
	
	["ESC"] = "Esc_Key_Dark",
	["ASTERIX"] = "Asterisk_Key_Dark",
	["BRACKETLEFT"] = "Bracket_Left_Key_Dark",
	["BRACKETRIGHT"] = "Bracket_Right_Key_Dark",
	["CAPSLOCK"] = "Caps_Lock_Key_Dark",
	["DEL"] = "Del_Key_Dark",
	["END"] = "End_Key_Dark",
	["HOME"] = "Home_Key_Dark",
	["INSERT"] = "Insert_Key_Dark",
	["NUMLOCK"] = "Num_Lock_Key_Dark",
	["PAGEDOWN"] = "Page_Down_Key_Dark",
	["PAGEUP"] = "Page_Up_Key_Dark",
	["PRTSCR"] = "Print_Screen_Key_Dark",
}