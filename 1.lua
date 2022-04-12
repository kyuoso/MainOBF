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
