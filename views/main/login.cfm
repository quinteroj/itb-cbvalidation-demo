<cfoutput>
    <h1>Login</h1>
    <form action="/main/doLogin" method="post">
        <div class="form-group">
            <label for="email">Email Address:</label>
            <input name="email" class="form-control" placeholder="Enter email" id="email">
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input name="password" type="password" class="form-control" placeholder="Enter password" id="password">
        </div>
        <button type="submit" class="btn btn-primary">Login</button>
    </form>

</cfoutput>