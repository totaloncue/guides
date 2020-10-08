# PassportJS Overview (with Express apps)

[StackOverflow Tag References](https://stackoverflow.com/questions/tagged/passport.js?tab=Votes)

1. Authentication middleware for Node
1. Single purpose -- to authenticate requests
1. Supports a variety of auth mechanisms or 'strategies'

## Authentication

1. Call passport.authenticate() and specify strategy to employ
    1. Strategies must be configured prior to use
1. Failure
   1. Default is 401 Unauthorized status code and additional route handlers will **NOT** be invoked
1. Success
   1. Next route handler will be invoked
   1. res.user property will be set to the authenticated user
1. Redirects
   1. Commonly issued after authenticating a request
   1. Overrides the default behaviour e.g. in below success => user redirected to home page, failure => back to login page

   ```javascript
   app.post('/login',
   passport.authenticate('local', { successRedirect: '/',
                                   failureRedirect: '/login' }));
    ```

1. Flash messages
    1. Requires a req.flash() function
        1. Use of connect-flash middleware required
    1. Often combined with redirects to display status info to the user

    ```javascript
    app.post('/login', 
    passport.authenticate('local', { successRedirect: '/',
                                   failureRedirect: '/login',
                                   failureFlash: true })
    ```

    1. failureFlash === true => instructs Passport to flash an error message using message given by the strategy's verify callback
);
1. Sessions
    1. Successful auth => Passport establishes a persistent login session
    1. Useful for apps accessed via browser
    1. Not needed for API routes and similar
        1. Set the session option to false to disable
1. Custom callbacks
    1. Can be used in instances when built-in options are insufficient

## Configuration

1. Three pieces of config needed:
    1. Authentication strategies
    1. Application middleware
    1. Sessions (optional)

1. Verify callbacks
    1. All strategies need verify callbacks 
    1. Purpose of verify callback is to find the user that possesses a set of credentials
    1. When Passport authenticates:
        1. It parses the credentials contained in a request
        1. Invokes the verify callback with those credentials as arguments
        1. If credentials are valid, verify callback invokes `done` to supply Passport with the user that authenticated

        ```javascript
        return done(null, user)
        ```

        1. If credentials are invalid, invoke done with false instead of user

        ```javascript
        return done(null, false)
        ```

        1. If an exception occurred while verifying the credentials, invoke donw with an error

        ```javascript
        return done(err)
        ```

1. Middleware
    1. passport.initialize() required to initialize Passport
        1. passport.session() must also be initialized if persistent login sessions needed

    ```javascript
    var session = require("express-session"),
        bodyParser = require("body-parser");

    app.use(express.static("public"));
    app.use(session({ secret: "cats" }));
    app.use(bodyParser.urlencoded({ extended: false }));
    app.use(passport.initialize());
    app.use(passport.session());
    ```


## Username & Password

## OpenID

## OAuth

## User Profile
