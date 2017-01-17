#!/usr/bin/env node

var arg2 = process.argv[2];
//process.stdout.write("arg2: " + arg2 + '\n');

 var fs = require("fs");
 var content = fs.readFileSync(arg2);
 process.stdout.write("Output Content : \n"+ content);

