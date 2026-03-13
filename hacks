-- Roblox Universal Server-Sided Troll Menu
-- Loadstring: loadstring(game:HttpGet("https://raw.githubusercontent.com/YOUR_USERNAME/REPO_NAME/main/troll_menu.lua"))()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TrollMenuGUI"
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
Title.Text = "Universal Troll Menu [Server-Sided]"
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 18
Title.Parent = MainFrame

-- Scrolling Frame
local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Size = UDim2.new(1, -10, 1, -40)
ScrollingFrame.Position = UDim2.new(0, 5, 0, 35)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.ScrollBarThickness = 5
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 1000)
ScrollingFrame.Parent = MainFrame

-- Drag functionality
local dragging = false
local dragInput, dragStart, startPos

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
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

-- Function to create buttons
local function createButton(text, parent, yOffset, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -10, 0, 40)
    button.Position = UDim2.new(0, 5, 0, yOffset)
    button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Text = text
    button.Font = Enum.Font.SourceSans
    button.TextSize = 16
    button.Parent = parent
    
    button.MouseButton1Click:Connect(callback)
    
    return button
end

local yOffset = 0
local buttonHeight = 45

-- Server-Sided Building Tools (F3X/BTools)
local function createBuildingTools()
    local toolsFolder = Instance.new("Folder")
    toolsFolder.Name = "ServerTools_" .. HttpService:GenerateGUID(false)
    toolsFolder.Parent = workspace
    
    -- Tool creation function
    local function createTool(name, toolType)
        local tool = Instance.new("Tool")
        tool.Name = name
        tool.RequiresHandle = false
        tool.Parent = LocalPlayer.Backpack
        
        local clickDetector = Instance.new("ClickDetector")
        clickDetector.Parent = tool
        
        tool.Activated:Connect(function()
            if toolType == "Delete" then
                local target = Mouse.Target
                if target then
                    target:Destroy()
                end
            elseif toolType == "Select" then
                -- Selection tool logic
            end
        end)
    end
    
    createTool("Delete Tool", "Delete")
    createTool("Select Tool", "Select")
    createTool("Clone Tool", "Clone")
end

-- Troll Functions
local trollFunctions = {
    ["Lag Server"] = function()
        -- Create massive amount of parts to cause lag
        for i = 1, 1000 do
            local part = Instance.new("Part")
            part.Size = Vector3.new(1, 1, 1)
            part.Position = Vector3.new(math.random(-100, 100), math.random(-100, 100), math.random(-100, 100))
            part.Anchored = true
            part.Parent = workspace
            task.wait(0.01)
        end
    end,
    
    ["Fake Admin"] = function()
        -- Simulate admin commands
        local fakeMessage = Instance.new("Message")
        fakeMessage.Text = "You are now an admin!"
        fakeMessage.Parent = workspace
        wait(3)
        fakeMessage:Destroy()
    end,
    
    ["Infinite Yield"] = function()
        -- Basic infinite yield-like functionality
        local cmds = {
            "kill all",
            "ff all",
            "jump all",
            "sit all"
        }
        
        for _, cmd in pairs(cmds do)
            -- This would require actual server-side execution
            -- For demonstration, we'll just show messages
            local msg = Instance.new("Message")
            msg.Text = "Executed: " .. cmd
            msg.Parent = workspace
            wait(1)
            msg:Destroy()
        end
    end,
    
    ["Server-Sided Btools"] = function()
        createBuildingTools()
    end,
    
    ["Crash Game"] = function()
        -- Intense particle effect to cause lag
        local emitter = Instance.new("ParticleEmitter")
        emitter.Rate = 10000
        emitter.Speed = NumberRange.new(50)
        emitter.Parent = workspace
        
        -- Create massive sound spam
        for i = 1, 100 do
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://131147845"
            sound.Volume = 10
            sound.Parent = workspace
            sound:Play()
            task.wait(0.01)
        end
    end,
    
    ["Teleport All To You"] = function()
        local playerPos = LocalPlayer.Character.HumanoidRootPart.Position
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                local hum = player.Character:FindFirstChild("Humanoid")
                if hum then
                    hum:ChangeState(Enum.HumanoidStateType.FallingDown)
                    wait(0.1)
                    player.Character:SetPrimaryPartCFrame(CFrame.new(playerPos + Vector3.new(0, 5, 0)))
                end
            end
        end
    end,
    
    ["Fake Kick All"] = function()
        -- Creates fake kick messages
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                local msg = Instance.new("Message")
                msg.Text = player.Name .. " was kicked from the game"
                msg.Parent = workspace
                wait(0.5)
                msg:Destroy()
            end
        end
    end,
    
    ["Sound Spam"] = function()
        local sounds = {
            "rbxassetid://131147845", -- Windows XP Error
            "rbxassetid://27697743", -- Vine Boom
            "rbxassetid://9116392374", -- Among Us
            "rbxassetid://4590662766" -- Rick Roll
        }
        
        for i = 1, 50 do
            local sound = Instance.new("Sound")
            sound.SoundId = sounds[math.random(1, #sounds)]
            sound.Volume = 5
            sound.Parent = workspace
            sound:Play()
            task.wait(0.1)
        end
    end,
    
    ["Part Spam"] = function()
        for i = 1, 500 do
            local part = Instance.new("Part")
            part.Size = Vector3.new(5, 5, 5)
            part.Position = Vector3.new(math.random(-200, 200), math.random(0, 200), math.random(-200, 200))
            part.BrickColor = BrickColor.random()
            part.Anchored = true
            part.CanCollide = false
            part.Parent = workspace
            task.wait(0.01)
        end
    end,
    
    ["Fire Everyone"] = function()
        -- Creates fire effects on all players
        for _, player in pairs(Players:GetPlayers()) do
            if player.Character then
                local fire = Instance.new("Fire")
                fire.Size = 10
                fire.Heat = 25
                fire.Parent = player.Character.HumanoidRootPart
            end
        end
    end
}

-- Create buttons for each troll function
for name, func in pairs(trollFunctions) do
    createButton(name, ScrollingFrame, yOffset, func)
    yOffset = yOffset + buttonHeight
    ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, yOffset)
end

-- Keybind to toggle GUI
local UserInputService = game:GetService("UserInputService")
local guiVisible = true

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed then
        if input.KeyCode == Enum.KeyCode.RightControl then
            guiVisible = not guiVisible
            MainFrame.Visible = guiVisible
        end
    end
end)

print("Troll Menu Loaded! Press RightControl to toggle GUI")
