-- Universal Troll Menu Script
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TrollMenu"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 400, 0, 500)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Text = "Universal Troll Menu"
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 18
Title.Parent = MainFrame

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Size = UDim2.new(1, -10, 1, -40)
ScrollingFrame.Position = UDim2.new(0, 5, 0, 35)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.ScrollBarThickness = 5
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 800)
ScrollingFrame.Parent = MainFrame

local function createButton(text, yOffset, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -10, 0, 40)
    button.Position = UDim2.new(0, 5, 0, yOffset)
    button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Text = text
    button.Font = Enum.Font.SourceSans
    button.TextSize = 16
    button.Parent = ScrollingFrame
    
    button.MouseButton1Click:Connect(callback)
end

-- Troll Functions
local yOffset = 0
local buttonHeight = 45

createButton("Lag Server", yOffset, function()
    for i = 1, 500 do
        local part = Instance.new("Part")
        part.Size = Vector3.new(1, 1, 1)
        part.Position = Vector3.new(math.random(-100, 100), math.random(0, 100), math.random(-100, 100))
        part.Anchored = true
        part.Parent = workspace
        task.wait(0.01)
    end
end)
yOffset = yOffset + buttonHeight

createButton("Teleport All To You", yOffset, function()
    local pos = LocalPlayer.Character.HumanoidRootPart.Position
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            player.Character:SetPrimaryPartCFrame(CFrame.new(pos + Vector3.new(math.random(-5, 5), 0, math.random(-5, 5))))
        end
    end
end)
yOffset = yOffset + buttonHeight

createButton("Fake Kick All", yOffset, function()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local msg = Instance.new("Message")
            msg.Text = player.Name .. " was kicked by admin"
            msg.Parent = workspace
            wait(1)
            msg:Destroy()
        end
    end
end)
yOffset = yOffset + buttonHeight

createButton("Sound Spam", yOffset, function()
    for i = 1, 20 do
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://131147845"
        sound.Volume = 5
        sound.Parent = workspace
        sound:Play()
        task.wait(0.1)
    end
end)
yOffset = yOffset + buttonHeight

createButton("Part Spam", yOffset, function()
    for i = 1, 200 do
        local part = Instance.new("Part")
        part.Size = Vector3.new(3, 3, 3)
        part.Position = Vector3.new(math.random(-100, 100), math.random(0, 50), math.random(-100, 100))
        part.BrickColor = BrickColor.random()
        part.Anchored = true
        part.Parent = workspace
        task.wait(0.02)
    end
end)
yOffset = yOffset + buttonHeight

createButton("Fire Everyone", yOffset, function()
    for _, player in pairs(Players:GetPlayers()) do
        if player.Character then
            local fire = Instance.new("Fire")
            fire.Size = 5
            fire.Heat = 10
            fire.Parent = player.Character.HumanoidRootPart
        end
    end
end)
yOffset = yOffset + buttonHeight

createButton("Fake Admin", yOffset, function()
    local msg = Instance.new("Message")
    msg.Text = "Admin privileges granted!"
    msg.Parent = workspace
    wait(3)
    msg:Destroy()
end)
yOffset = yOffset + buttonHeight

createButton("Crash Game", yOffset, function()
    while true do
        for i = 1, 10 do
            Instance.new("Part", workspace)
        end
        task.wait()
    end
end)
yOffset = yOffset + buttonHeight

ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, yOffset)

-- Drag functionality
local dragging = false
local dragInput, dragStart, startPos

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Close button
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0, 5)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Text = "X"
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.TextSize = 18
CloseButton.Parent = MainFrame

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Toggle with RightControl
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.RightControl then
        MainFrame.Visible = not MainFrame.Visible
    end
end)

print("Troll Menu Loaded! Press RightControl to toggle")
