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

local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false

local File = pcall(function()
	AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
end)

if not File then
	table.insert(AllIDs, actualHour)
	writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end

local LocalPlayer = game.Players.LocalPlayer

function TPReturner()
	local Site;
	if foundAnything == "" then
		Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
	else
		Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
	end
	local ID = ""
	if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
		foundAnything = Site.nextPageCursor
	end
	local num = 0;
	for i,v in pairs(Site.data) do
		local Possible = true
		ID = tostring(v.id)
		if tonumber(v.maxPlayers) > tonumber(v.playing) then
			for _,Existing in pairs(AllIDs) do
				if num ~= 0 then
					if ID == tostring(Existing) then
						Possible = false
					end
				else
					if tonumber(actualHour) ~= tonumber(Existing) then
						local delFile = pcall(function()
							delfile("NotSameServers.json")
							AllIDs = {}
							table.insert(AllIDs, actualHour)
						end)
					end
				end
				num = num + 1
			end
			if Possible == true then
				table.insert(AllIDs, ID)
				wait()
				pcall(function()
					writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
					wait()
					game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
				end)
				wait(4)
			end
		end
	end
end

function Teleport()
	while wait() do
		pcall(function()
			TPReturner()
			if foundAnything ~= "" then
				TPReturner()
			end
		end)
	end
end

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

if _G.Config.Webhook.ChatLog == true then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/kyuoso/MainOBF/main/Chat.lua"))()
end

-- Game Detection


wait(8.65)
if game.PlaceId == 286090429 then
	local NotifyArsenal = AkaliNotif.Notify;
	NotifyArsenal({
		Description = "Game Detected: Arsenal";
		Title = "Notification";
		Duration = 5;
	});
	wait(2.5)
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
			MessageBox.Show({Position = UDim2.new(0.5, 0, 0.5, 0), Text = "Oh!", Description = "Arsenal Stats not Loaded!\nDo you want to load Aimlock?", MessageBoxIcon = "Question", MessageBoxButtons = "YesNo", Result = function(ress)
				if (ress == "Yes") then
					loadstring(game:HttpGet("h	ttps://raw.githubusercontent.com/omwfh/lock/main/AIM.lua",true))()
					MessageBox.Show({MessageBoxButtons = "OK", Description = "Aimlock Loaded.", Text = "Aimlock Loader"})
					print("Aimlock Loaded.")
				elseif (ress == "No") then
					MessageBox.Show({MessageBoxButtons = "OK", Description = "Okay!", Text = "Message"})
					print("Aimlock NOT Loaded.")
				end
			end,})
		end
	end})
end

if game.PlaceId == 2788229376 then
	local NotifyDaHood = AkaliNotif.Notify;
	NotifyDaHood({
		Description = "Game Detected: Da Hood";
		Title = "Notification";
		Duration = 5;
	});
	wait(2.5)
	MessageBox.Show({Position = UDim2.new(0.5, 0, 0.5, 0), Text = "Notification", Description = "Loading Modules...\nDo you want to load in Silent AIM? ( Best with DB)", MessageBoxIcon = "Question", MessageBoxButtons = "YesNo", Result = function(res)
		if (res == "Yes") then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/kyuoso/MainOBF/main/SilentAim.lua"))()
			MessageBox.Show({Position = UDim2.new(0.5, 0, 0.5, 0), Text = "Notification", Description = "Loading Modules...\nLoaded Silent AIM Script!\nDo you want to see your ping?", MessageBoxIcon = "Question", MessageBoxButtons = "YesNo", Result = function(ress)
				if (ress == "Yes") then
					loadstring(game:HttpGet("https://raw.githubusercontent.com/kyuoso/MainOBF/main/Ping.lua"))()
					MessageBox.Show({MessageBoxButtons = "OK", Description = "Created PING Gui!", Text = "Message"})
				elseif (ress == "No") then
					MessageBox.Show({MessageBoxButtons = "OK", Description = "Okay!", Text = "Message"})
				end
			end,})
		elseif (res == "No") then
			MessageBox.Show({Position = UDim2.new(0.5, 0, 0.5, 0), Text = "Notification", Description = "Loading Modules...\nOkay!\nDo you want to see your ping? ( BANNABLE DO NOT USE ATM! )", MessageBoxIcon = "Question", MessageBoxButtons = "YesNo", Result = function(resss)
				if (resss == "Yes") then
					loadstring(game:HttpGet("https://raw.githubusercontent.com/kyuoso/MainOBF/main/Ping.lua"))()
					MessageBox.Show({MessageBoxButtons = "OK", Description = "Created PING Gui!", Text = "Message"})
				elseif (resss == "No") then
					MessageBox.Show({MessageBoxButtons = "OK", Description = "Okay!", Text = "Message"})
				end
			end,})
		end
	end})
end

if game.PlaceId == 1962086868 then
	local NotifyDaHood = AkaliNotif.Notify;
	NotifyDaHood({
		Description = "Game Detected: Tower Of Hell";
		Title = "Notification";
		Duration = 5;
	});
	wait(2.5)
	MessageBox.Show({Position = UDim2.new(0.5, 0, 0.5, 0), Text = "Loading Modules...", Description = "Do you want to see your ping?", MessageBoxIcon = "Question", MessageBoxButtons = "YesNo", Result = function(res)
		if (res == "Yes") then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/kyuoso/MainOBF/main/Ping.lua"))()
			MessageBox.Show({Position = UDim2.new(0.5, 0, 0.5, 0), Text = "Loading Modules...", Description = "Created PING Gui!\nDo you want godmode?", MessageBoxIcon = "Question", MessageBoxButtons = "YesNo", Result = function(cock)
				if (cock == "Yes") then
					loadstring(game:HttpGet("https://raw.githubusercontent.com/kyuoso/MainOBF/main/TOHGodmode.lua"))()
					MessageBox.Show({MessageBoxButtons = "OK", Description = "Godmode Initiated.", Text = "Modules Loaded!"})
				elseif (cock == "No") then
					MessageBox.Show({MessageBoxButtons = "OK", Description = "Okay!", Text = "Message"})
				end
			end,})
		elseif (res == "No") then
			MessageBox.Show({Position = UDim2.new(0.5, 0, 0.5, 0), Text = "Modules Loaded!", Description = "PING Disabled.\nDo you want godmode?", MessageBoxIcon = "Question", MessageBoxButtons = "YesNo", Result = function(resss)
				if (resss == "Yes") then
					loadstring(game:HttpGet("https://raw.githubusercontent.com/kyuoso/MainOBF/main/TOHGodmode.lua"))()
					MessageBox.Show({MessageBoxButtons = "OK", Description = "Godmode Initiated.", Text = "Modules Loaded!"})
				elseif (resss == "No") then
					MessageBox.Show({MessageBoxButtons = "OK", Description = "Okay!", Text = "Message"})
				end
			end,})
		end
	end,})
end
