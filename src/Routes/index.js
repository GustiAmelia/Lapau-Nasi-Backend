//PACKAGE IMPORT
const express = require("express");

//FILEPATH IMPORT
const productRouter = require("./product");
// const categoryRouter = require("./category");
// const historyRouter = require("./history");
const authRouter = require("./auth");
// const checkToken =require("../Helpers/Middlewares/checkToken");
// const transactionRouter = require('./transaction');

//DEKLARASI
const indexRouter = express.Router();

//IMPLEMENTASI

indexRouter.use('/product',productRouter);


// indexRouter.use('/category',categoryRouter);
// indexRouter.use('/history',historyRouter);
// indexRouter.use('/transaction',transactionRouter);
indexRouter.use('/auth',authRouter)

//EXPORTS
module.exports = indexRouter;