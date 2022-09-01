<cfoutput>
    <h1 class="mt-3">
        Welcome
    </h1>
    <hr>

    <!--- TODO: Enable this code and make it work :)--->
    <cfif false>
        <div>
            <h1>Change Password</h1>
            <form action="/changePassword" method="post">
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input name="password" type="password" class="form-control" placeholder="Enter password" id="password">
                </div>
                <div class="form-group">
                    <label for="password">Confirm Password:</label>
                    <input name="password2" type="password2" class="form-control" placeholder="Confirm password" id="password2">
                </div>
                <button type="submit" class="btn btn-primary">Update Password</button>
            </form>
        </div>
    </cfif>

</cfoutput>