--██╗░░░░░░█████╗░███╗░░██╗░█████╗░███████╗██╗░░░░░░█████╗░████████╗  ██████╗░███████╗██╗░░░██╗
--██║░░░░░██╔══██╗████╗░██║██╔══██╗██╔════╝██║░░░░░██╔══██╗╚══██╔══╝  ██╔══██╗██╔════╝██║░░░██║
--██║░░░░░███████║██╔██╗██║██║░░╚═╝█████╗░░██║░░░░░██║░░██║░░░██║░░░  ██║░░██║█████╗░░╚██╗░██╔╝
--██║░░░░░██╔══██║██║╚████║██║░░██╗██╔══╝░░██║░░░░░██║░░██║░░░██║░░░  ██║░░██║██╔══╝░░░╚████╔╝░
--███████╗██║░░██║██║░╚███║╚█████╔╝███████╗███████╗╚█████╔╝░░░██║░░░  ██████╔╝███████╗░░╚██╔╝░░
--╚══════╝╚═╝░░╚═╝╚═╝░░╚══╝░╚════╝░╚══════╝╚══════╝░╚════╝░░░░╚═╝░░░  ╚═════╝░╚══════╝░░░╚═╝░░░

local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118, ["Enter"] = 191
}

RegisterFontFile('font4thai')
fontId = RegisterFontId('font4thai')

ESX = exports['es_extended']:getSharedObject()
Array = {}


Citizen.CreateThread(function()
    for k, v in pairs(Config.Position) do
        RequestModel(GetHashKey(v.model))
        while not HasModelLoaded(GetHashKey(v.model)) do Wait(1) end
        Array[v] = CreatePed(4, v.model, v.npc.x, v.npc.y, v.npc.z - 1.0, v.h,
                             false, true)
        FreezeEntityPosition(Array[v], true)
        SetEntityInvincible(Array[v], true)
        SetBlockingOfNonTemporaryEvents(Array[v], true)
    end
end)

Citizen.CreateThread(function()
	for k, v in pairs(Config.Position) do
        if v.blips then
			if v.blips.open then
				local blip = AddBlipForCoord(v.npc.x, v.npc.y, v.npc.z)
				SetBlipSprite(blip, v.blips.Id)
				SetBlipDisplay(blip, 3)
				SetBlipScale(blip, v.blips.Size)
				SetBlipColour(blip, v.blips.Color)
				SetBlipAsShortRange(blip, true)
				AddTextEntry('BLIP_SELL', v.blips.Text)
				BeginTextCommandSetBlipName("BLIP_SELL")
				EndTextCommandSetBlipName(blip)
			end
        end
    end
end)

local sleep = true
Citizen.CreateThread(function()
	local inZone = false 
	local enteredZone = false 
    while true do
        Citizen.Wait(0)
        
		sleep = true
		inZone = false
        for k, v in pairs(Config.Position) do
            if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.npc.x, v.npc.y, v.npc.z, true) <= Config["Distance"] then
				sleep = false
				inZone = true
                if IsControlPressed(0, Config["Key"]) then
					if ESX.GetPlayerData().job.name == 'unemployed' or checkHasItem(Config["Item"]) then
						SetNuiFocus(true, true)
						SendNUIMessage({
							showUI = true; 
						})
					else
						pNotify('คุณไม่มีบัตรย้ายโรงเรียน', "error")
						Wait(5000)
					end
				end
            end
        end
		
		if not enteredZone and inZone then
			--exports['L4N_Text']:Show(Config["Notification"])
			--exports['cc_text_UI']:ShowHelpNotification(Config["Notification"])
			enteredZone = true
		elseif enteredZone and not inZone then
			--exports['L4N_Text']:Hide()
			enteredZone = false
		end
			
		if sleep then
			Citizen.Wait(500)
		end
    end
end)

RegisterNetEvent('L4N:STARTSCHOOL')
AddEventHandler('L4N:STARTSCHOOL', function()
    SetNuiFocus(true, true)
    SendNUIMessage({
        showUI = true; 
    }) 
end)

RegisterNUICallback("L4N:RANDOMSCHOOL",function(data)
    SetNuiFocus(false, false)
	SendNUIMessage({
        showUI = false; 
    })
	TriggerEvent("mythic_progbar:client:progress", {
		name = "unique_action_name",
		duration = Config["Progbar_Time"],
		label = "",
		useWhileDead = false,
		canCancel = true,
		controlDisables = {
			disableMovement = true,
			disableCarMovement = false,
			disableMouse = false,
			disableCombat = false,
			},
			
		}, function(status)
		if not status then
			SchoolId = sc()
			print(SchoolId)
			TriggerServerEvent('L4N:SCHOOLSERVER'..SchoolId..'')
			TriggerServerEvent('L4N:SCHOOL:Remove')
			if Config.School[SchoolId].Teleport.Enabled then
				LoadFreeze()
				SetEntityCoords(PlayerPedId(), Config.School[SchoolId].Teleport.coords)
			end
		end
	end)
end)

