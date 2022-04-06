DensityMultiplier = Config.DensityMultiplier
Citizen.CreateThread(function() 
	if Config.DisableAmbulance then
		for i = 1, 32 do
			Citizen.InvokeNative(0xDC0F817884CDD856, i, false) -- Stop Ambulance from responding to dead NPCs
		end
	end
	
	while true do
		Citizen.Wait(0)
		local playerPed = GetPlayerPed(-1)
		local playerLocalisation = GetEntityCoords(playerPed)
		
		if Config.DisableCops then
			ClearAreaOfCops(playerLocalisation.x, playerLocalisation.y, playerLocalisation.z, 400.0)
		end
		
		if Config.StopAngryNpc then
			SetRelationshipBetweenGroups(2, GetHashKey("AMBIENT_GANG_HILLBILLY"), GetHashKey('PLAYER'))
		end
		
		SetVehicleDensityMultiplierThisFrame(DensityMultiplier)
	    SetPedDensityMultiplierThisFrame(DensityMultiplier)
	    SetRandomVehicleDensityMultiplierThisFrame(DensityMultiplier)
	    SetParkedVehicleDensityMultiplierThisFrame(DensityMultiplier)
	    SetScenarioPedDensityMultiplierThisFrame(DensityMultiplier, DensityMultiplier)

	end
end)