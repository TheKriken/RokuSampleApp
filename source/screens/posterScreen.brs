Function createPosterScreen(list, breadcrumb, navigation) as Void
	port = CreateObject("roMessagePort")
	poster = CreateObject("roPosterScreen")
	poster.SetBreadcrumbText("RokuTomatoes", "Home")
	poster.SetTitle("Home")
	poster.SetMessagePort(port) 
	poster.SetContentList(homeMenuList)
	poster.Show() 

	While true
	    msg = wait(0, port)
	    if msg.isScreenClosed() then
	        return
	    else if msg.isListItemSelected()
	        print "msg: ";msg.GetMessage();"idx: ";msg.GetIndex()
	        index = msg.GetIndex()
	        if(index > navigation.count())
	        	showMessageDialog("Sorry, we could not navigate to the selected action", "Service Error")
	        end if
	        navigation[msg.GetIndex()]()
	    end if
	end While
end Function