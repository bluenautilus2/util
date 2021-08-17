var http = require('http');
var querystring = require('querystring');
var utils = require('util');
var url = require('url');

http.createServer(function (request, response) {

  var body = "";
  request.on('data', function (chunk) {
    body += chunk;
  });

  request.on('end', function () {

    var parsed= url.parse(request.url, true);
    var context = parsed.path;
    if(context){
              response.writeHead(200, {'Content-Type': 'text/plain'});
	      context = context.substring(1, context.length);
	      console.log("Got a request. Method: "+ request.method);
	      console.log("Path: " + context);
	      console.log("Payload: " + body);
	      console.log("---------");
	      var newString = "Success";
	      response.write(newString);
              response.end();
    }else{
	   console.log("Unknown request returning 200");
           response.writeHead(200, {'Content-Type': 'text/plain'});
	   response.write("No path params");
           response.end();
    }
  });
}).listen(80);
