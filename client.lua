
local currentSeason = nil


local function GetRandomPosition()
    local x = math.random(-3000, 3000)
    local y = math.random(-3000, 3000)
    local z = math.random(50, 200)
    return x, y, z
end

local function applyWeatherAndSeasonEffects(season)
    SetWeatherTypeOverTime(season.weather, 10.0)
    Wait(10000)  
    SetWeatherTypeNowPersist(season.weather)

    if season.name == "Hiver" then
        SetForceVehicleTrails(true)
        SetForcePedFootstepsTracks(true) 
    else
        
        SetForceVehicleTrails(false)
        SetForcePedFootstepsTracks(false)
    end

    if Config.DisplayConsoleMessages then
        print("Météo appliquée: " .. season.weather .. " pour la saison " .. season.name)
    end
end

local function spawnSeasonalAnimals(animalList, numAnimals)
    for i = 1, numAnimals do
        local randomAnimal = animalList[math.random(#animalList)]
        local x, y, z = GetRandomPosition()

        RequestModel(randomAnimal)
        while not HasModelLoaded(randomAnimal) do
            Wait(100)
        end

        local ped = CreatePed(28, GetHashKey(randomAnimal), x, y, z, 0.0, true, false)
        TaskWanderStandard(ped, 10.0, 10)

        if Config.DisplayConsoleMessages then
            print("Animal spawn: " .. randomAnimal .. " à la position (" .. x .. ", " .. y .. ", " .. z .. ")")
        end
    end
end


RegisterNetEvent('season:changeSeason')
AddEventHandler('season:changeSeason', function(season)
    currentSeason = season


    TriggerEvent('chat:addMessage', {
        args = { '[Serveur]', 'La nouvelle saison est ' .. season.name .. ' !' }
    })


    applyWeatherAndSeasonEffects(season)
    spawnSeasonalAnimals(season.animals, season.numAnimals)
end)

RegisterNetEvent('season:syncSeason')
AddEventHandler('season:syncSeason', function(season)
    currentSeason = season
    applyWeatherAndSeasonEffects(season)
end)
