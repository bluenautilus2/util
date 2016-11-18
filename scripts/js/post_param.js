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
      response.write('<html><head><title>Post data</title></head><body><pre>');
      response.write('<H1>Data dump!</H1>');
      response.write("URL: " + request.url + "</br>Method: "+ request.method+"</br>");
      response.write("GET Params: " + utils.inspect(query)+ "</br>"); 
      response.write('<H1>html header</H1>');
      response.write(utils.inspect(request.headers)); 
      response.write('<H1>Body of Request</H1>');
      response.write(utils.inspect(decodedBody));
      response.write('</pre></body></html>');
      
      response.end();
    });

}).listen(8124);

console.log('Server running at http://127.0.0.1:8124/');
