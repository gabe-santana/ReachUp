/*const startServer = require('.');

startServer();*/

const { FILE } = require('dns');

var http = require('http'),
  config = require('./config'),
  fileHandler = require('./fileHandler'),
  parse = require('url').parse,
  types = config.types,
  rootFolder = config.rootFolder,
  defaultIndex = config.defaultIndex,
  server;

  module.exports = server = http.createServer();

  server.on('request', onRequest);

  function onRequest(req, res) {
     var fileName = parse(req.url).pathname,
         fullPath, 
         extension;

     if (fileName === '/'){
         fileName = defaultIndex;
     }

     fullPath = rootFolder + fileName;
     extension = fileName.substr(filename.lastIndexOf('.') + 1);

     fileHandler(fullPath, function(data){
        res.writeHead(200, {
            'Content-Type': types[extension] || 'text/plain',
            'Content-Length': data.length
        });
        res.end(data);
     }, function(err){
           res.writeHead(404);
           res.end();
     });
  }