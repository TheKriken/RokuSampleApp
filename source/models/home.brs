Function createHomeModel(id as Integer, title, subtitle, posterImage) as object
	model = homeModel()
	model.Id.Set(id)
	model.Title.Set(title)
	model.subtitle.Set(subtitle)
	model.PosterImage.Set(posterImage)
	return model
end Function

Function homeModel() as object 
     model = {	
     	Id: {
	        Set       : function(x as Integer) : m.Value = x : end function
	        Get       : function() : return m.Value : end function
	        Value     : 0
     	}
     	Title: {
        	Set       : function(x) : m.Value = x : end function
	        Get       : function() : return m.Value : end function
	        Value     : ""
     	}
     	Subtitle: {
	        Set       : function(x) : m.Value = x : end function
	        Get       : function() : return m.Value : end function
	        Value     : ""
     	}
     	PosterImage: {
	        Set       : function(x) : m.Value = x : end function
	        Get       : function() : return m.Value : end function
	        Value     : ""
     	}
     } 
     return model 
end Function