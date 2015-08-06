Function homeController() as object
	print "Home"

	this = {
		Index: Function() as Void
			list = getHomeElementsList()

		    breadcrumb = createBreadCrumb(true, "Home", "Movies")

		    posterList = parseHomeElementToPoster(list)

		    createHomeScreen(posterList, getHomeControllerActions(), breadcrumb)
		end Function
		movies: Function() as Void
			list = movieElementsList()

		    breadcrumb = createBreadCrumb(true, "Home", "Movies")

		    posterList = parseHomeElementToPoster(list)

		    createHomeScreen(posterList, getMovieHomeControllerActions(), breadcrumb)
		end Function
		series: function() as Void
			list = seriesElementsList()

		    breadcrumb = createBreadCrumb(true, "Home", "Series")

		    posterList = parseHomeElementToPoster(list)

		    createHomeScreen(posterList, getSeriesHomeControllerActions(), breadcrumb)
		end Function
	}

	return this

end Function

Function parseHomeElementToPoster(homeElementList as object) as object
		list = []

	    For Each homeElement in homeElementList
	        posterElement = {}
	        posterElement.Title = homeElement.Title.Get()
	        posterElement.ShortDescriptionLine1 = homeElement.Title.Get()
	        posterElement.ShortDescriptionLine2 = homeElement.Subtitle.Get()
	        list.push(posterElement)
	    End For 

	    return list
end function

Function getHomeElementsList() as object
	homeElements = []

	homeElements.push(createHomeModel(1, "Movies", "", ""))
	homeElements.push(createHomeModel(2, "TV Shows", "", ""))
	homeElements.push(createHomeModel(3, "Search", "Search for any movies or tv shows", ""))

	return homeElements
end Function

Function getHomeControllerActions() as object
	this = []

	this.push(function () : navigate("homeController", "movies") : end function)
	this.push(function () : navigate("homeController", "series") : end function)
	this.push(function () : navigate("searchController", "Index") : end function)

	return this
end Function


Function movieElementsList() as object
	movieElements = []

	movieElements.push(createHomeModel(1, "Now Playing", "", ""))
	movieElements.push(createHomeModel(2, "Popular", "", ""))
	movieElements.push(createHomeModel(3, "Top Rated", "", ""))
	movieElements.push(createHomeModel(4, "Upcoming", "", ""))

	return movieElements

end Function

Function getMovieHomeControllerActions() as object
	this = []

	this.push(function () : navigate("movieController", "NowPlaying") : end function)
	this.push(function () : navigate("movieController", "Popular") : end function)
	this.push(function () : navigate("movieController", "TopRated") : end function)
	this.push(function () : navigate("movieController", "Upcoming") : end function)

	return this
end Function

Function getSeriesHomeControllerActions() as object
	this = []

	this.push(function () : navigate("seriesController", "Popular") : end function)
	this.push(function () : navigate("seriesController", "TopRated") : end function)
	this.push(function () : navigate("seriesController", "OnTheAir") : end function)
	this.push(function () : navigate("seriesController", "AiringToday") : end function)

	return this
end Function

Function seriesElementsList() as object
	seriesElement = []

	seriesElement.push(createHomeModel(1, "Popular", "", ""))
	seriesElement.push(createHomeModel(2, "Top Rated", "", ""))
	seriesElement.push(createHomeModel(3, "On The Air", "", ""))
	seriesElement.push(createHomeModel(4, "Airing Today", "", ""))

	return seriesElement

end Function

