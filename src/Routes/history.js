const express = require('express');

const historyControllers = require('../Controllers/history');

const historyRouter = express.Router();

historyRouter.get('/',historyControllers.getAllHistory);

module.exports = historyRouter;