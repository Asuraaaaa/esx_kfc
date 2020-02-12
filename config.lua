Config                            = {}
Config.DrawDistance               = 100.0

Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.EnableVaultManagement      = true
Config.EnableHelicopters          = false
Config.EnableMoneyWash            = true
Config.MaxInService               = -1
Config.Locale                     = 'fr'

Config.MissCraft                  = 10 -- %


Config.AuthorizedVehicles = {
    { name = 'stalion2',  label = 'Stalion' },
}

Config.Blips = {
    
    Blip = {
      Pos     = { x = -137.52, y = -256.57, z = 43.59},
      Sprite  = 683,
      Display = 4,
      Scale   = 1.2,
      Colour  = 1,
    },

}

Config.Zones = {

    Cloakrooms = {
        Pos   = { x = -187.88, y = -269.32, z = 23.27},
        Size  = { x = 1.5, y = 1.5, z = 1.0 },
        Color = { r = 255, g = 187, b = 255 },
        Type  = 1,
    },

    Vaults = {
        Pos   = { x = -174.57, y = -272.76, z = 23.27 },
        Size  = { x = 1.5, y = 1.5, z = 1.0 },
        Color = { r = 248, g = 248, b = 255 },
        Type  = 1,
    },

    Fridge = {
        Pos   = { x = -182.76, y = -272.89, z = 23.28 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 248, g = 248, b = 255 },
        Type  = 1,
    },

    Vehicles = {
        Pos          = { x = -135.8, y = -250.35, z = 42.91 },
        SpawnPoint   = { x = -135.8, y = -250.35, z = 42.91 },
        Size         = { x = 1.8, y = 1.8, z = 1.0 },
        Color        = { r = 255, g = 255, b = 0 },
        Type         = 1,
        Heading      = 242.7,
    },

    VehicleDeleters = {
        Pos   = { x = -129.68, y = -246.65, z = 43.34 },
        Size  = { x = 3.0, y = 3.0, z = 0.2 },
        Color = { r = 255, g = 255, b = 0 },
        Type  = 1,
    },

--[[
    Helicopters = {
        Pos          = { x = 137.177, y = -1278.757, z = 28.371 },
        SpawnPoint   = { x = 138.436, y = -1263.095, z = 28.626 },
        Size         = { x = 1.8, y = 1.8, z = 1.0 },
        Color        = { r = 255, g = 255, b = 0 },
        Type         = 23,
        Heading      = 207.43,
    },

    HelicopterDeleters = {
        Pos   = { x = 133.203, y = -1265.573, z = 28.396 },
        Size  = { x = 3.0, y = 3.0, z = 0.2 },
        Color = { r = 255, g = 255, b = 0 },
        Type  = 1,
    },
]]--

    BossActions = {
        Pos   = { x = -176.37, y = -276.53, z = 23.27  },
        Size  = { x = 1.5, y = 1.5, z = 1.0 },
        Color = { r = 0, g = 100, b = 0 },
        Type  = 1,
    },

-----------------------
-------- SHOPS --------

    Flacons = {
        Pos   = { x = 378.65, y = 329.47, z = 102.57 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 238, g = 0, b = 0 },
        Type  = 1,
        Items = {
            { name = 'chicken',      label = _U('chicken'),   price = 4 },
            { name = 'patates',    label = 'Patates',     price = 30 },
            { name = 'salad',    label = 'Salata',     price = 50 },
            { name = 'cheese',     label = _U('cheese'),  price = 2 },
            { name = 'cocacola',     label = 'Coca Cola',  price = 50 },
            { name = 'sprite',     label = 'Sprite',  price = 50 },
            { name = 'soda',     label = 'Soda',  price = 50 },
            { name = 'lemonada',     label = 'Lemonada',  price = 50 },

        },
    },

}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
  burgershot_outfit = {
   male = {
        ['tshirt_1'] = 63,  ['tshirt_2'] = 0,
        ['torso_1'] = 23,   ['torso_2'] = 3,
        ['decals_1'] = 3,   ['decals_2'] = 0,
        ['arms'] = 12,
        ['pants_1'] = 24,   ['pants_2'] = 5,
        ['shoes_1'] = 1,    ['shoes_2'] = 1,
        ['chain_1'] = 0,    ['chain_2'] = 0
    },
    	female = {
        ['tshirt_1'] = 63,  ['tshirt_2'] = 0,
        ['torso_1'] = 23,   ['torso_2'] = 3,
        ['decals_1'] = 3,   ['decals_2'] = 0,
        ['arms'] = 12,
        ['pants_1'] = 24,   ['pants_2'] = 5,
        ['shoes_1'] = 1,   ['shoes_2'] = 1,
        ['chain_1'] = 0,  ['chain_2'] = 0
    }
  }
}
