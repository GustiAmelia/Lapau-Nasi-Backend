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
      const queryString =`SELECT p1.id, product_name ,product_image AS image, price, category,p2.id AS category_id FROM products AS p1 INNER JOIN categories AS p2 ON p1.category_id = p2.id LIMIT ? OFFSET ?`;
      connection.query(queryString,[Number(limit),offset],(error,results)=>{
        if(!error){
          resolve(results)
        }
        else{
          reject(error)
        }
      })
    })
  },
  deleteProduct : (query)=>{
    return new Promise((resolve,reject)=>{
      const queryString ='DELETE FROM products WHERE id=?';
      connection.query(queryString,[query.id],(error,results)=>{
          if(!error){
              resolve(results);
          }else{
              reject(error);
          }
      })
    });
  },
  updateProduct :(body)=>{
    return new Promise((resolve,reject)=>{
      const { id } = body;
      const queryString = `UPDATE products SET ? WHERE products.id=?`;
      connection.query(queryString,[body, body.id],(error,results)=>{
          if(!error){
              resolve(results);
          }else{
              reject(error);
          }
      });
    });
},
}

module.exports = productModels; 