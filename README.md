# Roku Sample App

Example Roku App

## Configuration
* Provide an api key from [themoviedb.org](themoviedb.org)  **ApiKey** variable in globalVariables.brs

Change the make file IP address to be able to deploy correctly in your roku app. AppName in make file should match the name of the root folder.

* Makefile line 52 - ROKU_DEV_TARGET = Your.Ip.Home
* Makefile line 50 - APPNAME = RootFolderName

