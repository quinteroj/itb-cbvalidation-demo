component {

	// Module Properties
	this.title              = "cbValidation Demo app v5";
	this.author             = "Javier Quintero";
	this.description        = "Version 5";
	// If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
	this.viewParentLookup   = true;
	// If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
	this.layoutParentLookup = true;
	// Module Entry Point
	this.entryPoint         = "v5";
	// Model Namespace
	this.modelNamespace     = "v5";
	// CF Mapping
	this.cfmapping          = "v5";
	// Module Dependencies
	this.dependencies       = [];

	function configure(){
		// module settings - stored in modules.name.settings
		settings = {};

		// Layout Settings
		layoutSettings = {};

		// Custom Declared Points
		interceptorSettings = { customInterceptionPoints : "" };

		// Custom Declared Interceptors
		interceptors = [];
	}

	/**
	 * Fired when the module is registered and activated.
	 */
	function onLoad(){
	}

	/**
	 * Fired when the module is unregistered and unloaded
	 */
	function onUnload(){
	}

}
