Function movieController() as object
	this = {
		NowPlaying: Function() As Void
			movies = getServiceByName("movies").getNowPlaying()

			list = []

            posterList = getPosterObjectsFromMovieModel(movies)

            breadcrumb = createBreadCrumb(true, "movies", "now playing")

			createMediaListScreen(posterList, "movies", breadcrumb)
		end Function

		Popular: Function() As Void
			movies = getServiceByName("movies").getPopular()

			list = []

            posterList = getPosterObjectsFromMovieModel(movies)

            breadcrumb = createBreadCrumb(true, "movies", "popular")

			createMediaListScreen(posterList, "movies", breadcrumb)
		end Function

		TopRated: Function() As Void
			movies = getServiceByName("movies").getTopRated()

			list = []

            posterList = getPosterObjectsFromMediaModel(movies)

            breadcrumb = createBreadCrumb(true, "movies", "top rated")

			createMediaListScreen(posterList, "movies", breadcrumb)
		end Function

		Upcoming: Function() As Void
			movies = getServiceByName("movies").getUpcoming()

			list = []

            posterList = getPosterObjectsFromMediaModel(movies)

            breadcrumb = createBreadCrumb(true, "movies", "upcoming")

			createMediaListScreen(posterList, "movies", breadcrumb)
		end Function

		Details: Function(id as Integer) as Void
			thisMovie = getServiceByName("movies").getById(id)
			crew = getServiceByName("movies").getCrew(id)
			thisMovie.Actors.Set(crew.actors)
			thismovie.Director.Set(crew.Director)
			breadcrumb = createBreadCrumb(true, "movies", thisMovie.Title.Get())
			createMediaDetailsScreen(thisMovie, "movie", breadcrumb)	
		end Function

	}

	return this
end Function

Function getPosterObjectsFromMovieModel(movies) as object
	list = []

	for i=0 to movies.count() - 1
		item = parsePosterFromMovieModel(movies[i])
		list.push(item)
	end for

	return list
end Function

Function parsePosterFromMovieModel(thisModel) as object
	item = {}

	item.Id = thisModel.Id.get()
	item.Title = thisModel.Title.get()

	if(thisModel.Poster.Get() <> Invalid)
	    item.SDPosterUrl = createSDImage( thisModel.Poster.Get())
	    item.HDPosterUrl = createHDImage( thisModel.Poster.Get())
	end if

	return item
end FUnction