
Sub Main()
	' Initialize Theme
	setAppTheme()

	' Initiliaze Global variables
	initGlobalVariables()

	' Initialize View Controller
	viewController = createViewController()
	'Debug("ViewController Initialized")

	' Initialize Main View
	viewController.homeController().Index()
	'Debug("Main Controller Index Initialized")

	

End Sub


Function createServices() as object
    services = {
        movies: moviesService()
        series: seriesService()
        search: searchService()
    }

    return services
end Function

