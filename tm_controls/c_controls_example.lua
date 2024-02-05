if exampleEnabled then
	-- [[ EXAMPLE 1 ]] --
	local gameControlsTimer = false

	function openGameControls()
		showControlPack("default-controls")
		
		if gameControlsTimer and isTimer(gameControlsTimer) then killTimer(gameControlsTimer) end
		
		gameControlsTimer = setTimer(function()
			removeControlPack("default-controls")
			
			gameControlsTimer = false
		end, 10000, 1)
	end
	addCommandHandler("controls", openGameControls)
	addCommandHandler("testexample1", openGameControls)

	-- [[ EXAMPLE 2 ]] --
	local exampleControlsTimer = false

	local exampleControls = {
		controlsTitle = "More Controls",
		
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
	}

	function importAndShowControlPackExample()
		if not exports["tm_controls"]:areControlsImported("example-controls") then
			exports["tm_controls"]:importControlPack("example-controls", exampleControls, "tm_controls")
		end
		
		exports["tm_controls"]:showControlPack("example-controls")
		
		if exampleControlsTimer and isTimer(exampleControlsTimer) then killTimer(exampleControlsTimer) end
		
		exampleControlsTimer = setTimer(function()
			exports["tm_controls"]:removeControlPack("example-controls")
		end, 15000, 1)
	end
	addCommandHandler("testexample2", importAndShowControlPackExample
	
	)-- [[ EXAMPLE 1 ]] --
	local exampleControlsTimer = false

	local exampleControls = {
		controlsTitle = "Even More Controls",
		
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
	}

	function importAndShowControlPackExample2()
		if not exports["tm_controls"]:areControlsImported("example-controls2") then
			exports["tm_controls"]:importControlPack("example-controls2", exampleControls, "tm_controls")
		end
		
		exports["tm_controls"]:showControlPack("example-controls2")
		
		if exampleControlsTimer and isTimer(exampleControlsTimer) then killTimer(exampleControlsTimer) end
		
		exampleControlsTimer = setTimer(function()
			exports["tm_controls"]:removeControlPack("example-controls2")
		end, 20000, 1)
	end
	addCommandHandler("testexample3", importAndShowControlPackExample2)
end