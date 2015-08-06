Function createViewController() as object
	controllers = {}
	controllers["homeController"] = homeController
	controllers["movieController"] = movieController
	controllers["searchController"] = searchController
	controllers["seriesController"] = seriesController
	return controllers
end Function