scriptVersion = 1.0

controlPacksDisplaying = false

local sx, sy = guiGetScreenSize()
local titleFontElement = dxCreateFont("fonts/"..fontFileName.."", defaultControlFontSize, false, "cleartype")
local scrollAmount = 0
local mouseInControls = false
local overHang = 0
local currentTooltip = false

-- tooltip function
function drawTooltip(text)	
	if currentTooltip and isCursorShowing() then
		local x, y = getCursorPosition()
		local x, y = x * sx, y * sy
		
		local text = tostring(currentTooltip)

		local width = dxGetTextWidth(text, 0.6, titleFontElement, true) + 20
		
		local height = 30
		
		local x = math.max(0, math.min(x, sx))
		local y = math.max(0, math.min(y, sy - height))
		
		dxDrawRectangle(x+15, y + - height/2, width, height, tooltipBoxColour, true)
		dxDrawText(currentTooltip, x+15, y- height/2, x+15 + width, y + height - height/2, tooltipTextColour, 0.6, titleFontElement, "center", "center", false, false, true, true)
	end
end

function drawControlsOnScreen()
	if not controlPacksDisplaying or not #controlPacksDisplaying then return end
	
	local padding = 5
	local left = 10
	local bottom = sy-35 -- -25 spacing if not using Owls default lower admin bar
	
	if addPaddingForMinimap then
		local minimap, padding = doIHaveAMinimapShowing()
	
		bottom = bottom - padding
	end
	
	local titleTextFont = titleFontElement
	local titleFontSize = 0.85
	local titleFontHeight = dxGetFontHeight(titleFontSize, titleTextFont)
	local titleHeight = titleFontHeight+10 -- title bar height
	
	local subtitleTextFont = titleFontElement
	local subTitleFontSize = 0.65
	local subTitleFontHeight = dxGetFontHeight(subTitleFontSize, subtitleTextFont)
	local subTitleHeight = subTitleFontHeight -- title bar height
	
	local controlTitleHeight = #controlPacksDisplaying * subTitleFontHeight -- controls height * 25(25 being the size allocated per control entry)
	local controlHeight = 0
	local controlButtonSize = 30
	local controlTextFontSize = 0.65
	local controlTextFont = titleFontElement
	
	local guiWidth = 0 -- testing, will do maths calculated on image size + text width of longest control name after
	
	for k, v in ipairs(controlPacksDisplaying) do
		local controls = defaultControlPacks[v].controls
		
		local defaultWidth = 50 -- left + padding + 40 + padding
		
		for k, v in pairs(controls) do
			local textWidth = dxGetTextWidth(v.name, controlTextFontSize, controlTextFont)
			
			if defaultWidth + textWidth + padding > guiWidth then -- plus extra spacing for right margin
				guiWidth = defaultWidth + textWidth + padding
			end
		end
		
		controlHeight = controlHeight + (#controls * controlButtonSize) -- 40 is the height per control entry
	end
	
	local guiHeight = titleHeight + controlTitleHeight + controlHeight + padding -- testing, will do maths after
	
	local usingRT = false
	overHang = 0
	if guiHeight > sy-50 then
		overHang = sy-50 - guiHeight
		guiHeight = sy-50
		
		usingRT = true
		
		if not controlRT then
			controlRT = dxCreateRenderTarget(guiWidth, guiHeight-titleHeight, true)
		end
	end
	
	dxDrawRectangle(left, bottom - guiHeight + titleHeight, guiWidth, guiHeight-titleHeight, backgroundBoxColour, false)
	dxDrawRectangle(left, bottom - guiHeight, guiWidth, titleHeight, titleBackgroundColour, false)
	
	if controlRT then
		dxDrawImage(left, bottom - guiHeight + titleHeight, guiWidth, guiHeight-titleHeight, controlRT, 0)
	end
	
	local y = bottom - guiHeight
	
	
	dxDrawText(controlsTitleText, left, bottom - guiHeight, left+guiWidth, bottom - guiHeight+titleHeight, titleTextColour, titleFontSize, titleTextFont, "center", "center")
	
	y = y + titleFontHeight + 20
	
	local oldY = 0
	if controlRT then
		if isMouseInPosition(left, bottom - guiHeight + titleHeight, guiWidth, guiHeight-titleHeight) then
			mouseInControls = true
			
			local lowestScroll = 0
			local highestScroll = overHang
		else
			mouseInControls = false
		end
		
		oldY = y
		y = 8 - scrollAmount
		left = 0
		
		dxSetRenderTarget(controlRT, true)
		dxSetBlendMode("add")
	end
	
	local showCurrentTooltip = false
	for k, v in ipairs(controlPacksDisplaying) do
		dxDrawText(defaultControlPacks[v].controlsTitle, left, y, left+guiWidth, y, subtitleTextColour, subTitleFontSize, subtitleTextFont, "center", "center")
		y = y + subTitleFontHeight/2
		
		local left = left+padding
		for _, control in ipairs(defaultControlPacks[v].controls) do
			dxDrawImage(left, y, controlButtonSize, controlButtonSize, "images/"..keyToImage[control.key]..".png")
			
			if not controlRT then
				if isMouseInPosition(left, y, controlButtonSize, controlButtonSize) then
					showCurrentTooltip = control.tooltip
				end
			else
				if isMouseInPosition(left+10, y+oldY-controlButtonSize/2, controlButtonSize, controlButtonSize) then
					showCurrentTooltip = control.tooltip
				end
			end
			
			local textWidth = dxGetTextWidth(control.name, controlTextFontSize, controlTextFont)
			local left = left + controlButtonSize + padding
			dxDrawText(control.name, left, y, left+textWidth, y+controlButtonSize, controlTextColour, controlTextFontSize, controlTextFont, "center", "center")
			
			y = y + controlButtonSize
		end
		
		y = y + subTitleFontHeight/2
	end
	
	if showCurrentTooltip then
		currentTooltip = showCurrentTooltip
	else
		currentTooltip = false
	end
	
	if controlRT then
		dxSetBlendMode("blend")  -- Restore default blending
		dxSetRenderTarget()      -- Restore default render target
	end
end

function scrollTheControls(button, press)
	if mouseInControls then
		if (press) then -- Only output when they press it down
			if button == "mouse_wheel_down" then
				scrollAmount = scrollAmount + 10
				
				local leScrollAmount = -scrollAmount

				if -leScrollAmount > -(overHang+5) then
					scrollAmount = -(overHang+5)
				end
			elseif button == "mouse_wheel_up" then
				scrollAmount = scrollAmount - 10
				
				if scrollAmount < 0 then
					scrollAmount = 0
				end
			end
		end
	end
end
addEventHandler("onClientKey", root, scrollTheControls)

addEventHandler("onClientResourceStop", root, function (stoppedRes)
	local resName = getResourceName(stoppedRes)
	
	for k, v in pairs(defaultControlPacks) do
		if v.resource then
			if v.resource == resName then
				removeControlPack(k)
			end
		end
	end
end)

-- functions etc --

function ods(message)
	if odsEnabled then
		outputDebugString("[TM_CONTROLS] "..message)
	end
end

function isMouseInPosition(x, y, width, height)
	if (not isCursorShowing()) then
		return false
	end
	local sx, sy = guiGetScreenSize()
	local cx, cy = getCursorPosition()
	local cx, cy = (cx * sx), (cy * sy)
	
	return ((cx >= x and cx <= x + width) and (cy >= y and cy <= y + height))
end

function table.copy(tab, recursive)
    assert(type(tab) == "table", "Bad argument @ 'table.copy' [Expected table at argument 1, got "..(type(theTable)).."]")
    local ret = {}
    for key, value in pairs(tab) do
        if (type(value) == "table") and (type(recursive) == "boolean") and (recursive == true) then
            ret[key] = table.copy(value)
        else
            ret[key] = value
        end
    end
    return ret
end

function removeAndAdjust(table, controlPack)
    local newTable = {}
	
    for k, v in ipairs(table) do
        if v == controlPack then
            table[k] = nil
		else
			newTable[#newTable+1] = v
        end
    end

    return newTable
end

function findControlPackIndex(controlPack)
	if controlPacksDisplaying then
		for k, v in pairs(controlPacksDisplaying) do
			if v == controlPack then 
				return k
			end
		end
	end
	
	return false
end

function areControlsImported(controlPackName)
	if not defaultControlPacks[controlPackName] then
		return false
	end
	
	return true
end

function importControlPack(controlPackName, controlPackTable, resourceName)
	if controlPackTable and type(controlPackTable) == "table" then
	
		if not defaultControlPacks[controlPackName] then
			defaultControlPacks[controlPackName] = table.copy(controlPackTable, true)
			
			defaultControlPacks[controlPackName].resource = resourceName
			
			if defaultControlPacks[controlPackName] then
				ods("Successfully imported control pack: "..controlPackName..".")
				
				return true
			end
		else
			defaultControlPacks[controlPackName] = table.copy(controlPackTable, true)
			
			defaultControlPacks[controlPackName].resource = resourceName
			
			if defaultControlPacks[controlPackName] then
				ods("Successfully imported and replaced control pack: "..controlPackName..".")
				
				return true
			end
		end
	end
end

function showControlPack(controlPack)
	if not controlPacksDisplaying then
		controlPacksDisplaying = {}
		addEventHandler("onClientHUDRender", root, drawControlsOnScreen)
		addEventHandler("onClientRender", root, drawTooltip)
	end
	
	if not defaultControlPacks[controlPack] then
		return false
	end
	
	if findControlPackIndex(controlPack) then
		-- already displaying
		return false
	end
	
	controlPacksDisplaying[#controlPacksDisplaying+1] = controlPack
	
	return true
end

function removeControlPack(controlPack)
	if controlPacksDisplaying then
		local index = findControlPackIndex(controlPack)
		if index then
			controlPacksDisplaying = removeAndAdjust(controlPacksDisplaying, controlPack)
			
			if controlRT and isElement(controlRT) then
				destroyElement(controlRT)
			end
			
			scrollAmount = 0
			controlRT = false
			
			if #controlPacksDisplaying == 0 then
				controlPacksDisplaying = false
				
				removeEventHandler("onClientHUDRender", root, drawControlsOnScreen)
				removeEventHandler("onClientRender", root, drawTooltip)
			end
			
			return true
		end
	end
	
	return false
end