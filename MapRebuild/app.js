const express = require('express');
const routes = require('./routes');
const bodyParser = require('body-parser');

const app = express();

app.use(bodyParser.json());
app.use('/', routes);

const startServer = (port = 999) => {
    const server = app.listen(port, function(){
        console.log(`Server running on port ${server.address().port}`);
    });
};

module.exports = startServer;