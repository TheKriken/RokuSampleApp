Function registry() as object
	this = {
		get: Function(key as string) As Dynamic
		     sec = CreateObject("roRegistrySection", m.registrySectionName.Get())
		     if sec.Exists(key) 
		         return sec.Read(key)
		     end if
		     return invalid
		End Function
		set: Function(key as string, value as Dynamic) as Void
			sec = CreateObject("roRegistrySection", m.registrySectionName.Get())
			sec.Write(key, value)
		end Function
		registrySectionName: {
	         Set       : function(x as string) : m.Value = x : end function
	         Get       : function() : return m.Value : end function
	         Value     : "AppCache"
		}
	}

	return this
end Function