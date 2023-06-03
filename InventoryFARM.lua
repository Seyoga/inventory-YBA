local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = Player.PlayerGui
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 250, 0, 150)
Frame.BackgroundColor3 = Color3.new(0, 0, 0)
Frame.BackgroundTransparency = 0.5
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

local RokakakaLabel = Instance.new("TextLabel")
RokakakaLabel.Size = UDim2.new(1, 0, 0.25, 0)
RokakakaLabel.Position = UDim2.new(0, 0, 0, 0)
RokakakaLabel.Text = "Количество Rokakaka: "
RokakakaLabel.TextColor3 = Color3.new(1, 1, 1)
RokakakaLabel.BackgroundTransparency = 1
RokakakaLabel.Parent = Frame

local MysteriousArrowLabel = Instance.new("TextLabel")
MysteriousArrowLabel.Size = UDim2.new(1, 0, 0.25, 0)
MysteriousArrowLabel.Position = UDim2.new(0, 0, 0.25, 0)
MysteriousArrowLabel.Text = "Количество Mysterious Arrow: "
MysteriousArrowLabel.TextColor3 = Color3.new(1, 1, 1)
MysteriousArrowLabel.BackgroundTransparency = 1
MysteriousArrowLabel.Parent = Frame

local RibCageLabel = Instance.new("TextLabel")
RibCageLabel.Size = UDim2.new(1, 0, 0.25, 0)
RibCageLabel.Position = UDim2.new(0, 0, 0.5, 0)
RibCageLabel.Text = "Количество Rib Cage of The Saint's Corpse: "
RibCageLabel.TextColor3 = Color3.new(1, 1, 1)
RibCageLabel.BackgroundTransparency = 1
RibCageLabel.Parent = Frame

local PureRokakakaLabel = Instance.new("TextLabel")
PureRokakakaLabel.Size = UDim2.new(1, 0, 0.25, 0)
PureRokakakaLabel.Position = UDim2.new(0, 0, 0.75, 0)
PureRokakakaLabel.Text = "Количество Pure Rokakaka: "
PureRokakakaLabel.TextColor3 = Color3.new(1, 1, 1)
PureRokakakaLabel.BackgroundTransparency = 1
PureRokakakaLabel.Parent = Frame

local backpack = Player:WaitForChild("Backpack")

local function updateInventory()
    local rokakakaCount = 0
    local mysteriousArrowCount = 0
    local ribCageCount = 0
    local pureRokakakaCount = 0

    for _, child in ipairs(backpack:GetChildren()) do
        if child.Name == "Rokakaka" then
            rokakakaCount = rokakakaCount + 1
        elseif child.Name == "Mysterious Arrow" then
            mysteriousArrowCount = mysteriousArrowCount + 1
        elseif child.Name == "Rib Cage of The Saint's Corpse" then
            ribCageCount = ribCageCount + 1
        elseif child.Name == "Pure Rokakaka" then
            pureRokakakaCount = pureRokakakaCount + 1
        end
    end

    RokakakaLabel.Text = "Количество Rokakaka: " .. rokakakaCount
    MysteriousArrowLabel.Text = "Количество Mysterious Arrow: " .. mysteriousArrowCount
    RibCageLabel.Text = "Количество Rib Cage of The Saint's Corpse: " .. ribCageCount
    PureRokakakaLabel.Text = "Количество Pure Rokakaka: " .. pureRokakakaCount

    if RibCageLabel.TextFits == false then
        RibCageLabel.Size = UDim2.new(1, 0, 0.35, 0)
    else
        RibCageLabel.Size = UDim2.new(1, 0, 0.25, 0)
    end
end

backpack.ChildAdded:Connect(updateInventory)
backpack.ChildRemoved:Connect(updateInventory)
updateInventory()

Player.CharacterAdded:Connect(function(character)
    backpack = Player:WaitForChild("Backpack")
    updateInventory()
end)

local isFrameVisible = true

local function toggleFrameVisibility()
    isFrameVisible = not isFrameVisible
    Frame.Visible = isFrameVisible
end

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.K then
        toggleFrameVisibility()
    end
end)

RunService.Heartbeat:Connect(function()
    updateInventory()
end)
