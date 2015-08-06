Function createBreadCrumb(isActive as boolean, context as string, title as string) as object
	this = {}

	this.isActive = isActive
	this.context = context
	this.title = title

	return this
end Function