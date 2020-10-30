const express = require('express');

const authControllers = require('../Controllers/auth');

const authRouter = express.Router();

authRouter.post('/register',authControllers.postNewUser)
authRouter.post('/login',authControllers.login)

module.exports = authRouter;