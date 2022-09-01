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
			.asMemento( profile = "basic" )
			.get();

		event.setView( "main/index" );
	}

	/**
	 * Create User Function
	 */
	function createUser( event, rc, prc ){
		var myConstraints = {
			"name"     : { required : true, type : "alpha", size : "3..50" },
			"email"    : { required : true, type : "email", size : "4..100" },
			"password" : {
				required : true,
				size     : "8..100",
				regex    : "^([a-z0-9A-Z]*[A-Z-0-9-$&+,:;=?@##|<>.^*()%!-]+[a-z0-9A-Z]*)"
			},
			"age" : { required : true, type : "numeric", range : "16..100" }
		};

		// A la carte validation
		var vResults = validate( target = rc, constraints = myConstraints );

		if ( vResults.hasErrors() ) {
			cbMessageBox().error( arrayToList( vResults.getAllErrors(), "<br>" ) );
			redirectBack( persist = "name,email,age" );
		}

		// Create User
		userService.create( {
			name     : rc.name,
			email    : rc.email,
			password : rc.password,
			age      : rc.age
		} );

		// Set confirmation message and relocate
		cbMessageBox().success( "The user has been created successfully!" );
		redirectBack();
	}

}
