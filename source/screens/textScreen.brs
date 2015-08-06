Function createTextScreen(title as string, text as string) as Void
	port = CreateObject("roMessagePort") 
	screen = CreateObject("roParagraphScreen") 
	screen.SetMessagePort(port) 
	screen.SetTitle(title) 
	screen.AddParagraph(text) 
	screen.Show() 
	wait(0, screen.GetMessagePort())
end Function