Roku Tomatoes App

Change the make file IP address to be able to deploy correctly in your roku app. AppName in make file should match the name of the root folder.

* Makefile line 52 - ROKU_DEV_TARGET = Your.Ip.Home
* Makefile line 50 - APPNAME = RootFolderName
