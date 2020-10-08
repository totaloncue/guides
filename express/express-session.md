# Express Session Overview

[Reference](https://github.com/expressjs/session)

## What it is

1. Session middleware for Express
1. Only session ID is stored in cookie
   1. Session data is stored server-side in a memory store of choice
      1. Default memory store intended for development only as it will develop leaks
      1. Recommended to use Redis as backing data store

## Gotchas

1. If using cookie-parser, secret must be same
1. Set a specific name for each session ID cookie that corresponds to app name to prevent overlaps

## Important Options

1. cookie
   1. settings object for session ID cookie with below defaults:

    ```json
    {
        path: `/`,
        httpOnly: true,
        secure: false,
        maxAge: null
    }
    ```

1. cookie-domain
    1. settings for 'Domain Set-Cookie' attribute
    1. default is no domain => clients will consider cookie to apply only to current domain
1. cookie.expires
   1. should be set via maxAge property
   1. by default no expiration => clients will delete on a condition like exiting a web browser application
1. cookie.httpOnly
1. cookie.maxAge
   1. specifies number in milliseconds to use when calculating the 'Expires Set-Cookie' attribute
   1. default => no maxAge
1. cookie.path
   1. value for 'Path Set-Cookie'
   1. default is '/'
1. cookie.sameSite
   1. value for 'SameSite Set-Cookie'
1. cookie.secure
   1. 'Secure Set-Cookie' attribute
   1. => browser must use HTTPS to interact with site
1. 'genid'
   1. Function that generates new session Ids
1. name
   1. name of the session ID cookie
   1. default is 'connect.sid'
1. resave
    1. Forces session to be saved back to session store even if session was not modified during the request
    1. default is true but use of default is deprecated
    1. recommended is false if memory store of choice allows it
        1. if store implements 'touch' then safe to use false
1. saveUninitialized
   1. recommended is false
1. secret
   1. secret used to sign the session ID cookie
   1. can be a string or an array of multiple strings
      1. with an array, first value will be used to sign while all will be used to verify
   1. recommended to
      1. use env variable to store secrets
      1. periodically update secret while adding to the secrets array
1. store
    1. session store instance
    1. defaults to MemoryStore
