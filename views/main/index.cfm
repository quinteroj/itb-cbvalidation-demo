<cfoutput>
    <h1 class="mt-3">
        Landing Page
    </h1>
    <p>
        Simple registration form with no validations
    </p>

    <hr>

    <div>
        <h1>Create User</h1>
        <form action="/users" method="post">
            <div class="form-group">
                <label for="name">Name:</label>
                <input name="name" class="form-control" placeholder="Enter full name" id="name" value="#encodeForHTMLAttribute( event.getValue( "name", "" ) )#">
            </div>
            <div class="form-group">
                <label for="telephone">Telephone:</label>
                <input name="telephone" class="form-control" placeholder="Enter telephone" id="telephone">
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
                <th></th>
			</tr>
            <tr >
				<td>#user.name#</td>
				<td>#user.email#</td>
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