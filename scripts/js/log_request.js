var http = require('http');
var querystring = require('querystring');
var utils = require('util');
var url = require('url');
http.createServer(function (request, response) {

  response.writeHead(200, {'Content-Type': 'text/plain'});

  var fullBody = '';
    
    request.on('data', function(chunk) {
      // append the current chunk of data to the fullBody variable
      fullBody += chunk.toString();
    });
    
    request.on('end', function() {
    
      // request.est ended -> do something with the data
      response.writeHead(200, "OK", {'Content-Type': 'text/html'});
      
      // parse the received body data
      var decodedBody = querystring.parse(fullBody);
 
      var url_parts = url.parse(request.url, true);
      var query = url_parts.query;
     
      // output the decoded data to the HTTP response.onse          
      console.log("HEADER: ");
      console.log(request.headers); 
      
      response.end();
    });

}).listen(8124);

console.log('Server running at http://127.0.0.1:8124/');
