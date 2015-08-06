Function series() as object
	this = {	
		mapFromJSON: Function(kind as object) As Object
			model = seriesModel()
			model.Id.Set(kind.id)
			model.Name.Set(kind.name) 
			model.Poster.Set(kind.poster_path)
			model.Overview.Set(kind.overview)
			model.ReleaseDate.Set(kind.first_air_date)
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


Function seriesModel() as object
	model = createBaseMediaModel()

	model.Name = {
    	Set       : function(x) : m.Value = x : end function
        Get       : function() : return m.Value : end function
        Value     : ""
	}

	model.mediaType = {
		Get		: function() : return "serie" : end function
	}
    
    return model 
end function