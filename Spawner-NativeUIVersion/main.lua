_menupool = NativeUI:CreatePool()

mainMenu = NativeUI:CreateMenu(config.menuname, config.menusubtitle)

_menupool:Add(mainMenu)
_menupool:MouseControlsEnabled (false)
_menupool:MouseEdgeEnabled (false)
_menupool:ControlDisablingEnabled(false)

local submenuone = _menupool:AddSubMenu(mainMenu, "Dodge", "~b~Vehicles Produced by Dodge")

for i, vehicle in ipairs(Vehicles) do
    local vehicleItem = NativeUI:CreateItem(vehicle.name, "")
    submenuone:AddItem(vehicleItem)
    submenuone.OnItemSelect = function(sender, item, index)
        if item == vehicleItem then
            local model = GetHashKey(vehicle.modelCode)
            RequestModel(model)
            while not HasModelLoaded(model) do
                Wait(1)
            end
            local veh = CreateVehicle(model, GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), true, false)
            SetVehicleOnGroundProperly(veh)
            SetEntityAsMissionEntity(veh, true, true)
            TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        end
    end
end