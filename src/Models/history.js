const connection = require('../Configs/dbMySql');

const historyModels={
  getAllHistory : ()=>{
    return new Promise ((resolve,reject)=>{
      const queryString = `SELECT history.invoice, history.cashier, transaction.orders, history.date, history.amount FROM ( SELECT orders.invoice as invoice, GROUP_CONCAT(products.product_name) as orders FROM orders , products WHERE orders.product_id = products.id GROUP BY orders.invoice) as transaction JOIN history ON transaction.invoice = history.invoice`;
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

module.exports = historyModels;