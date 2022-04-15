if game.PlaceId == 1962086868 then
	local MessageBox = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/NotificationGUI/main/source.lua"))()
	local AkaliNotif = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))();
	local NotifyDaHood = AkaliNotif.Notify;
	NotifyDaHood({
		Description = "Game Detected: Tower Of Hell ( Kinda Buggy ATM )";
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
