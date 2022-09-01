/**
 * Main Handler
 */
component extends="coldbox.system.EventHandler" {

	property name="userService" inject="quickService:User";

	/**
	 * Show main page
	 */
	function index( event, rc, prc ){
		prc.users = userService
			.from( "users" )
			.asMemento( profile = "full" )
			.get();

		event.setView( "main/index" );
	}

	/**
	 * Create User Function
	 */
	function createUser( event, rc, prc ){
		event.paramValue( "isEmployee", false );
		event.paramValue( "role", "" );
		event.paramValue( "telephone", "" );
		event.paramValue( "address", "" );

		var newUser = populateModel( "User" );

		// Domain object constraints
		var vResults = validate( newUser );

		if ( vResults.hasErrors() ) {
			cbMessageBox().error( arrayToList( vResults.getAllErrors(), "<br>" ) );
			redirectBack( persist = "name,email,age,isEmployee,role,telephone,address" );
		}

		// Create User
		userService.create( {
			name       : rc.name,
			email      : rc.email,
			password   : rc.password,
			age        : rc.age,
			isEmployee : rc.isEmployee,
			role       : rc.role,
			telephone  : rc.telephone,
			address    : rc.address
		} );

		// Set confirmation message and relocate
		cbMessageBox().success( "The user has been created successfully!" );
		redirectBack();
	}

}
