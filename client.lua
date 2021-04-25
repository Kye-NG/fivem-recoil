local currentPlayerPedId = nil

AddEventHandler('playerSpawned', function()
	currentPlayerPedId = PlayerPedId()
end)

Citizen.CreateThread(function()
	currentPlayerPedId = PlayerPedId()

	while true do
		Citizen.Wait(0)

		local car = GetVehiclePedIsIn(currentPlayerPedId, false)
		if car then
			if GetPedInVehicleSeat(car, -1) == currentPlayerPedId then
				SetPlayerCanDoDriveBy(currentPlayerPedId, false)
			else
				SetPlayerCanDoDriveBy(currentPlayerPedId, false)
			end
		end

		-- Shooting check and adding recoil.
		if IsPedShooting(currentPlayerPedId) and NoRecoilCheck() then
			if GetFollowPedCamViewMode() == 4 then -- First Person
				RecoilFirstPersonMultiplier(0.5, 0.5)
			elseif GetFollowPedCamViewMode() ~= 4 then -- Third Person
				RecoilThirdPersonMultiplier(0.5, 0.5)
			end
		end
	end
end)

function RecoilFirstPersonMultiplier(FirstPersonMultiplier,FirstPersonAimingMultiplier)
	local getwidthrecoil = GetGameplayCamRelativeHeading()
	local widthrecoil = math.random() + math.random() - math.random() - math.random()
	SetGameplayCamRelativeHeading(getwidthrecoil + widthrecoil * FirstPersonMultiplier)

	local getheightrecoil = GetGameplayCamRelativePitch()
	local heightrecoil = math.random() + math.random()
	SetGameplayCamRelativePitch(getheightrecoil + heightrecoil * FirstPersonMultiplier, 1.0)
	if IsControlPressed(0, 25) then --RMB aim
		local getwidthrecoil = GetGameplayCamRelativeHeading()
		local widthrecoil = math.random() + math.random() - math.random() - math.random()
		SetGameplayCamRelativeHeading(getwidthrecoil + widthrecoil * FirstPersonAimingMultiplier)

		local getheightrecoil = GetGameplayCamRelativePitch()
		local heightrecoil = math.random() + math.random() + math.random() + math.random() + math.random()
		SetGameplayCamRelativePitch(getheightrecoil + heightrecoil * FirstPersonAimingMultiplier, 1.0)
		Citizen.Wait(0)
	end
end

function RecoilThirdPersonMultiplier(ThirdPersonMultiplier,ThirdPersonAimingMultiplier)
	local getwidthrecoil = GetGameplayCamRelativeHeading()
	local widthrecoil = math.random() + math.random() - math.random() - math.random()
	SetGameplayCamRelativeHeading(getwidthrecoil + widthrecoil * ThirdPersonMultiplier)

	local getheightrecoil = GetGameplayCamRelativePitch()
	local heightrecoil = math.random() + math.random()
	SetGameplayCamRelativePitch(getheightrecoil + heightrecoil * ThirdPersonMultiplier, 1.0)

	if IsControlPressed(0, 25) then --RMB aim
		local getwidthrecoil = GetGameplayCamRelativeHeading()
		local widthrecoil = math.random() + math.random() - math.random() - math.random()
		SetGameplayCamRelativeHeading(getwidthrecoil + widthrecoil * ThirdPersonAimingMultiplier)

		local getheightrecoil = GetGameplayCamRelativePitch()
		local heightrecoil = math.random() + math.random()
		SetGameplayCamRelativePitch(getheightrecoil + heightrecoil * ThirdPersonAimingMultiplier, 1.0)
		Citizen.Wait(0)
	end
end

function NoRecoilCheck()
	if GetWeapontypeGroup(GetSelectedPedWeapon(currentPlayerPedId)) == 2685387236 then
		return false
	elseif GetWeapontypeGroup(GetSelectedPedWeapon(currentPlayerPedId)) == 1548507267 then
		return false
	elseif GetWeapontypeGroup(GetSelectedPedWeapon(currentPlayerPedId)) == 4257178988 then
		return false
	elseif GetSelectedPedWeapon(currentPlayerPedId) == GetHashKey("weapon_minigun") then
		return false
	elseif GetSelectedPedWeapon(currentPlayerPedId) == GetHashKey("weapon_rayminigun") then
		return false
	else
		return true
	end
end