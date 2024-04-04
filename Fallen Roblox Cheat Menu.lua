-- Cheat Menu for FALLEN game in Roblox
-- Created by: [Your Name]

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Assets
local CheatMenu = script.Parent.CheatMenu
local CheatMenuOpen = CheatMenu.CheatMenuOpen
local CheatMenuClose = CheatMenu.CheatMenuClose

-- Variables
local LocalPlayer = Players.LocalPlayer
local CheatMenuIsOpen = false

-- Functions
local function OpenCheatMenu()
    CheatMenuIsOpen = true
    CheatMenuOpen:Play()
    CheatMenu.Visible = true
end

local function CloseCheatMenu()
    CheatMenuIsOpen = false
    CheatMenuClose:Play()
    CheatMenu.Visible = false
end

local function OnCheatMenuOpened()
    if CheatMenuIsOpen then
        CloseCheatMenu()
    else
        OpenCheatMenu()
    end
end

-- Main
CheatMenuOpen.Sound:Play()
CheatMenuClose.Sound:Play()

CheatMenuOpen.MouseButton1Click:Connect(OpenCheatMenu)
CheatMenuClose.MouseButton1Click:Connect(CloseCheatMenu)
LocalPlayer:WaitForChild("PlayerGui")
LocalPlayer.PlayerGui.CheatMenuFrame.MouseEnter:Connect(OnCheatMenuOpened)

print("Cheat Menu loaded successfully!")