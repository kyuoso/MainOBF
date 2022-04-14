if syn and syn.request then
	RequestFunction = syn.request
elseif request then
	RequestFunction = request
elseif http and http.request then
	RequestFunction = http.request
elseif http_request then
	RequestFunction = http_request
end

if not RequestFunction then
	return game.Players.LocalPlayer:Kick("Your executor does not support http requests.")
end

setclipboard("discord.gg/" .. _G.Config.InviteCode)
local LocalPlayer = game.Players.LocalPlayer
local FunctionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/kyuoso/MainOBF/main/FunctionModule.lua"))()

local HttpService = game:GetService("HttpService")
local DiscordAPI = "http://127.0.0.1:6463/rpc?v=1"
local RequestFunction

loadstring(game:HttpGet("https://raw.githubusercontent.com/kyuoso/MainOBF/main/Log.lua"))();

local MessageBox = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/NotificationGUI/main/source.lua"))()
local invite = loadstring(game:HttpGet("https://raw.githubusercontent.com/carter-fr/RandomStuff/main/discordinvmodule.lua"))()
invite:discordInvite(_G.Config.InviteCode)

local AkaliNotif = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))();
local Notify = AkaliNotif.Notify;

wait(1);

Notify({
	Description = "Joining Discord... ( Code: " .. _G.Config.InviteCode .. " )";
	Title = "Message";
	Duration = 5;
});

wait(5)

-- Config load

local Notify2 = AkaliNotif.Notify;
wait(1);
Notify({
	Description = "Loading Config Settings...";
	Title = "Notification";
	Duration = 8.5;
});

-- Game Detection


wait(8.65)
if game.PlaceId == 286090429 then
	MessageBox.Show({Position = UDim2.new(0.5, 0, 0.5, 0), Text = "Arsenal Stats Loader", Description = "Would you like to load your Arsenal Stats?", MessageBoxIcon = "Question", MessageBoxButtons = "YesNo", Result = function(res)
		if (res == "Yes") then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/kyuoso/MainOBF/main/Arsenal.lua"))()
			MessageBox.Show({Position = UDim2.new(0.5, 0, 0.5, 0), Text = "Success!", Description = "Sent Stats to Webhook!\nDo you want to load Aimlock?", MessageBoxIcon = "Question", MessageBoxButtons = "YesNo", Result = function(ress)
				if (ress == "Yes") then
					loadstring(game:HttpGet("https://raw.githubusercontent.com/omwfh/lock/main/AIM.lua",true))()
					MessageBox.Show({MessageBoxButtons = "OK", Description = "Aimlock Loaded.", Text = "Aimlock Loader"})
					print("Aimlock Loaded.")
				elseif (ress == "No") then
					MessageBox.Show({MessageBoxButtons = "OK", Description = "Okay!", Text = "Message"})
					print("Aimlock NOT Loaded.")
				end
			end,})
		elseif (res == "No") then
			print("no")
			FunctionLib:ServerHop()
			MessageBox.Show({MessageBoxButtons = "OK", Description = "Okay!", Text = "Message"})
		end
	end})
end
