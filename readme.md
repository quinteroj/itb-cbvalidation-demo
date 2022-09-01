## Quick Installation

Each application templates contains a `box.json` so it can leverage [CommandBox](http://www.ortussolutions.com/products/commandbox) for its dependencies.
Just go into each template directory and type:

```
box install
```

This will setup all the needed dependencies for each application template.

Next, edit the `.env` file to have the correct settings for your server.

Create a database called coldbox and populate the `users` table using the sql script that is in the resources/db folder

Install the front end dependencies using Node and NPM:

```
npm install
```

Compile the assets using the provided package scripts:

```
npm run dev
# OR
npm run watch
```

You can then type:

```
box server start
```

And run the application.
