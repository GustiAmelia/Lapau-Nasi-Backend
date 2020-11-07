const historyModels = require('../Models/history');
const formResponse = require('../Helpers/form/formResponse');

const historyControllers ={
  getAllHistory : (_,res)=>{
    historyModels
    .getAllHistory()
    .then((results)=>{
      formResponse.success(res,results,200)
    })
    .catch((error)=>{
      formResponse.err(res,error,500)
    })
  }
}

module.exports = historyControllers;