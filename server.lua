RegisterNetEvent("azqb-turnlights:server:update", function(turnSignal, toggle)
  local src = source
  TriggerClientEvent('azqb-turnlights:client:update', -1, src, turnSignal, toggle)
end)
