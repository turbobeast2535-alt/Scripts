-- Made by Snowyy Scripts
-- Huss Valley ULTIMATE Script (Rainbow Menu + Speed + Click Teleport)

-- Create ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SnowyyUltimateGUI"
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Variables
local player = game.Players.LocalPlayer
local speedEnabled = false
local speedValue = 30
local clickTeleportEnabled = false
local menuOpen = true

-- Create Circle Button (appears when menu is closed)
local CircleButton = Instance.new("TextButton")
CircleButton.Size = UDim2.new(0, 50, 0, 50)
CircleButton.Position = UDim2.new(0.5, -25, 0, 10)
CircleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CircleButton.Text = "⚡"
CircleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CircleButton.TextSize = 24
CircleButton.Font = Enum.Font.GothamBold
CircleButton.Visible = false
CircleButton.Parent = ScreenGui

local CircleCorner = Instance.new("UICorner")
CircleCorner.CornerRadius = UDim.new(1, 0)
CircleCorner.Parent = CircleButton

local CircleStroke = Instance.new("UIStroke")
CircleStroke.Thickness = 2
CircleStroke.Color = Color3.fromRGB(255, 255, 255)
CircleStroke.Parent = CircleButton

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 300)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
MainFrame.BackgroundTransparency = 0.1
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 15)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Thickness = 3
MainStroke.Color = Color3.fromRGB(255, 0, 0)
MainStroke.Parent = MainFrame

-- Rainbow Animation for MainStroke
task.spawn(function()
    local hue = 0
    while true do
        hue = (hue + 0.01) % 1
        local color = Color3.fromHSV(hue, 1, 1)
        MainStroke.Color = color
        CircleStroke.Color = color
        task.wait(0.05)
    end
end)

-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 50)
TitleBar.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
TitleBar.BackgroundTransparency = 0.2
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 15)
TitleCorner.Parent = TitleBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -40, 1, 0)
TitleLabel.Position = UDim2.new(0, 10, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "⚡ Snowyy Scripts ⚡"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 20
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Parent = TitleBar

-- Minimize Button
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(1, -35, 0, 10)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
MinimizeButton.Text = "—"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 16
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.Parent = TitleBar

local MinimizeCorner = Instance.new("UICorner")
MinimizeCorner.CornerRadius = UDim.new(0, 5)
MinimizeCorner.Parent = MinimizeButton

-- Close Button
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -70, 0, 10)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseButton.Text = "✕"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 16
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Parent = TitleBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 5)
CloseCorner.Parent = CloseButton

-- Speed Toggle Button
local SpeedButton = Instance.new("TextButton")
SpeedButton.Size = UDim2.new(1, -20, 0, 40)
SpeedButton.Position = UDim2.new(0, 10, 0, 60)
SpeedButton.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
SpeedButton.Text = "❌ Ultra Speed: OFF"
SpeedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedButton.TextSize = 16
SpeedButton.Font = Enum.Font.GothamBold
SpeedButton.Parent = MainFrame

local SpeedCorner = Instance.new("UICorner")
SpeedCorner.CornerRadius = UDim.new(0, 8)
SpeedCorner.Parent = SpeedButton

-- Speed Slider Frame
local SliderFrame = Instance.new("Frame")
SliderFrame.Size = UDim2.new(1, -20, 0, 50)
SliderFrame.Position = UDim2.new(0, 10, 0, 110)
SliderFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
SliderFrame.Parent = MainFrame

local SliderCorner = Instance.new("UICorner")
SliderCorner.CornerRadius = UDim.new(0, 8)
SliderCorner.Parent = SliderFrame

local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Size = UDim2.new(1, 0, 0, 20)
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Text = "Speed: 30"
SpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedLabel.TextSize = 14
SpeedLabel.Font = Enum.Font.Gotham
SpeedLabel.Parent = SliderFrame

local Slider = Instance.new("TextButton")
Slider.Size = UDim2.new(1, -20, 0, 15)
Slider.Position = UDim2.new(0, 10, 0, 25)
Slider.BackgroundColor3 = Color3.fromRGB(100, 100, 120)
Slider.Text = ""
Slider.Parent = SliderFrame

