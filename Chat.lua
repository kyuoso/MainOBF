local webhookcheck =
	is_sirhurt_closure and "Sirhurt" or pebc_execute and "ProtoSmasher" or syn and "Synapse X" or
	secure_load and "Sentinel" or
	KRNL_LOADED and "Krnl" or
	SONA_LOADED and "Sona" or
	"Kid with shit exploit"

local url = _G.Config.Webhook.ChatUrl

local OtherPlayers = game:GetService("Players"):GetPlayers()

for i, Player in pairs(OtherPlayers) do
	Player.Chatted:Connect(function(msg)
		local data = {
			["username"] = Player.DisplayName .. " (@" .. Player.Name .. ")",
			["avatar_url"] = "https://www.roblox.com/headshot-thumbnail/image?userId=".. tostring(Player.UserId) .."&width=420&height=420&format=png",
			["content"] = msg,
			["allowed_mentions"] = {
				["parse"] = ""
			}
		}

		local newdata = game:GetService("HttpService"):JSONEncode(data)

		local headers = {
			["content-type"] = "application/json"
		}

		request = http_request or request or HttpPost or syn.request

		local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}

		request(abcdef)
	end)
end
