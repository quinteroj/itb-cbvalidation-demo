component extends="coldbox.system.EventHandler" {

	property name="userService" inject="quickService:User";

	/**
	 * Main page
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
		// Create User
		userService.create( { name : rc.name, email : rc.email, password : rc.password } );

		// Set confirmation message and relocate
		cbMessageBox().success( "The user has been created successfully!" );
		relocate( uri = "/" );
	}


	/**
	 * Delete a user
	 */
	function deleteUser( event, rc, prc ){
		param rc.id = 0;

		userService
			.newEntity()
			.where( "id", rc.id )
			.firstOrFail()
			.delete();

		// Set confirmation message and relocate
		cbMessageBox().success( "The user has been deleted successfully!" );

		redirectBack();
	}


	/**
	 * Show Login Page
	 */
	function login( event, rc, prc ){
		event.setView( "Main/login" );
	}

	/**
	 * Show Do Login
	 */
	function doLogin( event, rc, prc ){
		var oUser = populateModel( "User" );

		// validadate or fail
		// validateOrFail( target = oUser, profiles = "login" );

		// sharedConstraint
		var vResults = validateModel( target=rc, constraints="loginForm" );

		// Validate model using a profile
		// var vResults = validateModel( target = oUser, profiles = "login" );

		if ( vResults.hasErrors() ) {
			cbMessageBox().error( arrayToList( vResults.getAllErrors(), "<br>" ) );
			relocate( uri = "/login" );
		} else {
			// Set confirmation message and relocate
			cbMessageBox().success( "The user has been logged in succesfully!" );
			relocate( uri = "/dashboard" );
		}
	}

	/**
	 * Dashboard page
	 */
	function dashboard( event, rc, prc ){
		event.setView( "main/dashboard" );
	}

	/**
	 * change password
	 * 
	 */
	function changePassword( event, rc, prc ){
		// TODO: Implement this, you can use the sharedConstraint 'changePasswordForm' here
	}

	function onException( event, rc, prc ){
		event.setHTTPHeader( statusCode = 500 );
		// Grab Exception From private request collection, placed by ColdBox Exception Handling
		var exception = prc.exception;
		// Place exception handler below:
	}

}
