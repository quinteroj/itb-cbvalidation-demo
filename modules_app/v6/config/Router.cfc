component {

	function configure(){
		post( "/users", "Main.createUser" );
		// Main
		get( "/", "Main.index" );
	}

}
