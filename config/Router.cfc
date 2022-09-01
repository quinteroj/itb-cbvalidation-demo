component {

	function configure(){
		// Set Full Rewrites
		setFullRewrites( true );

		/**
		 * --------------------------------------------------------------------------
		 * App Routes
		 * --------------------------------------------------------------------------
		 *
		 * Here is where you can register the routes for your web application!
		 * Go get Funky!
		 *
		 */

		// A nice healthcheck route example
		route( "/healthcheck", function( event, rc, prc ){
			return "Ok!";
		} );

		get( "/login", "Main.login" );
		get( "/dashboard", "Main.dashboard" );

		post( "/users", "Main.createUser" );
		post( "/delete", "Main.deleteUser" );
		// post( "/changePassword", "Main.deleteUser" );

		// Conventions based routing
		route( ":handler/:action?" ).end();
	}

}
