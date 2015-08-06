Function createVideoScreen(episode as object) as object
    if type(episode) <> "roAssociativeArray" then
        print "invalid data passed to showVideoScreen"
        return -1
    endif 
    port = CreateObject("roMessagePort")
    screen = CreateObject("roVideoScreen") 
   	episode.HDBranded = false
   	episode.IsHD = false 
 
	episode.Stream = { 
		url:"http://smf.blob.core.windows.net/samples/videos/bigbuck.mp4",
		bitrate:2000
		quality:false
	}
	episode.StreamFormat = ".mp4"
    screen.SetContent(episode)
    screen.SetMessagePort(port)
    screen.Show() 
    while true
       msg = wait(0, port)
    
       if type(msg) = "roVideoScreenEvent" then
           print "showVideoScreen | msg = "; msg.GetMessage() " | index = "; msg.GetIndex()
           if msg.isScreenClosed()
               print "Screen closed"
               exit while
            else if msg.isStatusMessage()
                  print "status message: "; msg.GetMessage()
            else if msg.isPlaybackPosition()
                  print "playback position: "; msg.GetIndex()
            else if msg.isFullResult()
                  print "playback completed"
                  exit while
            else if msg.isPartialResult()
                  print "playback interrupted"
                  exit while
            else if msg.isRequestFailed()
                  print "request failed – error: "; msg.GetIndex();" – "; msg.GetMessage()
                  exit while
            end if
       end if
    end while
end Function