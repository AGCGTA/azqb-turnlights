RegisterCommand('+toggle_winker_left', function(source, args)
  local localPed = PlayerPedId()
  if IsPedInAnyVehicle(localPed, true) then
    local vehicle = GetVehiclePedIsIn(localPed, false)
    local state = GetVehicleIndicatorLights(vehicle)
    local current = state == 1 or state == 3
    TriggerServerEvent('azqb-turnlights:server:update', 'left', not current)
  end
end, false)

RegisterCommand('+toggle_winker_right', function(source, args)
  local localPed = PlayerPedId()
  if IsPedInAnyVehicle(localPed, true) then
    local vehicle = GetVehiclePedIsIn(localPed, false)
    local state = GetVehicleIndicatorLights(vehicle)
    local current = state == 2 or state == 3
    TriggerServerEvent('azqb-turnlights:server:update', 'right', not current)
  end
end, false)

RegisterKeyMapping('+toggle_winker_left', '左ウィンカーを点灯', 'keyboard', 'RBRACKET')
RegisterKeyMapping('+toggle_winker_right', '右ウィンカーを点灯', 'keyboard', 'OEM_5')

RegisterNetEvent("azqb-turnlights:client:update", function(src, turnSignal, toggle)
  local vehicle = GetVehiclePedIsIn(GetPlayerPed(GetPlayerFromServerId(src)), false)
  if turnSignal == 'left' then
    SetVehicleIndicatorLights(vehicle, 1, toggle)
  elseif turnSignal == 'right' then
    SetVehicleIndicatorLights(vehicle, 0, toggle)
  end
end)
