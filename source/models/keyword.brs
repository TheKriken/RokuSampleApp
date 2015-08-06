Function createKeywordModel() as object
	model = {
		Id: {
	    	Set       : function(x) : m.Value = x : end function
	        Get       : function() : return m.Value : end function
	        Value     : 0
		}

		Name: {
			Set       : function(x) : m.Value = x : end function
	    	Get       : function() : return m.Value : end function
	    	Value     : ""
		}
	}

	return model
end function