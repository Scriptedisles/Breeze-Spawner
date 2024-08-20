local mainmenu = RageUI.CreateMenu(config.menuname, config.menusubtitle)
mainmenu.EnableMouse = true;

local subone = RageUI.CreateSubMenu(mainmenu, "Dodge", "~b~Vehicles Produced by Dodge")

local Checked = false;
local ListIndex = 1;

local GridX, GridY = 0, 0

function RageUI.PoolMenus:Example()
	MainMenu:IsVisible(function(Items)
		Items:Heritage(1, 2)
		Items:AddButton("Sub Menu", "Sub Menu", { IsDisabled = false }, function(onSelected)
	
		end, SubMenu)
		Items:AddButton("Hello world", "Hello world.", { IsDisabled = false }, function(onSelected)

		end)
		Items:AddList("List", { 1, 2, 3 }, ListIndex, nil, { IsDisabled = false }, function(Index, onSelected, onListChange)
			if (onListChange) then
				ListIndex = Index;
			end
		end)
		Items:AddSeparator("Separator")
		Items:CheckBox("Hello", "Descriptions", Checked, { Style = 1 }, function(onSelected, IsChecked)
			if (onSelected) then
				Checked = IsChecked
			end
		end)


	end, function(Panels)
		Panels:Grid(GridX, GridY, "Top", "Bottom", "Left", "Right", function(X, Y, CharacterX, CharacterY)
			GridX = X;
			GridY = Y;
		end, 1)
	end)

	SubMenu:IsVisible(function(Items)
		-- Items
		Items:AddButton("Hello world", "Hello world.", { IsDisabled = false }, function(onSelected)

		end)
	end, function()
		-- Panels
	end)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if IsControlPressed(0, cfg.control, true) then -- [What Bind Triggers the Menu to open. Deafult : 121 (Insert)] - Can be Edited in Config
            RageUI.Visible(mainmenu, not RageUI.Visible(mainMenu))
        end
    end
end)
