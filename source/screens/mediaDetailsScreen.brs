Function createMediaDetailsScreen(mediaItem as object, mediaType as string, breadcrumb as object) as Void
    port = CreateObject("roMessagePort")
    screen = CreateObject("roSpringboardScreen")
    setScreenBreadcrumb(screen, breadcrumb)
    screen.SetMessagePort(port) 
    screen.AddButton(0, "See Trailer")
    o = {}
    if(mediaType = "movie")
        o.Title = mediaItem.Title.Get()
        o.Length = mediaItem.Runtime.Get() * 60
        if(mediaItem.Poster.Get() <> invalid)
            o.SDPosterUrl = createSDImage(mediaItem.Poster.Get())
            o.HDPosterUrl = createHDImage(mediaItem.Poster.Get())
        end if
    else
        o.Title = mediaItem.Name.Get()
        o.ContentType = "episode"
        if(mediaItem.BackdropImage.Get() <> invalid)
            o.SDPosterUrl = createSDImage(mediaItem.BackdropImage.Get())
            o.HDPosterUrl = createHDImage(mediaItem.BackdropImage.Get())
        end if

        screen.AddButton(1, "See Seasons")
    end if
    
    o.Description = mediaItem.Overview.Get()

    o.Rating = "NR"
    o.StarRating = str(mediaItem.Rating.Get() * 10).trim()
    o.ReleaseDate = mediaItem.ReleaseDate.Get()
    

    o.Categories = []
    if mediaItem.Genres.Get().count() > 0
        for i = 0 to mediaItem.Genres.Get().count() - 1
            o.Categories.Push(mediaItem.Genres.Get()[i].name)
        end for
    end if

    o.Actors = mediaItem.Actors.Get()
    if mediaItem.Director.Get().count() > 0
        o.Director = mediaItem.Director.Get()[0]
    end if
    
    screen.SetContent(o)
    screen.Show() 
    while True
        msg = wait(0, port)
        if msg.isScreenClosed() Then
            return
        else if msg.isButtonPressed() 
            print "msg: "; msg.GetMessage(); "idx: "; msg.GetIndex()
            if(msg.GetIndex() = 0)
                createVideoScreen({})
            end if
        end if
    end while
end Function