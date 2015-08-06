Function createBaseMediaService() as Object
    service = {
        getById: function(id as integer) as Object
            url = Substitute("{0}/{1}", m.mediaType, StrI(id).trim())

            response = baseService(buildApiCallUrl(url, ""))
 
            if(response = invalid)
                return invalid
            end if  

            model = m.map(response)

            return model
        end Function
        getCrew: function(id as Integer) as Object
            thisId =  StrI(id)
            thisUrl = Substitute("{0}/{1}/credits", m.mediaType, thisId.trim())
            
            response = baseService(buildApiCallUrl(thisUrl, ""))

            if(response = invalid)
                return invalid
            end if

            actors = []
            director = []
            other = []

            for i = 0 to response.cast.count() - 1
                actors.push(response.cast[i])
            end for

            for i = 0 to response.crew.count() - 1
                crewMember = response.crew[i]
                if(crewMember.job = "Director")
                     director.push(crewMember.name)
                else 
                    other.push(crewMember.name)
                end if
            end for

            crew = {}
            crew.actors = actors
            crew.director = director
            crew.other = other

            return crew
        end Function
        getTrailer: function(id as Integer) as Object
            url = Substitute("{0}/{1}/videos", m.mediaType, id)

            response = baseService(buildApiCallUrl(url, ""))

            if(response = invalid)
                return invalid
            end if

            for i = 0 to response.results.count() - 1
                video = response.results[i]
                if(video.type = "Trailer")
                    return video
                end if
            end for

            return ""
        end Function
        getImage: function(id as Integer) as Object
            thisUrl = Substitute("{0}/{1}/images", m.mediaType	, StrI(id).trim())

            response = baseService(buildApiCallUrl(thisUrl, ""))

            return response
        end function
        getBackdropImages: function(id as integer, imageSize as string) as object
            images = m.getImage(id)
            backdropImages = []

            for i = 0 to images.backdrops.count() - 1
                backdropImages.push(images.backdrops[i].file_path)
            end for

            return backdropImages
        end function
        search: function(searchTerm as string) as Object
            if(searchTerm.trim() = "")
                return invalid
            end if

            thisUrl = Substitute("search/{0}", m.mediaType )
            params = Substitute("&query={0}", htmlEncode(searchTerm))

            apiUrl = buildApiCallUrl(thisUrl, params)

            return m.getMediaFromService(apiUrl)
        end function
        getPopular: function() as object
            thisUrl = Substitute("{0}/popular", m.mediaType)

            apiUrl = buildApiCallUrl(thisUrl, "")

            return m.getMediaFromService(apiUrl)
        end function
        getTopRated: function() as object
            thisUrl = Substitute("{0}/top_rated", m.mediaType)

            apiUrl = buildApiCallUrl(thisUrl, "")

            return m.getMediaFromService(apiUrl)
        end function

        getMediaFromService: function(url) as object
            response = baseService(url)

            if(response = invalid)
                return invalid
            end if

            print response
            return m.parseMediaFromService(response.results)
        end function
        parseMediaFromService: function(mediaResults as object) as object
            list = []

            for i = 0 to mediaResults.count() - 1
                kind = mediaResults[i]
                model = m.map(kind)
                list.push(model)
            end for
            return list
        end function
    }

    return service
End Function