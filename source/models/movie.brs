Function movie() as object
	this = {	
		mapFromJSON: Function(kind as object) As Object
			model = movieModel()
			model.Id.Set(kind.id)
			model.Title.Set(kind.title) 
			model.Poster.Set(kind.poster_path)
			model.Overview.Set(kind.overview)
			model.ReleaseDate.Set(kind.release_date)
			model.Runtime.Set(kind.Runtime)
			model.Tagline.Set(kind.Tagline)
			model.Genres.Set(kind.genres)
			model.Rating.Set(kind.vote_average)
			model.BackdropImage.Set(kind.backdrop_path)
			return model
		end Function 

	}

	return this
end Function

Function movieModel() as object 
	model = createBaseMediaModel()

	model.Title = {
    	Set       : function(x) : m.Value = x : end function
        Get       : function() : return m.Value : end function
        Value     : ""
	}

	model.mediaType = {
		Get		: function() : return "movie" : end function
	}
    
    return model 
end Function