if not game:IsLoaded() then game.Loaded:Wait() end

setclipboard("discord.gg/" .. _G.Config.InviteCode)

local AkaliNotif = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))();
local Notify = AkaliNotif.Notify;
local HttpService = game:GetService("HttpService")
local RequestFunction
local BETA = false
local Loaded = false

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

if game:GetService("Players").LocalPlayer.UserId ~= 1755046711 and BETA == true then
	wait(1);
	Notify({
		Description = "Kyuso isn't ready to be executed.";
		Title = "IMPORTANT";
		Duration = 6.5;
	});
	return nil
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/kyuoso/MainOBF/main/Log.lua"))();

local games = loadstring(game:HttpGet("https://raw.githubusercontent.com/kyuoso/MainOBF/main/SupportedGames.lua"))()
local invite = loadstring(game:HttpGet("https://raw.githubusercontent.com/carter-fr/RandomStuff/main/discordinvmodule.lua"))()
invite:discordInvite(_G.Config.InviteCode)

-- Config Load

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

-- Game Load

wait(8.65)
for _, v in pairs(games.games) do
	if v == game.PlaceId then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/kyuoso/MainOBF/main/" .. tostring(game.PlaceId) .. ".lua"))()
		warn()
		Loaded = true
		break
	end
end

if Loaded == false then
	Notify({
		Description = "This game is not supported.";
		Title = "Message";
		Duration = 6.5;
	});
end
