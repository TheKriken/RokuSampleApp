Function createImage(imageSize as string, imageUrl as string) as string
	if(imageUrl = invalid)
		return ""
	end if

	url = Substitute("{0}{1}", getGlobalVar(imageSize), imageUrl) 
	return url
end Function


Function createSDImage(imageUrl as string) as string
	return createImage("ApiImageUrlSD", imageUrl)
end Function

Function createHDImage(imageUrl as string) as string
	return createImage("ApiImageUrlHD", imageUrl)
end Function