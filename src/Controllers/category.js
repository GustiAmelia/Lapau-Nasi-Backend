const categoryModels = require('../Models/category');
const formResponse = require('../Helpers/form/formResponse');

const categoryControllers ={
  getAllCategory : (_,res)=>{
    categoryModels
    .getAllCategory()
    .then((results)=>{
      formResponse.success(res,results,200)
    })
    .catch((error)=>{
      formResponse.err(res,error,500)
    })
  }
}

module.exports = categoryControllers;