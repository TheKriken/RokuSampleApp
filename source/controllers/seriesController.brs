Function seriesController() as object
	controller = {
		Popular: function() as Void
			seriesList = getServiceByName("series").getPopular()
			list = getPosterObjectsFromMediaModel(seriesList)
            breadcrumb = createBreadCrumb(true, "series", "popular")
			createMediaListScreen(list, "series", breadcrumb)
		end function

		TopRated: function() as Void
			seriesList = getServiceByName("series").getTopRated()
			list = getPosterObjectsFromMediaModel(seriesList)
            breadcrumb = createBreadCrumb(true, "series", "popular")
			createMediaListScreen(list, "series", breadcrumb)
		end function

		OnTheAir: function() as Void
			seriesList = getServiceByName("series").getOnTheAir()
			list = getPosterObjectsFromMediaModel(seriesList)
            breadcrumb = createBreadCrumb(true, "series", "popular")
			createMediaListScreen(list, "series", breadcrumb)
		end function

		AiringToday: function() as Void
			seriesList = getServiceByName("series").getAiringToday()
			list = getPosterObjectsFromMediaModel(seriesList)
            breadcrumb = createBreadCrumb(true, "series", "popular")
			createMediaListScreen(list, "series", breadcrumb)
		end Function

		Details: Function(id as Integer) as Void
			thisSerie = getServiceByName("series").getById(id)
			crew = getServiceByName("series").getCrew(id)
			thisSerie.Actors.Set(crew.actors)
			thisSerie.Director.Set(crew.Director)
			breadcrumb = createBreadCrumb(true, "TV Shows", thisSerie.Name.Get())
			createMediaDetailsScreen(thisSerie, "tv", breadcrumb)	
		end Function
	}

	return controller
end Function