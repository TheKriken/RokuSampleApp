Function baseNavigation(controllerName as string, actionName as string) as object
	controllers = createViewController()

	controller = controllers[controllerName]

	action = controller().lookup(actionName)

	if(action = invalid)
		return invalid
	end if

	return action

end Function

Function navigate(controllerName as string, actionName as string, parameter=invalid) as object
	action = baseNavigation(controllerName, actionName)

	if(action = invalid)
		return invalid
	end if

	if(parameter = invalid)
		return action()
	end if

	return action(parameter)
end Function