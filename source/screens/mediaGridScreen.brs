Function mediaGridScreen(gridheaders as object, griditems as object) as object
	port = CreateObject("roMessagePort")
	screen = CreateObject("roGridScreen")
	screen.SetMessagePort(port) 
	rowTitles = []
	
	screen.SetupLists(gridheaders.Count())
	screen.SetListNames(gridheaders) 
	for i = 0 to griditems.count() - 1
	     screen.SetContentList(i, griditems[i]) 
	 end for 
	 
	 screen.Show() 
	 
	 while true
	     msg = wait(0, port)

	     if type(msg) = "roGridScreenEvent" then
            if msg.isScreenClosed() then
                return screen
	         else if msg.isListItemFocused()
	             print "Focused msg: ";msg.GetMessage();"row: ";msg.GetIndex();
	             print " col: ";msg.GetData()
	         else if msg.isListItemSelected()
	            print "Selected msg: ";msg.GetMessage();"row: ";msg.GetIndex();
	            column = msg.GetData()
	            row = msg.GetIndex()
	            mediaItem = griditems[row][column]
         		navigate(mediaItem.mediaType + "Controller", "Details", griditems[row][column].Id)
	             
	         end if
	     endif
	 end while
	 return screen
end Function