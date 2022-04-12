local req = http_request or request or (syn and syn.request) or (fluxus and fluxus.request) or (http and http.request)

local inv = {}

function inv:discordInvite(inviteCode)
req(
   {
       Url = "http://127.0.0.1:6463/rpc?v=1",
       Method = "POST",
       Headers = {
           ["Content-Type"] = "application/json",
           ["origin"] = "https://discord.com",
       },
       Body = game:GetService("HttpService"):JSONEncode(
           {
               ["args"] = {
                   ["code"] = inviteCode,
               },
               ["cmd"] = "INVITE_BROWSER",
               ["nonce"] = "."
           })
   })
  end
return inv
