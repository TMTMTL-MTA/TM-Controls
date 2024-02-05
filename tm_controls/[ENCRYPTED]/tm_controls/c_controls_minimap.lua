if addPaddingForMinimap then
	function doIHaveAMinimapShowing()
		-- add your code here for whether you have a minimap or not.
		
		if isPlayerHudComponentVisible("radar") then
			return true, 200 -- this is an example, I'm unsure if the radar scales or not? but in 1280x720, 200px puts tm controls above the radar.
		end
		
		return false, 0 -- minimap state, padding
	end
end