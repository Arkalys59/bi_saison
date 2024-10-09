local currentSeasonIndex = 1
local lastSeasonChangeTime = GetGameTimer()

local seasons = {
    Config.Seasons.Printemps,
    Config.Seasons.Ete,
    Config.Seasons.Automne,
    Config.Seasons.Hiver
}


function ChangeSeason()
    currentSeasonIndex = currentSeasonIndex + 1
    if currentSeasonIndex > #seasons then
        currentSeasonIndex = 1
    end

    local season = seasons[currentSeasonIndex]
    TriggerClientEvent('season:changeSeason', -1, season)
end

Citizen.CreateThread(function()
    while true do
        local currentTime = GetGameTimer()

        if currentTime - lastSeasonChangeTime > seasons[currentSeasonIndex].duration * 60000 then
            ChangeSeason()
            lastSeasonChangeTime = currentTime
        end

        Wait(1000)
    end
end)
AddEventHandler('playerConnecting', function()
    local season = seasons[currentSeasonIndex]
    TriggerClientEvent('season:syncSeason', source, season)
end)
