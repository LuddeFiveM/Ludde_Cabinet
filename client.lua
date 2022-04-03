ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(object) ESX = object end)
        Citizen.Wait(0)
    end
end)

function DrawSpecialText(m_text, showtime)
	SetTextEntry_2("STRING")
	AddTextComponentString(m_text)
	DrawSubtitleTimed(showtime, 1)
end






Citizen.CreateThread(function()
while true do
    Citizen.Wait(0)
    for i = 1, #Config.locations do
        Coords = Config.locations[i]
        DrawMarker(27, Coords[2], Coords[3], Coords[4], 0, 0, 0, 0, 0, 0, 2.0, 2.0, 2.0, 0, 157, 0, 155, 0, 0, 2, 0, 0, 0, 0)
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), Coords[2], Coords[3], Coords[4], true ) < Config.Distance then
            DrawSpecialText("Press [~g~E~s~] to open Storage!")
            if(IsControlJustPressed(0, 38)) then
                exports[Config.StorageFileName]:OpenStorageUnit(Coords[1], Config.MaxWeight, Config.MaxItems)
            end
        end
    end
    end
end)