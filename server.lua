RegisterNetEvent("azqb-turnlights:server:update", function(vehicle, turnSignal, toggle)
  TriggerClientEvent('azqb-turnlights:client:update', -1, vehicle, turnSignal, toggle)
end)
