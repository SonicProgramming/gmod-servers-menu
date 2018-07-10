--Please only edit this

MenuConfig = {}

MenuConfig.ServersAmount = 1 --The amount of servers you want to show in the menu, must be greater than 0

MenuConfig.WindowTitle = "Servers" --The title of the menu. Must be short!

MenuConfig.WindowColor = Color(100, 100, 100, 150) --RGBA color of the window

MenuConfig.ButtonColor = Color(200, 200, 200, 255) --RGBA color of buttons

MenuConfig.SmoothCorners = 0 --How much to smoothen the corners of window and buttons. 0 means don't make them smooth

MenuConfig.OpenCommand = "!servers" --Chat command to open the menu

MenuConfig.Servers = {	--All your servers and their addresses. Must be ["Name"] : "IP:Port"
	["Name 1"] = "127.0.0.1:27015",
}	--Number of entries must be equal to MenuConfig.ServersAmount
