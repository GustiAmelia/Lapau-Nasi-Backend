//IMPORT
const connection =require('../Configs/dbMySql');
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

const authModels = {
  postNewUser : (body)=>{
    return new Promise((resolve,reject)=>{
      const querySelectEmail = 'SELECT email FROM users WHERE email = ?';
      connection.query(querySelectEmail,[body.email],(error,results)=>{
        if(!results){
          reject(error)
        }
        if(results.length){
          reject({
            msg:'Email already registered'
          })
        }
        else{
          bcrypt.genSalt(10,(error,salt)=>{
            if(error){
              reject(error);
            }
            const{password}=body;
            bcrypt.hash(password,salt,(error,hashedPassword)=>{
              if(error){
                reject(error);
              }
              const newBody={...body, password:hashedPassword};
              const qs = 'INSERT INTO users SET ?';
              connection.query(qs,newBody,(error,results)=>{
                if(!error){
                    resolve(results);
                }else{
                    reject(error);
                }
              });
            });
          })
        }
      })
    });
  },
  loginUser :(body)=>{
    return new Promise((resolve,reject)=>{
      const qs ='SELECT * FROM users WHERE email=?';
      connection.query(qs,body.email,(error,results)=>{
        if(error){
          reject(error)
        }
        if(!results.length){
          reject('User Not Found');
        }
        else{
          bcrypt.compare(body.password, results[0].password,(error,isSame)=>{
            if(isSame){
              const {email}=body;
              const {level_id}=results[0];
              const payload={
                email,
                level_id,
              };
              const token = jwt.sign(payload,process.env.SECRET_KEY,{
              });
              const data =results[0];
              const msg ='Login Success';
              resolve({msg,token,data});
            }
            if(!isSame){
              reject({msg:'Wrong Password'});
            }
            if(error){
              reject(error);
            }
          });
        }
      })
    })
  }
}

module.exports = authModels;