Function createSearchScreen() as void
    port = CreateObject("roMessagePort")
    screen = CreateObject("roSearchScreen")
    
    screen.SetBreadcrumbText("", "Search")
    screen.SetMessagePort(port) 

    screen.SetSearchTermHeaderText("Suggestions:")
    screen.SetSearchButtonText("search")
    screen.SetClearButtonEnabled(false)
    screen.Show() 
    While true
        msg = wait(0, screen.GetMessagePort()) 
        if type(msg) = "roSearchScreenEvent"
            if msg.isScreenClosed() then
                return
            else if msg.isCleared()
                history.Clear()
            else if msg.isPartialResult()
                searchResults = GetSearchSuggestions(msg.GetMessage())
                screen.SetSearchTerms(searchResults)
            else if msg.isFullResult()
                if(msg.GetMessage().trim() = "")
                    showMessageDialog("Search text cannot be blank", "Error")
                else
                    navigate("searchController", "search", msg.GetMessage())
                end if
            end if
        endif
    end while 
End Function 
 

Function GetSearchSuggestions(searchTerm as string) as object
    list = []

    if(searchTerm.trim() = "")
        return list
    end if

    suggestions = getServiceByName("search").findKeyboardBySearchTerm(searchterm)

    if(suggestions.count() > 0)
        for i = 0 to suggestions.count() - 1
            list.push(suggestions[i].Name.Get())
        end for
        return list
    end if

    return list
end Function