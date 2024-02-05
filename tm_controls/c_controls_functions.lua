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