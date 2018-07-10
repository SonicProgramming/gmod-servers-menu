--Getting the config
local Config = MenuConfig or {}

--Mapping units to pixels depending on screen resolution, this makes the frame look almost the same on different screens
local is4by3 = ScrW()/ScrH() == 4/3

local xunit
local yunit

if is4by3 then
	xunit = ScrW() / 120
	yunit = ScrH() / 90
else
	xunit = ScrW() / 160
	yunit = ScrH() / 90
end

--When someone wants to open the menu
net.Receive("someone_said_servers", function()

--Create the host frame
local hFrame = vgui.Create("DFrame")
	hFrame:ShowCloseButton(false) --We want custom close button
	hFrame:SetDraggable(true)
	hFrame:SetDeleteOnClose(true)
	hFrame:SetTitle(Config.WindowTitle)
	local adding = 1 --The window looks weird without this
	if Config.ServersAmount == 1 then adding = 2.5 end
	hFrame:SetSize(xunit * 15, yunit*adding + yunit*4*Config.ServersAmount) --Adjust the size
	hFrame:Center()
	function hFrame:Paint(w, h) --2 boxes. One main and one for the title and the close button
		draw.RoundedBox(Config.SmoothCorners, 0, 0, w, h, Config.WindowColor)	
		draw.RoundedBox(Config.SmoothCorners, 0, 0, w, yunit*2, Config.WindowColor)
	end
	hFrame:SetVisible(true)
	
local closeButton = vgui.Create("DButton", hFrame)
	closeButton:SetPos(xunit*12, 0) --Upper-right corner of the window
	closeButton:SetSize(xunit*3, yunit*2) --Will be 3 by 2 units - a very good size
	closeButton:SetText("X") --To make sure the user understands what this button is for
	function closeButton:DoClick()
		hFrame:SetVisible(false)
	end
	function closeButton:Paint( w, h )
		draw.RoundedBox( Config.SmoothCorners, 0, 0, w, h, Config.ButtonColor )
	end

local count = 0

--For each entry in servers create a button
for k, v in pairs (Config.Servers) do
	local btn = vgui.Create("DButton", hFrame)
	btn:SetText(k)
	btn:SetSize(xunit * 14, yunit * 3) --That will be 14 by 3 size
	btn:SetPos(xunit/2, yunit*3 + yunit*3.5*count) --Placed 0.5 yunits below previous button
	function btn:Paint(w, h)
		draw.RoundedBox(Config.SmoothCorners, 0, 0, w, h, Config.ButtonColor)	
	end
	function btn:DoClick() --And will run clientside console command
		LocalPlayer():ConCommand("connect " .. v)	
	end
	
	count = count + 1
end
	
--Show the frame
hFrame:MakePopup()

end)