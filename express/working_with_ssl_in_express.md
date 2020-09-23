# How to create an https server in Express

[Stack Overflow reference](https://stackoverflow.com/questions/11804202/how-do-i-setup-a-ssl-certificate-for-an-express-js-server)

Example shown on Stack Overflow:

```javascript
var fs = require("fs"),
  http = require("http"),
  https = require("https"),
  express = require("express");

var port = 8000;

var options = {
  key: fs.readFileSync("./ssl/privatekey.pem"),
  cert: fs.readFileSync("./ssl/certificate.pem"),
};

var app = express();

var server = https.createServer(options, app).listen(port, function () {
  console.log("Express server listening on port " + port);
});
```
