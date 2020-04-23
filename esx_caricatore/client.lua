--client
--############### Caricatore unico By MaXxaM ###########
--################## New York Project ##################
--############# NON DUMPARE CHE FA MALEEEE #############

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx_caricatore:carica')
AddEventHandler('esx_caricatore:carica', function()
  ped = GetPlayerPed(-1)
  if IsPedArmed(ped, 4) then -- 4 = tutte le armi tranne le esplosive/corpo a corpo
    hash=GetSelectedPedWeapon(ped)
    if hash~=nil then
      TriggerServerEvent('esx_caricatore:rimuovi')
      AddAmmoToPed(GetPlayerPed(-1), hash,30) --quantità munizioni x caricatore
      ESX.ShowNotification("Hai utilizzato un caricatore")
    else
      ESX.ShowNotification("Non hai un arma in mano")
    end
  else
    ESX.ShowNotification("Queste munizioni non sono adatte a quest\'arma")
  end
end)