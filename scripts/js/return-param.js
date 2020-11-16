var http = require('http');
var querystring = require('querystring');
var utils = require('util');
var url = require('url');

http.createServer(function (request, response) {

  response.writeHead(200, {'Content-Type': 'text/plain'});
  var parsed= url.parse(request.url, true);
  var context = parsed.path; 
  if(context){
	    context = context.substring(1, context.length);
	    var newString = context.replace("n","-");
	    response.write(newString); 
  }else{
	   response.write("0");
  }
  response.end();

}).listen(8124);

console.log('Server running at http://127.0.0.1:8124/');
