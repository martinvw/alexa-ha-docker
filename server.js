var AlexaAppServer = require("../index.js");

AlexaAppServer.start({
  app_dir:"apps",
  app_root:"/api/",
  port: 8080,
  // Use preRequest to load user data on each request and add it to the request json.
  // In reality, this data would come from a db or files, etc.
  preRequest: function(json, req, res) {
      console.log("preRequest fired");
 
      // Include password value from URL parameter, so Alexa-HA can validate it...
      json.password = req.param('password').toString();

      // Extract the IP address of the client (handles IPv4 and IPv6)
      var IPFromRequest = req.headers['x-forwarded-for'] || req.connection.remoteAddress;
      var indexOfColon = IPFromRequest.lastIndexOf(':');
      var address = IPFromRequest.substring(indexOfColon+1,IPFromRequest.length);
      json.remoteAddress = address;
  },
  // Add a dummy attribute to the response
  postRequest: function(json, req, res) {
  }
});
