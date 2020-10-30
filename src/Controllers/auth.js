const authModels = require('../Models/auth');
const formResponse = require('../Helpers/form/formResponse');

const authControllers ={
  postNewUser : (req,res)=>{
    authModels
    .postNewUser(req.body)
    .then((results)=>{
      formResponse.success(res,req.body,200)
    })
    .catch((error)=>{
      formResponse.err(res,error,500)
    })
  },
  login:(req,res)=>{
    authModels
    .loginUser(req.body)
    .then((results)=>{
      formResponse.success(res,results,200);
    })
    .catch((error)=>{
      formResponse.err(res,error,500);
    })
  }
}

module.exports = authControllers;