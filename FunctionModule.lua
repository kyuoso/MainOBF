local FUCKYOU = {}

function FUCKYOU.ServerHop()
	pcall(function()
		local Servers = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games" .. game.PlaceId .. "/servers/Public?sortOrder=AscZ&limit=100"))
		spawn(function()
			while wait(1) do
				for i, v in pairs(Servers.data) do
					if v.playing ~= v.maxPlayers then
						wait(1.5)
						game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v.id)
					end
				end
			end
		end)
	end)
end

return FUCKYOU
