const connection = require('../Configs/dbMySql');

const transactionModels ={
  addTransaction: (body) => {
    const { invoice, cashier, amount, transaction } = body;
    return new Promise((resolve, reject) => {
      const startTransaction = `START TRANSACTION;`;
      const firstQuery = `INSERT INTO history SET invoice = ?, cashier = ?, amount = ?;`;
      const secondQuery = `INSERT INTO orders (invoice, product_id, quantity) VALUES ?;`;
      const endTransaction = `COMMIT;`;
      const joinQuery = startTransaction + firstQuery + secondQuery + endTransaction;
      let arrOfQuery = transaction.map((item) => {
          return [invoice, item.product_id, item.quantity]
      });
      connection.query(joinQuery, [invoice, cashier, amount, arrOfQuery], (error,results) => {
          if (!error) {
              resolve(results);
          } else {
              reject(error);
          }
      })
    })
}
}

module.exports = transactionModels;