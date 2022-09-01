<cfoutput>
    <h1 class="mt-3">
        Demo App Version 4
    </h1>

    <p>
        Customize error messages and use custom validators!
    </p>
    <ul>
        <li>
            Set custom error messages for all the fields
        </li>
        <li>
            Use a closure/lambda validator to make a special validation on the user name field
        </li>
        <li>
            Use a custom validator to make sure we don't allow duplicate emails in the DB
        </li>
    </ul>

    <hr>

    <div>
        <h1>Create User</h1>
        <form action="/v4/users" method="post">
            <div class="form-group">
                <label for="name">Name:</label>
                <input name="name" class="form-control" placeholder="Enter full name" id="name" value="#encodeForHTMLAttribute( event.getValue( "name", "" ) )#">
            </div>
            <div class="form-group">
                <label for="fname">Age:</label>
                <input name="age" class="form-control" placeholder="Enter age" id="age" value="#encodeForHTMLAttribute( event.getValue( "age", "" ) )#">
            </div>
            <div class="form-group">
                <label for="email">Email Address:</label>
                <input name="email" class="form-control" placeholder="Enter email" id="email" value="#encodeForHTMLAttribute( event.getValue( "email", "" ) )#">
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input name="password" type="password" class="form-control" placeholder="Enter password" id="password">
            </div>
            <button type="submit" class="btn btn-primary">Register</button>
        </form>
    </div>

    <hr>

    <cfloop index="currentIndex" item="user" array="#prc.users#">
        <table>
            <tr >
				<th style="width: 200px;">Name</th>
				<th style="width: 200px;">Email</th>
				<th style="width: 200px;">Age</th>
                <th></th>
			</tr>
            <tr >
				<td>#user.name#</td>
				<td>#user.email#</td>
				<td>#user.age#</td>
                <td class="ml-3">
                    <form action="/delete" method="post">
                        <input type="hidden" value="#user.id#" name="id">
                        <button type="submit" class="btn btn-danger">Delete</button>
                    </form>
                </td>
			</tr>
        </table>
    </cfloop>
</cfoutput>