local SliderFill = Instance.new("Frame")
SliderFill.Size = UDim2.new(0.15, 0, 1, 0)
SliderFill.BackgroundColor3 = Color3.fromRGB(80, 200, 120)
SliderFill.Parent = Slider

-- Click Teleport Toggle Button
local TeleportModeButton = Instance.new("TextButton")
TeleportModeButton.Size = UDim2.new(1, -20, 0, 40)
TeleportModeButton.Position = UDim2.new(0, 10, 0, 170)
TeleportModeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
TeleportModeButton.Text = "❌ Fart Teleport: OFF"
TeleportModeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportModeButton.TextSize = 16
TeleportModeButton.Font = Enum.Font.GothamBold
TeleportModeButton.Parent = MainFrame

local TeleportCorner = Instance.new("UICorner")
TeleportCorner.CornerRadius = UDim.new(0, 8)
TeleportCorner.Parent = TeleportModeButton

-- Status Label
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, -20, 0, 30)
StatusLabel.Position = UDim2.new(0, 10, 0, 220)
StatusLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
StatusLabel.BackgroundTransparency = 0.5
StatusLabel.Text = "Status: Ready"
StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusLabel.TextSize = 14
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.Parent = MainFrame

local StatusCorner = Instance.new("UICorner")
StatusCorner.CornerRadius = UDim.new(0, 8)
StatusCorner.Parent = StatusLabel

-- Rainbow Animation for all buttons
task.spawn(function()
    local hue = 0
    while true do
        hue = (hue + 0.02) % 1
        local color = Color3.fromHSV(hue, 0.7, 0.3)
        SpeedButton.BackgroundColor3 = color
        SliderFrame.BackgroundColor3 = color
        TeleportModeButton.BackgroundColor3 = color
        StatusLabel.BackgroundColor3 = color
        CircleButton.BackgroundColor3 = Color3.fromHSV(hue, 1, 0.5)
        task.wait(0.1)
    end
end)

-- Anti-detection system
local antiDetection = {
    lastPosition = Vector3.new(0, 0, 0),
    lastTime = tick(),
    teleportCount = 0,
    maxTeleportsPerSecond = 5,
    isMoving = false
}

-- Method 1: Use BodyVelocity (most stealthy)
local function createBodyVelocity()
    local character = player.Character
    if not character then return nil end
    
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return nil end
    
    -- Remove existing BodyVelocity
    for _, child in ipairs(rootPart:GetChildren()) do
        if child:IsA("BodyVelocity") then
            child:Destroy()
        end
    end
    
    -- Create new BodyVelocity
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(400000, 400000, 400000)
    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
    bodyVelocity.Parent = rootPart
    
    return bodyVelocity
end

-- Method 2: Use BodyGyro for direction control
local function createBodyGyro()
    local character = player.Character
    if not character then return nil end
    
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return nil end
    
    -- Remove existing BodyGyro
    for _, child in ipairs(rootPart:GetChildren()) do
        if child:IsA("BodyGyro") then
            child:Destroy()
        end
    end
    
    -- Create new BodyGyro
    local bodyGyro = Instance.new("BodyGyro")
    bodyGyro.MaxTorque = Vector3.new(400000, 400000, 400000)
    bodyGyro.P = 10000
    bodyGyro.D = 1000
    bodyGyro.Parent = rootPart
    
    return bodyGyro
end

-- Method 3: Use LinearVelocity (newer method)
local function createLinearVelocity()
    local character = player.Character
    if not character then return nil end
    
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return nil end
    
    -- Remove existing LinearVelocity
    for _, child in ipairs(rootPart:GetChildren()) do
        if child:IsA("LinearVelocity") then
            child:Destroy()
        end
    end
    
    -- Create new LinearVelocity
    local linearVelocity = Instance.new("LinearVelocity")
    linearVelocity.MaxForce = 400000
    linearVelocity.Velocity = Vector3.new(0, 0, 0)
    linearVelocity.Parent = rootPart
    
    return linearVelocity
end

