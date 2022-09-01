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
			.asMemento()
			.get();

		event.setView( "main/index" );
	}

	/**
	 * Create User Function
	 */
	function createUser( event, rc, prc ){
		var myConstraints = {
			"name"     : { required : true },
			"email"    : { required : true },
			"password" : { required : true }
		};

		// A la carte validation
		var vResults = validate( target = rc, constraints = myConstraints );

		if ( vResults.hasErrors() ) {
			cbMessageBox().error( arrayToList( vResults.getAllErrors(), "<br>" ) );
			redirectBack( persist = "name,email" );
		}

		// Create User
		userService.create( { name : rc.name, email : rc.email, password : rc.password } );

		// Set confirmation message and relocate
		cbMessageBox().success( "The user has been created successfully!" );
		redirectBack();
	}

}
