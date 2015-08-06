Function setAppTheme() as Void
	'Theme Settings
	app = CreateObject("roAppManager")	

    theme = {
        GridScreenOverhangHeightHD: "100"
        GridScreenOverhangHeightSD: "100"
        GridScreenLogoOffsetHD_X: "15"
        GridScreenLogoOffsetHD_Y: "15"
        GridScreenLogoOffsetSD_X: "15"
        GridScreenLogoOffsetSD_Y: "15"
    }

	app.SetTheme( theme )
end Function