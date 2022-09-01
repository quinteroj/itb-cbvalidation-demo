component extends="quick.models.BaseEntity" accessors="true" {

	property
		name      ="bcrypt"
		inject    ="@BCrypt"
		persistent="false";

	property name="id";
	property name="name";
	property name="email";
	property name="password";
	property name="age";
	property name="role";
	property name="telephone";
	property name="address";

	property
		name   ="isEmployee"
		sqltype="CF_SQL_TINYINT"
		casts  ="BooleanCast@quick";

	this.memento = {
		"defaultIncludes" : [ "id", "name", "email" ],
		"neverInclude"    : [ "password" ],
		"profiles"        : {
			"basic" : {
				"defaultIncludes" : [ "id", "name", "email", "age" ],
				"defaultExcludes" : [ "*" ]
			},
			"full" : {
				"defaultIncludes" : [
					"id",
					"name",
					"email",
					"age",
					"isEmployee",
					"role",
					"telephone",
					"address"
				],
				"defaultExcludes" : [ "*" ]
			}
		}
	};

	/**
	 * --------------------------------------------------------------------------
	 * Validation
	 * --------------------------------------------------------------------------
	 */
	this.constraints = {
		"name" : {
			required        : true,
			type            : "alpha",
			size            : "3..50",
			requiredMessage : "Please enter the user full name",
			typeMessage     : "The name cannot contain any numbers or special characters",
			sizeMessage     : "The name must be in a range between 3 and 50 characters"
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
			sizeMessage     : "The password must be in a range between 8 and 100 characters"
		},
		"age" : {
			required        : true,
			type            : "numeric",
			range           : "16..100",
			requiredMessage : "Please enter your age",
			typeMessage     : "Your age must be numeric",
			rangeMessage    : "I am sorry. This user is either too old and too young to have an account :("
		},
		"isEmployee" : { "required" : false, type : "boolean" },
		"role"       : { type : "string", inList : "admin,hr,member" },
		"telephone"  : { type : "telephone" },
		"address"    : { type : "string" }
	};


	// PROFILES
	this.constraintProfiles = { "login" : "email,password" }

	public User function setPassword( required string password ){
		return assignAttribute( "password", bcrypt.hashPassword( arguments.password ) );
	}

	public boolean function hasPermission( required string permission ){
		return true;
	}

	public boolean function isValidCredentials( required string email, required string password ){
		try {
			var user = newEntity().where( "email", arguments.email ).firstOrFail();
			if ( !user.isLoaded() ) {
				return false;
			}
			return bcrypt.checkPassword( arguments.password, user.getPassword() );
		} catch ( EntityNotFound e ) {
			return false;
		}
	}

	public User function retrieveUserByUsername( required string email ){
		return newEntity().where( "email", arguments.email ).firstOrFail();
	}

	public User function retrieveUserById( required numeric id ){
		return newEntity().findOrFail( arguments.id );
	}

}
