const express = require('express');

const transactionControllers = require('../Controllers/transaction');

const transactionRouter =express.Router();

transactionRouter.post('/',transactionControllers.addTransaction)


module.exports = transactionRouter;