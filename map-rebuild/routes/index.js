const api = require('./api');
const routes = require('express').Router();

routes.use('/api, api');

routes.get('/', (req, res) => {
    res.status(200).json({message: 'Connected!'});
});

module.exports = routes;