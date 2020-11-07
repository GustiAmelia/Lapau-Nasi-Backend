const express = require('express');

const categoryControllers = require('../Controllers/category');

const categoryRouter = express.Router();

categoryRouter.get('/',categoryControllers.getAllCategory)

module.exports = categoryRouter;