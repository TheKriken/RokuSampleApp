Function createBaseMediaModel() as object 
     model = {
     	Id: {
	        Set       : function(x) : m.Value = x : end function
	        Get       : function() : return m.Value : end function
	        Value     : 0	
     	}
     	Poster: {
     		Set: 		function(x): m.Value = x : end function
     		Get: 		function(): return m.Value : end function
     		Value 		: ""
     	}
     	Overview: {
     		Set: 		function(x): m.Value = x : end function
     		Get: 		function(): return m.Value : end function
     		Value 		: ""
     	}
     	Genre: {
     		Set: 		function(x): m.Value = x : end function
     		Get: 		function(): return m.Value : end function
     		Value 		: ""
     	}
     	ReleaseDate: {
     		Set: 		function(x): m.Value = x : end function
     		Get: 		function(): return m.Value : end function
     		Value 		: ""
     	}
     	Actors: {
     		Set: 		function(x): m.Value = x : end function
     		Get: 		function(): return m.Value : end function
     		Value 		: {}
     	}
     	Director: {
     		Set: 		function(x): m.Value = x : end function
     		Get: 		function(): return m.Value : end function
     		Value 		: []
     	}
     	Runtime: {
     		Set: 		function(x): m.Value = x : end function
     		Get: 		function(): return m.Value : end function
     		Value 		: 0
     	}
     	Runtime: {
     		Set: 		function(x): m.Value = x : end function
     		Get: 		function(): return m.Value : end function
     		Value 		: 0
     	}

     	Genres: {
     		Set: 		function(x): m.Value = x : end function
     		Get: 		function(): return m.Value : end function
     		Value 		: {}
     	}

     	Tagline: {
     		Set: 		function(x): m.Value = x : end function
     		Get: 		function(): return m.Value : end function
     		Value 		: ""
     	}
     	BackdropImage: {
     		Set: 		function(x): m.Value = x : end function
     		Get: 		function(): return m.Value : end function
     		Value 		: ""
     	}
     	Rating: {
     		Set: 		function(x): m.Value = x : end function
     		Get: 		function(): return m.Value : end function
     		Value 		: ""
     	}
     } 
     return model 
end Function