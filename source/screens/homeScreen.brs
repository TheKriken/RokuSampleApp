Function createHomeScreen(homeMenuList, actions, breadcrumb) as Void
	port = CreateObject("roMessagePort")
	poster = CreateObject("roPosterScreen")
	setScreenBreadcrumb(poster, breadcrumb)
	poster.SetTitle("Home")
	poster.SetMessagePort(port) 
	poster.SetContentList(homeMenuList)
	poster.Show() 

	while true
	    msg = wait(0, port)
	    if msg.isScreenClosed() then
	        return
	    else if msg.isListItemSelected()
	        print "msg: ";msg.GetMessage();"idx: ";msg.GetIndex()
	        actions[msg.GetIndex()]()
	    end if
	end while
end Function

