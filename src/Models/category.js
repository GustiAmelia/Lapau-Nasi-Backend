const connection = require('../Configs/dbMySql');

const categoryModels ={
  getAllCategory : ()=>{
    return new Promise ((resolve,reject)=>{
      const queryString = 'SELECT * FROM categories'
      connection.query(queryString,(error,results)=>{
        if(!error){
          resolve(results)
        }
        else{
          reject(error)
        }
      })
    })
  }
}

module.exports = categoryModels;