RegisterNUICallback("L4N:SCHOOL1",function(data)
    SetNuiFocus(false, false)
	SendNUIMessage({
        showUI = false; 
    })
	if Config.School[1].Enabled then
		TriggerEvent("mythic_progbar:client:progress", {
			name = "unique_action_name",
			duration = Config["Progbar_Time"],
			label = "",
			useWhileDead = false,
			canCancel = true,
			controlDisables = {
				disableMovement = true,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = false,
				},
				
			}, function(status)
			if not status then
				TriggerServerEvent('L4N:SCHOOLSERVER1')
				TriggerServerEvent('L4N:SCHOOL:Remove')
				if Config.School[1].Teleport.Enabled then
					LoadFreeze()
					SetEntityCoords(PlayerPedId(), Config.School[1].Teleport.coords)
				end
			end
		end)
	else
		pNotify(Config["NotifyError"], 'error')
	end
end)

RegisterNUICallback("L4N:SCHOOL2",function(data)
    SetNuiFocus(false, false)
	SendNUIMessage({
        showUI = false; 
    })
	if Config.School[2].Enabled then
   	TriggerEvent("mythic_progbar:client:progress", {
		name = "unique_action_name",
		duration = Config["Progbar_Time"],
		label = "",
		useWhileDead = false,
		canCancel = true,
		controlDisables = {
			disableMovement = true,
			disableCarMovement = false,
			disableMouse = false,
			disableCombat = false,
			},
			
		}, function(status)
		if not status then
			 TriggerServerEvent('L4N:SCHOOLSERVER2')
			 TriggerServerEvent('L4N:SCHOOL:Remove')
			 if Config.School[2].Teleport.Enabled then
				LoadFreeze()
				SetEntityCoords(PlayerPedId(), Config.School[2].Teleport.coords)
			end
		end
	end)
	else
		pNotify(Config["NotifyError"], 'error')
	end
end)

RegisterNUICallback("L4N:SCHOOL3",function(data)
    SetNuiFocus(false, false)
	SendNUIMessage({
        showUI = false; 
    })
	if Config.School[3].Enabled then
    TriggerEvent("mythic_progbar:client:progress", {
		name = "unique_action_name",
		duration = Config["Progbar_Time"],
		label = "",
		useWhileDead = false,
		canCancel = true,
		controlDisables = {
			disableMovement = true,
			disableCarMovement = false,
			disableMouse = false,
			disableCombat = false,
			},
		}, function(status)
		if not status then
			 TriggerServerEvent('L4N:SCHOOLSERVER3')
			 TriggerServerEvent('L4N:SCHOOL:Remove')
			 if Config.School[3].Teleport.Enabled then
				LoadFreeze()
				SetEntityCoords(PlayerPedId(), Config.School[3].Teleport.coords)
			end
		end
	end)
	else
		pNotify(Config["NotifyError"], 'error')
	end
end)

RegisterNUICallback("L4N:SCHOOL4",function(data)
     SetNuiFocus(false, false)
	SendNUIMessage({
        showUI = false; 
    })
	if Config.School[4].Enabled then
    TriggerEvent("mythic_progbar:client:progress", {
		name = "unique_action_name",
		duration = Config["Progbar_Time"],
		label = "",
		useWhileDead = false,
		canCancel = true,
		controlDisables = {
			disableMovement = true,
			disableCarMovement = false,
			disableMouse = false,
			disableCombat = false,
			},
		}, function(status)
		if not status then
			 TriggerServerEvent('L4N:SCHOOLSERVER4')
			 TriggerServerEvent('L4N:SCHOOL:Remove')
			 if Config.School[4].Teleport.Enabled then
				LoadFreeze()
				SetEntityCoords(PlayerPedId(), Config.School[4].Teleport.coords)
			end
		end
	end)
	else
		pNotify(Config["NotifyError"], 'error')
	end
end)

RegisterNUICallback("close",function(data)
    SetNuiFocus(false, false)
    SendNUIMessage({
        showUI = false; 
    })
end)


function checkHasItem(item_name)
    local inventory = ESX.GetPlayerData().inventory
    for i = 1, #inventory do
        local item = inventory[i]
        if item_name == item.name and item.count > 0 then return true end
    end
    return false
end

function sc()
    local srm = {}
    local ped = PlayerPedId()
    for k, v in pairs(Config.School) do
        for i = 1, v.Percent do table.insert(srm, k) end
    end
    return srm[math.random(1, #srm)]
end

function LoadFreeze()
Citizen.CreateThread(function()
  while true do
	  notfreeze = true,
	  TextFreeze()
	  Wait(0)
	break
	end
end)
end

function TextFreeze()
	Citizen.CreateThread(function()
	  local inZone = false 
	  local enteredZone = false 
	  while true do
		Citizen.Wait(0)
		
		if notfreeze then
		  FreezeEntityPosition(PlayerPedId(), true)
		  inZone = true
		  if IsControlJustReleased(0, 32) then
			notfreeze = false
			inZone = false
			FreezeEntityPosition(PlayerPedId(), false)
		  end
		end
		
		if not enteredZone and inZone then
			--exports['L4N_Text']:Show("กด <span class = 'INPUT_CONTEXT'>W</span> เพื่อลงสู่พื้น")
			exports.cc_text_UI:ShowHelpNotification("กด <span class = 'INPUT_CONTEXT'>W</span> เพื่อลงสู่พื้น")
			enteredZone = true
		elseif enteredZone and not inZone then
			--exports['L4N_Text']:Hide()
			enteredZone = false
		end
	  end
	end)
end