-- Method 4: Use CFrame with timing (hardest to detect)
local function stealthCFrameMove()
    local character = player.Character
    if not character then return end
    
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    
    if rootPart and humanoid then
        local moveDirection = humanoid.MoveDirection
        if moveDirection.Magnitude > 0 then
            local currentTime = tick()
            local timeDiff = currentTime - antiDetection.lastTime
            
            -- Only teleport at a rate that won't trigger detection
            if timeDiff >= (1 / antiDetection.maxTeleportsPerSecond) then
                antiDetection.teleportCount = antiDetection.teleportCount + 1
                
                -- Move in small increments
                local moveAmount = speedValue * 0.05 -- Small increments
                local newPos = rootPart.Position + (moveDirection * moveAmount)
                rootPart.CFrame = CFrame.new(newPos)
                
                antiDetection.lastTime = currentTime
                
                -- Reset teleport count every second
                if antiDetection.teleportCount >= antiDetection.maxTeleportsPerSecond then
                    antiDetection.teleportCount = 0
                    antiDetection.lastTime = tick() + 0.5 -- Pause briefly
                end
            end
        end
    end
end

-- Main speed control
local bodyVelocity = nil
local bodyGyro = nil
local linearVelocity = nil

-- Enable speed
local function enableSpeed()
    -- Keep WalkSpeed normal to avoid detection
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = 16 -- Normal speed
        end
    end
    
    -- Create the physics objects
    bodyVelocity = createBodyVelocity()
    bodyGyro = createBodyGyro()
    linearVelocity = createLinearVelocity()
    
    StatusLabel.Text = "Status: Speed ON"
end

-- Disable speed
local function disableSpeed()
    local character = player.Character
    if character then
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        if rootPart then
            -- Remove all velocity objects
            for _, child in ipairs(rootPart:GetChildren()) do
                if child:IsA("BodyVelocity") or child:IsA("BodyGyro") or child:IsA("LinearVelocity") then
                    child:Destroy()
                end
            end
        end
        
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = 16
        end
    end
    
    StatusLabel.Text = "Status: Speed OFF"
end

-- Main loop
game:GetService("RunService").Heartbeat:Connect(function()
    if speedEnabled and player.Character then
        local character = player.Character
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        
        if rootPart and humanoid then
            local moveDirection = humanoid.MoveDirection
            
            -- Only apply speed when actually moving
            if moveDirection.Magnitude > 0 then
                -- Apply velocity through physics objects
                if bodyVelocity then
                    bodyVelocity.Velocity = moveDirection * speedValue
                end
                
                if linearVelocity then
                    linearVelocity.Velocity = moveDirection * speedValue
                end
                
                if bodyGyro then
                    bodyGyro.CFrame = CFrame.lookAt(rootPart.Position, rootPart.Position + moveDirection)
                end
                
                -- Use stealth CFrame as backup
                stealthCFrameMove()
            else
                -- Stop when not moving
                if bodyVelocity then
                    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
                end
                
                if linearVelocity then
                    linearVelocity.Velocity = Vector3.new(0, 0, 0)
                end
            end
        end
    end
end)

