//IMPORT
const connection =require('../Configs/dbMySql');

const productModels ={
  
  postNewProduct : (body)=>{
    return new Promise ((resolve,reject)=>{
      const queryString = 'INSERT INTO products SET ?';
      connection.query(queryString,[body],(error,results)=>{
        if(!error){
          resolve(results)
        }
        else{
          reject(error)
        }
      })
    })
  },
  getAllProduct : (page,limit)=>{
    return new Promise ((resolve,reject)=>{
      const offset = (page-1)*limit;
      const queryString =`SELECT p1.id, product_name ,product_image AS image, price, category FROM products AS p1 INNER JOIN categories AS p2 ON p1.category_id = p2.id LIMIT ? OFFSET ?`;
      connection.query(queryString,[Number(limit),offset],(error,results)=>{
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

module.exports = productModels; 