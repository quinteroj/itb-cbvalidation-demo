<cfoutput>
    <h1 class="mt-3">
        Demo App Version 5
    </h1>

    <p>
        Add more fields to the form and use conditional validators
    </p>
    <ul>
        <li>
            A new flag for employees that needs to be a boolean value (true/false)
        </li>
        <li>
            Validate values in list and nested constraints
        </li>
        <li>
            Validate additional fields only if it's an employee
        </li>
    </ul>

    <hr>

    <div>
        <h1>Create User</h1>
        <form action="/v5/users" method="post">
            <div class="form-group">
                <label for="name">Name:</label>
                <input name="name" class="form-control" placeholder="Enter full name" id="name" value="#encodeForHTMLAttribute( event.getValue( "name", "" ) )#">
            </div>
            <div class="form-group">
                <label for="fname">Age:</label>
                <input name="age" class="form-control" placeholder="Enter age" id="age" value="#encodeForHTMLAttribute( event.getValue( "age", "" ) )#">
            </div>
            <div class="form-group form-check">
                <label class="form-check-label">
                    <input name="isEmployee" value="true" class="form-check-input" type="checkbox"> Is Employee?
                </label>
            </div>
            <div class="form-group">
                <label for="role" class="mr-3">Role:</label>
                <select
                        name="role"
                        id="role"
                        class="form-check-input"
                    >
                    <option value="admin">
                        Admin
                    </option>
                    <option value="hr">
                        HR
                    </option>
                    <option value="member" selected="selected">
                        Member
                    </option>
                    <option value="fakeRole">
                        Invalid Role
                    </option>
                </select>
            </div>
            <div class="form-group">
                <label for="telephone">Telephone:</label>
                <input name="telephone" class="form-control" placeholder="Enter telephone" id="telephone" value="#encodeForHTMLAttribute( event.getValue( "telephone", "" ) )#">
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <input name="address" class="form-control" placeholder="Enter address" id="address" value="#encodeForHTMLAttribute( event.getValue( "address", "" ) )#">
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
				<th style="width: 200px;">Is Employee</th>
				<th style="width: 200px;">Role</th>
				<th style="width: 200px;">Telephone</th>
				<th style="width: 200px;">Address</th>
                <th></th>
			</tr>
            <tr >
				<td>#user.name#</td>
				<td>#user.email#</td>
				<td>#user.age#</td>
				<td>#user.isEmployee ? "Yes": "No"#</td>
				<td>#user.role#</td>
				<td>#user.telephone#</td>
				<td>#user.address#</td>
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