-- Teleport to Win Function
local function teleportToWin()
    local character = player.Character
    if not character then return end
    
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end
    
    -- Search for the end zone or finish line
    local workspace = game:GetService("Workspace")
    
    -- Method 1: Look for common end zone names
    local endZones = {}
    for _, child in ipairs(workspace:GetChildren()) do
        local name = string.lower(child.Name)
        if string.find(name, "finish") or string.find(name, "end") or string.find(name, "goal") or 
           string.find(name, "win") or string.find(name, "complete") or string.find(name, "zone") or
           string.find(name, "checkpoint") then
            table.insert(endZones, child)
        end
    end
    
    -- Method 2: Look for parts with specific properties
    if #endZones == 0 then
        for _, child in ipairs(workspace:GetDescendants()) do
            if child:IsA("BasePart") and child.Name then
                local name = string.lower(child.Name)
                if string.find(name, "finish") or string.find(name, "end") or string.find(name, "goal") or 
                   string.find(name, "win") or string.find(name, "complete") or string.find(name, "zone") then
                    table.insert(endZones, child)
                end
            end
        end
    end
    
    -- Method 3: Look for the farthest point in the map
    if #endZones == 0 then
        local farthestPart = nil
        local farthestDistance = 0
        
        for _, child in ipairs(workspace:GetDescendants()) do
            if child:IsA("BasePart") and child.Parent ~= character then
                local distance = (child.Position - Vector3.new(0, 0, 0)).Magnitude
                if distance > farthestDistance then
                    farthestDistance = distance
                    farthestPart = child
                end
            end
        end
        
        if farthestPart then
            table.insert(endZones, farthestPart)
        end
    end
    
    -- Teleport to the end zone
    if #endZones > 0 then
        local target = endZones[1]
        local targetPosition = target.Position
        
        -- Teleport above the end zone to avoid falling through
        targetPosition = targetPosition + Vector3.new(0, 5, 0)
        
        -- Teleport the character
        rootPart.CFrame = CFrame.new(targetPosition)
        
        -- Show notification
        local Notification = Instance.new("TextLabel")
        Notification.Size = UDim2.new(0, 200, 0, 50)
        Notification.Position = UDim2.new(0.5, -100, 0, 70)
        Notification.BackgroundColor3 = Color3.fromRGB(80, 200, 80)
        Notification.BackgroundTransparency = 0.2
        Notification.Text = "🏁 Teleported to Win!"
        Notification.TextColor3 = Color3.fromRGB(255, 255, 255)
        Notification.TextSize = 16
        Notification.Font = Enum.Font.GothamBold
        Notification.Parent = ScreenGui
        
        local NotifCorner = Instance.new("UICorner")
        NotifCorner.CornerRadius = UDim.new(0, 10)
        NotifCorner.Parent = Notification
        
        task.wait(2)
        Notification:Destroy()
    else
        -- If no end zone found, try to teleport to a random far location
        local randomPos = Vector3.new(math.random(-100, 100), 50, math.random(-100, 100))
        rootPart.CFrame = CFrame.new(randomPos)
        
        local Notification = Instance.new("TextLabel")
        Notification.Size = UDim2.new(0, 200, 0, 50)
        Notification.Position = UDim2.new(0.5, -100, 0, 70)
        Notification.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
        Notification.BackgroundTransparency = 0.2
        Notification.Text = "⚠️ End Zone Not Found!"
        Notification.TextColor3 = Color3.fromRGB(255, 255, 255)
        Notification.TextSize = 16
        Notification.Font = Enum.Font.GothamBold
        Notification.Parent = ScreenGui
        
        local NotifCorner = Instance.new("UICorner")
        NotifCorner.CornerRadius = UDim.new(0, 10)
        NotifCorner.Parent = Notification
        
        task.wait(2)
        Notification:Destroy()
    end
end

-- Click to Teleport (when enabled)
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if clickTeleportEnabled and input.UserInputType == Enum.UserInputType.MouseButton1 and not gameProcessed then
        -- Check if the click was NOT on the GUI
        local guiService = game:GetService("GuiService")
        if not guiService:GetGuiObjectsAtPosition(input.Position.X, input.Position.Y)[1] then
            teleportToWin()
        end
    end
end)

-- Minimize/Expand functions
local function minimizeMenu()
    menuOpen = false
    MainFrame.Visible = false
    CircleButton.Visible = true
    
    -- Animate circle button in
    CircleButton.Size = UDim2.new(0, 0, 0, 0)
    CircleButton.BackgroundTransparency = 1
    task.spawn(function()
        for i = 1, 10 do
            CircleButton.Size = UDim2.new(0, i * 5, 0, i * 5)
            CircleButton.BackgroundTransparency = 1 - (i * 0.1)
            task.wait(0.02)
        end
    end)
end

local function expandMenu()
    menuOpen = true
    CircleButton.Visible = false
    MainFrame.Visible = true
    
    -- Animate main frame in
    MainFrame.BackgroundTransparency = 1
    MainFrame.Size = UDim2.new(0, 0, 0, 0)
    task.spawn(function()
        for i = 1, 10 do
            MainFrame.Size = UDim2.new(0, i * 30, 0, i * 30)
            MainFrame.BackgroundTransparency = 1 - (i * 0.1)
            task.wait(0.02)
        end
        MainFrame.Size = UDim2.new(0, 300, 0, 300)
        MainFrame.BackgroundTransparency = 0.1
    end)
