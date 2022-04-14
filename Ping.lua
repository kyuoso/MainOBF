local Ping = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")

Ping.Name = "Ping"
Ping.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Ping.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Ping.ResetOnSpawn = false

Frame.Parent = Ping
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BackgroundTransparency = 0.800
Frame.Position = UDim2.new(0.5, -28, 1, -18)
Frame.Size = UDim2.new(0, 57, 0, 18)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.0701754391, 0, 0.111111104, 0)
TextLabel.Size = UDim2.new(0, 49, 0, 14)
TextLabel.Font = Enum.Font.Code
TextLabel.Text = "PING: 90"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextTransparency = 0.200
TextLabel.TextWrapped = true

UICorner.CornerRadius = UDim.new(0, 20)
UICorner.Parent = Frame

local function AUGGO_fake_script()
	local script = Instance.new('Script', TextLabel)

	function GetPing()
		local Ping = 300-((1/wait())*10)
		if Ping < 1 then
			Ping = 1
		end
		return math.floor(Ping)
	end
	
	while wait() do
		script.Parent.Text = GetPing().." ms"
	end
end
coroutine.wrap(AUGGO_fake_script)()
