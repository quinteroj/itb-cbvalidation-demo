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
			"name" : {
				required        : true,
				type            : "alpha",
				size            : "3..50",
				requiredMessage : "Please enter the user full name",
				typeMessage     : "The name cannot contain any numbers or special characters",
				sizeMessage     : "The name must be in a range between 3 and 50 characters",
				udf             : ( name ) => {
					if ( isNull( arguments.name ) ) return true;
					return !lCase( arguments.name ) eq "admin";
				},
				udfMessage : "The name [{rejectedValue}] cannot be used. Please try another one :)"
			},
			"email" : {
				required         : true,
				type             : "email",
				size             : "4..100",
				requiredMessage  : "Please enter your email address",
				typeMessage      : "Your email address is invalid!",
				sizeMessage      : "The email must be in a range between 3 and 50 characters",
				uniqueInDatabase : { "table" : "users", "column" : "email" }
			},
			"password" : {
				required        : true,
				size            : "8..100",
				requiredMessage : "Please enter your password",
				sizeMessage     : "The password must be in a range between 8 and 100 characters",
				regex           : "^([a-z0-9A-Z]*[A-Z-0-9-$&+,:;=?@##|<>.^*()%!-]+[a-z0-9A-Z]*)",
				regexMessage    : "The password that you entered doesn't meet the requirements"
			},
			"age" : {
				required        : true,
				type            : "numeric",
				range           : "16..100",
				requiredMessage : "Please enter your age",
				typeMessage     : "Your age must be numeric",
				rangeMessage    : "I am sorry. This user is either too old and too young to have an account :("
			}
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
