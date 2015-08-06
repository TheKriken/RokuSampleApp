Function searchController() as object
    controller = {
        Index: function() as Void
            createSearchScreen()
        end function
        Search: function(searchTerm as string) as Object
        	titles = []

            lists = []
            thisseries = getServiceByName("series").search(searchTerm)
            thismovies = getServiceByName("movies").search(searchTerm)

            seriesCount = thisseries.count()
            moviesCount = thismovies.count()
            totalMediaCount = seriesCount + moviesCount

            if(totalMediaCount = 0) then
                showMessageDialog("No TV Shows or Movies where found for " + searchTerm, "404")
            else
                seriesList = []

                if(thismovies.count() > 0)
                    titles.push("movies")

                    moviesList = []
                    for i = 0 to moviesCount - 1
                        o = {}
                        o.Id = thismovies[i].Id.Get()
                        o.mediaType = "movie"
                        o.ContentType = "episode"
                        o.Title = thismovies[i].Title.Get()
                        o.Description = thismovies[i].Overview.Get()
                        o.StarRating = thismovies[i].Rating.Get() * 10
                        if(thismovies[i].Poster.Get() <> Invalid)
                            o.SDPosterUrl = createSDImage( thismovies[i].Poster.Get())
                            o.HDPosterUrl = createHDImage( thismovies[i].Poster.Get())
                        end if
                        moviesList.Push(o)
                    end for

                    lists.push(moviesList)
                end if

                if(thisseries.count() > 0)
                    titles.push("tv shows")

                    for i = 0 to seriesCount - 1
                     o = {}
                     o.Id = thisseries[i].Id.Get()
                     o.mediaType = "series"
                     o.ContentType = "episode"
                     o.Title = thisseries[i].Name.Get()
                     o.Description = thisseries[i].Overview.Get()
                     o.StarRating = thisseries[i].Rating.Get() * 10
                    if(thisseries[i].Poster.Get() <> Invalid)
                        o.SDPosterUrl = createSDImage( thisseries[i].Poster.Get())
                        o.HDPosterUrl = createHDImage( thisseries[i].Poster.Get())
                    end if
                     seriesList.Push(o)
                    end for

                    lists.push(seriesList)
                end if

               	mediaGridScreen(titles,lists)
            end if
        end function
    }

    return controller
End Function 
 