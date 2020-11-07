const transactionModels = require('../Models/transaction');
const formResponse = require('../Helpers/form/formResponse');

const transactionControllers ={
  addTransaction : (req,res)=>{
    transactionModels
    .addTransaction(req.body)
    .then((results)=>{
      formResponse.success(res,req.body,200)
    })
    .catch((error)=>{
      formResponse.err(res,error,500)
    })
  }
}

module.exports = transactionControllers;