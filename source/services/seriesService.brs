Function seriesService() as object
	this = createBaseMediaService()
	this.mediaType = "tv"
    this.getOnTheAir = OnTheAir
    this.getAiringToday = AiringToday
	this.map = mapSerie

	return this
end Function

Function OnTheAir() as object
    apiUrl = buildApiCallUrl("tv/on_the_air", "")

    return m.getMediaFromService(apiUrl)
end Function

Function AiringToday() as object
    apiUrl = buildApiCallUrl("tv/airing_today", "")

    return m.getMediaFromService(apiUrl)
end Function


Function mapSerie(response) as object
	return series().mapFromJSON(response)
end Function