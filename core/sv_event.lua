
--██╗░░░░░░█████╗░███╗░░██╗░█████╗░███████╗██╗░░░░░░█████╗░████████╗  ██████╗░███████╗██╗░░░██╗
--██║░░░░░██╔══██╗████╗░██║██╔══██╗██╔════╝██║░░░░░██╔══██╗╚══██╔══╝  ██╔══██╗██╔════╝██║░░░██║
--██║░░░░░███████║██╔██╗██║██║░░╚═╝█████╗░░██║░░░░░██║░░██║░░░██║░░░  ██║░░██║█████╗░░╚██╗░██╔╝
--██║░░░░░██╔══██║██║╚████║██║░░██╗██╔══╝░░██║░░░░░██║░░██║░░░██║░░░  ██║░░██║██╔══╝░░░╚████╔╝░
--███████╗██║░░██║██║░╚███║╚█████╔╝███████╗███████╗╚█████╔╝░░░██║░░░  ██████╔╝███████╗░░╚██╔╝░░
--╚══════╝╚═╝░░╚═╝╚═╝░░╚══╝░╚════╝░╚══════╝╚══════╝░╚════╝░░░░╚═╝░░░  ╚═════╝░╚══════╝░░░╚═╝░░░

ESX = exports['es_extended']:getSharedObject()


RegisterServerEvent('L4N:SCHOOLSERVER1')
AddEventHandler('L4N:SCHOOLSERVER1', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	local name = xPlayer.getName()
	if Config.School[1].Enabled then
		
		TriggerClientEvent('chat:addMessage', -1, {
        template = Config.School[1].ChatMain,
			args = { " คุณ " ..name.. " ได้เข้าโรงเรียน : " , Config.School[1].JobName }
		})
		
		xPlayer.addInventoryItem(Config.School[1].ItemName, Config.School[1].ItemCount)
		xPlayer.setJob(Config.School[1].Job,0)
	end
	
end)

RegisterServerEvent('L4N:SCHOOLSERVER2')
AddEventHandler('L4N:SCHOOLSERVER2', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	local name = xPlayer.getName()
	
	if Config.School[2].Enabled then
		TriggerClientEvent('chat:addMessage', -1, {
        template = Config.School[2].ChatMain,
			args = { " คุณ " ..name.. " ได้เข้าโรงเรียน : " , Config.School[2].JobName }
		})
		xPlayer.addInventoryItem(Config.School[2].ItemName, Config.School[2].ItemCount)
		xPlayer.setJob(Config.School[2].Job,0)
	end
	
end)

RegisterServerEvent('L4N:SCHOOLSERVER3')
AddEventHandler('L4N:SCHOOLSERVER3', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	local name = xPlayer.getName()
	
	if Config.School[3].Enabled then
		TriggerClientEvent('chat:addMessage', -1, {
			template = Config.School[3].ChatMain,
			args = { " คุณ " ..name.. " ได้เข้าโรงเรียน : " , Config.School[3].JobName }
		})
		xPlayer.addInventoryItem(Config.School[3].ItemName, Config.School[3].ItemCount)
		xPlayer.setJob(Config.School[3].Job,0)
	end
	
end)

RegisterServerEvent('L4N:SCHOOLSERVER4')
AddEventHandler('L4N:SCHOOLSERVER4', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	local name = xPlayer.getName()
	
	if Config.School[4].Enabled then
		TriggerClientEvent('chat:addMessage', -1, {
			template = Config.School[4].ChatMain,
			args = { " คุณ " ..name.. " ได้เข้าโรงเรียน : " , Config.School[4].JobName }
		})
		xPlayer.addInventoryItem(Config.School[4].ItemName, Config.School[4].ItemCount)
		xPlayer.setJob(Config.School[4].Job,0)
	end

end)

if Config["UseItem"] then
	ESX.RegisterUsableItem(Config["Item"], function(source)
		local _source = source

		TriggerClientEvent('L4N:STARTSCHOOL', _source)
	end)
end


RegisterNetEvent('L4N:SCHOOL:Remove')
AddEventHandler('L4N:SCHOOL:Remove', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.job.name == 'unemployed' then
		-----------
	else
		xPlayer.removeInventoryItem(Config["Item"], 1)
		
		local GetItemData = Config["RemoveItem"]
		for i = 1, #GetItemData do

			local NameItem  = GetItemData[i]
			
			xPlayer.removeInventoryItem(NameItem, 1)
		end
	end
end)

CreateThread(function() 
    if Config.DisablePrintSupportMessage == false then 
        Wait(5000)
        for i = 1, 10 do 
            print("^3--------------------------------------------------------------------------------------------------------------------^7")
            print("^1This server make by LANCELOT.")
            
            print("██╗░░░░░░█████╗░███╗░░██╗░█████╗░███████╗██╗░░░░░░█████╗░████████╗  ██████╗░███████╗██╗░░░██╗")
            print("██║░░░░░██╔══██╗████╗░██║██╔══██╗██╔════╝██║░░░░░██╔══██╗╚══██╔══╝  ██╔══██╗██╔════╝██║░░░██║")
            print("██║░░░░░███████║██╔██╗██║██║░░╚═╝█████╗░░██║░░░░░██║░░██║░░░██║░░░  ██║░░██║█████╗░░╚██╗░██╔╝")
            print("██║░░░░░██╔══██║██║╚████║██║░░██╗██╔══╝░░██║░░░░░██║░░██║░░░██║░░░  ██║░░██║██╔══╝░░░╚████╔╝░")
            print("███████╗██║░░██║██║░╚███║╚█████╔╝███████╗███████╗╚█████╔╝░░░██║░░░  ██████╔╝███████╗░░╚██╔╝░░")
            print("╚══════╝╚═╝░░╚═╝╚═╝░░╚══╝░╚════╝░╚══════╝╚══════╝░╚════╝░░░░╚═╝░░░  ╚═════╝░╚══════╝░░░╚═╝░░░")
            print("^3--------------------------------------------------------------------------------------------------------------------^7")
        end
    end 
end)

