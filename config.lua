Config = {}
Config.Seasons = {
    Printemps = {
        name = "Printemps",
        weather = "CLEAR", -- Météo
        animals = {"a_c_deer", "a_c_boar", "a_c_rabbit_01", "a_c_cow", "a_c_pig"},
        numAnimals = 100, -- Nombre d'animaux
        duration = 1440 -- Durée en minutes
    },
    Ete = {
        name = "Été",
        weather = "EXTRASUNNY", -- Météo
        animals = {"a_c_coyote", "a_c_rabbit_01", "a_c_chickenhawk", "a_c_seagull", "a_c_hen"},
        numAnimals = 70, -- Nombre d'animaux
        duration = 1440 -- Durée en minutes
    },
    Automne = {
        name = "Automne",
        weather = "OVERCAST", -- Météo
        animals = {"a_c_crow", "a_c_mtlion", "a_c_boar", "a_c_deer", "a_c_coyote"},
        numAnimals = 40, -- Nombre d'animaux
        duration = 1440 -- Durée en minutes
    },
    Hiver = {
        name = "Hiver",
        weather = "SNOW", -- Météo
        animals = {"a_c_wolf", "a_c_boar", "a_c_deer", "a_c_crow", "a_c_mtlion"},
        numAnimals = 50, -- Nombre d'animaux
        duration = 1440 -- Durée en minutes
    }
}

--Tous les jours la saison changera !

-- Option pour afficher ou non les messages dans la console (utile pour le debug)
Config.DisplayConsoleMessages = true
