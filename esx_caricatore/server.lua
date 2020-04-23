--server

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

RegisterServerEvent('esx_caricatore:rimuovi')
AddEventHandler('esx_caricatore:rimuovi', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('munizze', 1)
end)

ESX.RegisterUsableItem('munizze', function(source)
	TriggerClientEvent('esx_caricatore:carica', source)
end)