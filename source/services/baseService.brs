Function baseService(url) as object
    
    port = CreateObject("roMessagePort")
    request = createUrlTransfer(true, port)
    request.SetUrl(url)
    if (request.AsyncGetToString())
        while (true)
            msg = wait(0, port)
            if (type(msg) = "roUrlEvent")
                code = msg.GetResponseCode()
                if (code = 200)
                    return ParseJSON(msg.GetString())
                endif
            else if (event = invalid)
                request.AsyncCancel()
            endif
        end while
    endif
    return invalid
end Function

Function buildApiCallUrl(context as string, param as string) as string
	url = Substitute("{0}/{1}/{2}?api_key={3}", getGlobalVar("ApiUrl"), getGlobalVar("ApiVersion"), context, getGlobalVar("ApiKey"))
    print url
	return url + param
end Function

Function createUrlTransfer(isHTTPS as boolean, port as object) as object
    request = CreateObject("roUrlTransfer")
    request.SetMessagePort(port)
    if(isHTTPS)
        request.SetCertificatesFile("common:/certs/ca-bundle.crt")
        request.InitClientCertificates()
    end if
    return request
end Function