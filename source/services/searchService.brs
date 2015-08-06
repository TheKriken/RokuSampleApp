Function searchService() as object
	service = {
		findKeyboardBySearchTerm: function(searchTerm as string) as object
        params = Substitute("&query={0}", htmlEncode(searchTerm))
            
        response = baseService(buildApiCallUrl("search/keyword", params))

        if(response = invalid)
        	return invalid
        end if

        print response
        list = []
        for i = 0 to response.results.count() - 1
        	keyword = response.results[i]
        	model = createKeywordModel()
        	model.Id.Set(keyword.Id)
        	model.Name.Set(keyword.Name)
        	list.push(model)
        end for

        return list
		end function

	}

	return service

end Function