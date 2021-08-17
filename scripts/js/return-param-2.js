var http = require('http');
var querystring = require('querystring');
var utils = require('util');
var url = require('url');

http.createServer(function (request, response) {

  var parsed= url.parse(request.url, true);
  var context = parsed.path;
  if(context){
	  if(context.substring(0,4) == "/api"){
              response.writeHead(200, {'Content-Type': 'text/plain'});
	      response.write("Fake-failure-from-node");
          } else {
              response.writeHead(200, {'Content-Type': 'text/plain'});
	      context = context.substring(1, context.length);
	      var newString = context.replace("n","-");
	      response.write(newString);
	  }
  }else{

           response.writeHead(200, {'Content-Type': 'text/plain'});
	   response.write("0");
  }
  response.end();

}).listen(80);
