-- Mod Menu for FALLEN game in Roblox
-- Created by: [Your Name]

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Assets
local MOD_MENU = script.Parent.ModMenu
local MOD_MENU_OPEN = MOD_MENU.ModMenuOpen
local MOD_MENU_CLOSE = MOD_MENU.ModMenuClose

-- Variables
local LocalPlayer = Players.LocalPlayer
local ModMenuOpen = false

-- Functions
local function openModMenu()
    if ModMenuOpen then
        return
    end

    ModMenuOpen = true
    MOD_MENU_OPEN:Play()
    MOD_MENU.Visible = true
end

local function closeModMenu()
    if not ModMenuOpen then
        return
    end

    ModMenuOpen = false
    MOD_MENU_CLOSE:Play()
    MOD_MENU.Visible = false
end

-- Events
LocalPlayer.PlayerGui.ChildAdded:Connect(function(child)
    if child == MOD_MENU then
        closeModMenu()
    end
end)

-- Bind functions to inputs
local ToggleModMenu = game.ReplicatedFirst:WaitForChild("ToggleModMenu")
ToggleModMenu.MouseButton1Click:Connect(openModMenu)

MOD_MENU.ModMenuClose.AnimationCompleted:Connect(function()
    if not ModMenuOpen then
        MOD_MENU.Visible = false
    end
end)