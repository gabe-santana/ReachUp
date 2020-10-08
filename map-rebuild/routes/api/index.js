const mallPlan = require('./map');
const router = require('express').Router();

router.use('/map', mallPlan);

module.exports = router;