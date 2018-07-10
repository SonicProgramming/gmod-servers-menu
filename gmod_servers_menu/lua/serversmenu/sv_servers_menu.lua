util.AddNetworkString("someone_said_servers")

--When someone says the command send a net message to open the window
hook.Add("PlayerSay", "gmod_servers_menu_hook", function(ply, text)
	if text == MenuConfig.OpenCommand then
		net.Start("someone_said_servers")
		net.Send(ply)
	end
end)