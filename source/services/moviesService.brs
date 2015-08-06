Function moviesService() as Object

    service = createBaseMediaService()
    service.mediaType = "movie"
    service.getNowPlaying = getNowPlaying
    service.getUpcoming = getUpcoming
    service.map = mapMovie

    return service
End Function

Function getNowPlaying() as object
    apiUrl = buildApiCallUrl("movie/now_playing", "")

    return m.getMediaFromService(apiUrl)
end function

Function getUpcoming() as object
    apiUrl = buildApiCallUrl("movie/upcoming", "")

    return m.getMediaFromService(apiUrl)
end Function

Function mapMovie(response) as object
   return movie().mapFromJSON(response)
end Function