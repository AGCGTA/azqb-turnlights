RegisterCommand('+toggle_winker_left', function(source, args)
  local localPed = PlayerPedId()
  if IsPedInAnyVehicle(localPed, true) then
    local vehicle = GetVehiclePedIsIn(localPed, false)
    local state = GetVehicleIndicatorLights(vehicle)
    local current = state == 1 or state == 3
    TriggerServerEvent('azqb-turnlights:server:update', vehicle, 'left', not current)
  end
end, false)

RegisterCommand('+toggle_winker_right', function(source, args)
  local localPed = PlayerPedId()
  if IsPedInAnyVehicle(localPed, true) then
    local vehicle = GetVehiclePedIsIn(localPed, false)
    local state = GetVehicleIndicatorLights(vehicle)
    local current = state == 2 or state == 3
    TriggerServerEvent('azqb-turnlights:server:update', vehicle, 'right', not current)
  end
end, false)

RegisterKeyMapping('+toggle_winker_left', '左ウィンカーを点灯', 'keyboard', 'RBRACKET')
RegisterKeyMapping('+toggle_winker_right', '右ウィンカーを点灯', 'keyboard', 'OEM_5')

RegisterNetEvent("azqb-turnlights:client:update", function(vehicle, turnSignal, toggle)
  print("toggling..." .. tostring(vehicle) .. " " .. tostring(turnSignal) .. tostring(toggle))
  print("state" .. tostring(GetVehicleIndicatorLights(vehicle)))
  if turnSignal == 'left' then
    SetVehicleIndicatorLights(vehicle, 1, toggle)
    print("left turning: " .. tostring(toggle))
  elseif turnSignal == 'right' then
    SetVehicleIndicatorLights(vehicle, 0, toggle)
    print("right turning: " .. tostring(toggle))
  end
  -- SetVehicleIndicatorLights(vehicle, 0, toggle)
  -- SetVehicleIndicatorLights(vehicle, 1, toggle)
  print("state" .. tostring(GetVehicleIndicatorLights(vehicle)))
end)
