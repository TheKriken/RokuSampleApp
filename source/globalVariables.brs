Function initGlobalVariables() as Void
	setGlobalVar("ApiKey", "<Your Api Key>")
	setGlobalVar("ApiUrl", "https://api.themoviedb.org")
	setGlobalVar("ApiVersion", "3")
	setGlobalVar("ApiImageUrlSD", "http://image.tmdb.org/t/p/w154")
	setGlobalVar("ApiImageUrlHD", "http://image.tmdb.org/t/p/w154")
	setGlobalVar("services", createServices())
end Function

Function setGlobalVar(key as string, value as dynamic) as Void	
	GetGlobalAA().AddReplace(key, value)
end Function


Function getGlobalVar(name)
    Return GetGlobalAA().Lookup(name)
end Function

Function IsHDScreen()
	device = CreateObject("roDeviceInfo")
	
    If device.GetDisplayType() = "HDTV" Then
        GetGlobalAA().AddReplace("isHD", true)
    Else
        GetGlobalAA().AddReplace("isHD", false)
    End If
end Function


Function getServiceByName(name)
	print getGlobalVar("services").Lookup(name)
	return getGlobalVar("services").Lookup(name)
end Function
