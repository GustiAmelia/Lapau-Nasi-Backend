const productModels = require('../Models/product');
const formResponse = require('../Helpers/form/formResponse');

const productControllers ={
  postNewProduct : (req,res)=>{
    productModels
    .postNewProduct(req.body)
    .then((results)=>{
      formResponse.success(res,req.body,200)
    })
    .catch((error)=>{
      formResponse.err(res,error,500)
    })
  },
  getAllproduct : (req,res)=>{
    const{page,limit}=req.query
    productModels
    .getAllProduct(page,limit)
    .then((results)=>{
        formResponse.pagination(req,res,results,200);
    })
    .catch((error)=>{
        formResponse.err(res,error,500);
    })
  },
  deleteProduct:(req,res)=>{
    productModels
    .deleteProduct(req.query)
    .then((results)=>{
        formResponse.success(res,results,200);
    }).catch((error)=>{
        formResponse.err(res,error,500);
    })
  },
  updateProduct:(req,res)=>{
    productModels
    .updateProduct(req.body)
    .then((results)=>{
        formResponse.success(res,req.body,200);
    }).catch((error)=>{
        formResponse.err(res,error,500);
    })
  },
}

module.exports = productControllers;