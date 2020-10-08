const routes = require('express').Router();

const get = require('../../../controllers/map/get');

routes.get('/', get);

module.exports = routes;