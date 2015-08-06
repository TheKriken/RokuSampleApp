Function setScreenBreadcrumb(screen as object, breadcrumb as object) as Void
    if(breadcrumb.isActive = true) 
    	screen.SetBreadcrumbText(breadcrumb.context, breadcrumb.title)
    end if
end Function

Function htmlEncode(text as string) as string
	urlObject = CreateObject("roUrlTransfer")

	return urlObject.Escape(text)
end Function


Function getPosterObjectsFromMediaModel(mediaList) as object
	list = []

	for i=0 to mediaList.count() - 1
		item = parsePosterFromMediaModel(mediaList[i])

		list.push(item)
	end for

	return list
end Function

Function parsePosterFromMediaModel(thisModel) as object
	if thisModel.mediaType.Get() <> "movie" and thisModel.mediaType.Get() <> "serie"
		return invalid
	end if

	item = {}

	item.Id = thisModel.id.get()

	if(thisModel.Poster.Get() <> Invalid)
	    item.SDPosterUrl = createSDImage( thisModel.Poster.Get())
	    item.HDPosterUrl = createHDImage( thisModel.Poster.Get())
	end if

	if(thisModel.mediaType.Get() = "movie")
		item.Title = thisModel.Title.Get()
	else if (thisMOdel.mediaType.Get() = "serie")
		item.Title = thisModel.Name.Get()
	end if

	return item
end FUnction