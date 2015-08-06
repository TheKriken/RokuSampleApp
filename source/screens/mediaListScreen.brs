Function createMediaListScreen(list as object, mediaType as string, breadcrumb as object) as Void
    port = CreateObject("roMessagePort")
    screen = CreateObject("roListScreen")
    screen.SetMessagePort(port)
    screen.SetContent(list)
    setScreenBreadcrumb(screen, breadcrumb)
    screen.Show()

    while true
        msg = wait(0, screen.GetMessagePort()) 
        if type(msg) = "roListScreenEvent"
        	print type(msg)
            if msg.isScreenClosed() then
                return 
	         else if msg.isListItemSelected() then
	         	if(mediaType = "movies") then
	         		navigate("movieController", "Details", list[msg.GetIndex()].Id)
	         	else if (mediaType = "series")
	         		navigate("seriesController", "Details", list[msg.GetIndex()].Id)
	         	end if
	             
	         end if
        end if
    end while	
end Function