end

-- Minimize Button Click
MinimizeButton.MouseButton1Click:Connect(function()
    minimizeMenu()
end)

-- Close Button Click
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Circle Button Click (to expand)
CircleButton.MouseButton1Click:Connect(function()
    expandMenu()
end)

-- Click outside to minimize (when menu is open)
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if menuOpen and input.UserInputType == Enum.UserInputType.MouseButton1 and not gameProcessed then
        local guiService = game:GetService("GuiService")
        local guiObjects = guiService:GetGuiObjectsAtPosition(input.Position.X, input.Position.Y)
        
        -- Check if click is outside the main frame
        local clickedOnGUI = false
        for _, obj in ipairs(guiObjects) do
            if obj:IsDescendantOf(MainFrame) then
                clickedOnGUI = true
                break
            end
        end
        
        if not clickedOnGUI then
            minimizeMenu()
        end
    end
end)

-- Teleport Mode Toggle
TeleportModeButton.MouseButton1Click:Connect(function()
    clickTeleportEnabled = not clickTeleportEnabled
    if clickTeleportEnabled then
        TeleportModeButton.Text = "✅ Click Teleport: ON"
        TeleportModeButton.BackgroundColor3 = Color3.fromRGB(80, 150, 80)
        StatusLabel.Text = "Status: Teleport ON"
    else
        TeleportModeButton.Text = "❌ Click Teleport: OFF"
        TeleportModeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
        StatusLabel.Text = "Status: Teleport OFF"
    end
end)

-- Handle respawn
player.CharacterAdded:Connect(function(char)
    task.wait(0.5)
    if speedEnabled then
        enableSpeed()
    end
end)

-- Toggle speed
SpeedButton.MouseButton1Click:Connect(function()
    speedEnabled = not speedEnabled
    if speedEnabled then
        SpeedButton.Text = "✅ Ultra Speed: ON"
        SpeedButton.BackgroundColor3 = Color3.fromRGB(80, 150, 80)
        enableSpeed()
    else
        SpeedButton.Text = "❌ Ultra Speed: OFF"
        SpeedButton.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
        disableSpeed()
    end
end)

-- Slider functionality
Slider.MouseButton1Down:Connect(function()
    local connection
    connection = game:GetService("RunService").RenderStepped:Connect(function()
        local mousePos = game:GetService("UserInputService"):GetMouseLocation()
        local relativeX = mousePos.X - Slider.AbsolutePosition.X
        local percent = math.clamp(relativeX / Slider.AbsoluteSize.X, 0, 1)
        SliderFill.Size = UDim2.new(percent, 0, 1, 0)
        speedValue = math.floor(16 + (60 * percent)) -- Max 60 to avoid detection
        SpeedLabel.Text = "Speed: " .. speedValue
    end)
    
    game:GetService("UserInputService").InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            connection:Disconnect()
        end
    end)
end)

-- Initial Notification
local Notification = Instance.new("TextLabel")
Notification.Size = UDim2.new(0, 250, 0, 50)
Notification.Position = UDim2.new(0.5, -125, 0, 20)
Notification.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
Notification.BackgroundTransparency = 0.2
Notification.Text = "⚡ Snowyy Scripts Loaded! ⚡"
Notification.TextColor3 = Color3.fromRGB(255, 255, 255)
Notification.TextSize = 16
Notification.Font = Enum.Font.GothamBold
Notification.Parent = ScreenGui

local NotifCorner = Instance.new("UICorner")
NotifCorner.CornerRadius = UDim.new(0, 10)
NotifCorner.Parent = Notification

-- Rainbow animation for notification
task.spawn(function()
    local hue = 0
    while Notification.Parent do
        hue = (hue + 0.02) % 1
        Notification.BackgroundColor3 = Color3.fromHSV(hue, 0.7, 0.3)
        task.wait(0.1)
    end
end)

task.wait(3)
Notification:Destroy()
